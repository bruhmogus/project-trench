#Usage: scan_english_locale.py [merge|translate]

#Script to find russian texts in the en-US locale folder (by checking if they contain Cyrillic)
#uses the same library (fluent) to parse the localization files, so it can detect errors and duplications
#uses a local llm server to batch translations. a [AUTO_EN] tag is added as a comment so is easier to locate the changes and review them (or inspect the commits).
#can join a localization folder into another (ru to en)

#About the duplications and syntax errors:
#When enabled they give the path and position (vscode can jump to the file by clicking on them)
#Each <Locale> still holds a reference to those, so a tool or function can be made to assist on fixing them.

SHOW_WARNINGS=False #for duplications and parsing errors

import sys
command = sys.argv[1] if len(sys.argv) > 1 else None
import json
from pprint import pprint
from pathlib import Path
import re, os
from fluent.syntax import ast, FluentParser, FluentSerializer
from translation_tool import Translator
parser = FluentParser()
serializer = FluentSerializer(with_junk=True)

ENGLISH_DIR = Path("Resources/Locale/en-US") #it contains russian strings
RUSSIAN_DIR = Path("Resources/Locale/ru-RU") #original fallback

class Locale:
    def __init__(self, path:Path):
        self.path:Path=path
        self.files={}
        self.db={}
        self.duplications=[]
        self.junk=[]
        self.load_localization()
        print(f"[INFO] loaded {path.name}.")
        print(f"  duplicated:\t\t{len(self.duplications)}")
        print(f"  invalid:\t\t{len(self.junk)}")
        print(f"  valid:\t\t{len(self.db)}")

    def load_localization(self):
        for path in self.path.rglob("*.ftl"):
            if not path.is_file():
                continue
            try:
                text = path.read_text(encoding="utf-8-sig") #there are some files with utf-8-bom for some reason
            except UnicodeDecodeError:
                continue
            self.files[path]=parser.parse(text)
            for idx,message in enumerate(self.files[path].body):
                if isinstance(message, ast.Junk):
                    annotation = message.annotations[0]
                    error_pos = annotation.span.start
                    line = text.count('\n', 0, error_pos) + 1
                    last_newline = text.rfind('\n', 0, error_pos)
                    column = error_pos - last_newline
                    if SHOW_WARNINGS:
                        print(
                            f"[WARN] {path}:{line}:{column}: "
                            f"{annotation.code} - {annotation.message}"
                        )
                    self.junk.append({
                        "path": path,
                        "idx": idx
                    })
                    continue
                if isinstance(message, ast.Message) and message.value:
                    name=message.id.name.strip()
                    if name in self.db.keys():
                        if SHOW_WARNINGS:
                            print(f"[WARN]: {message.id.name} at {path} is already defined in {self.db[message.id.name]['path']}")
                        self.duplications.append(
                            {
                                "path": path,
                                "idx": idx
                            }
                        )
                        continue
                    self.db[name] = {
                        "path": path,
                        "idx": idx
                    }
# Cyrillic Unicode block(s)
CYRILLIC_RE = re.compile(r"[\u0400-\u04FF]")

ru_loc = Locale(RUSSIAN_DIR)
en_loc = Locale(ENGLISH_DIR)

def get_missing_translations(dst):
    missing_translations={}
    for path in dst.files:
        text = path.read_text(encoding="utf-8-sig")
        dst_parsed = dst.files[path]
        for idx, message in enumerate(dst_parsed.body):
            if not (isinstance(message, ast.Message) and message.value):
                continue
            raw = text[message.id.span.start:message.span.end]
            matches = list(CYRILLIC_RE.finditer(raw))
            if matches:
                if path not in missing_translations:
                    missing_translations[path]=[]
                missing_translations[path].append(
                    {
                        "idx": idx
                    }
                )
    return missing_translations

def find_missing_entries(src:Locale, dst:Locale):
#find missing entries on en-US (from ru-RU)
    missing_entries={}
    for path in src.files:
        src_parsed = src.files[path]
        for idx, message in enumerate(src_parsed.body):
            if not (isinstance(message, ast.Message) and message.value):
                continue
            if not message.id.name in dst.db.keys():
                if path not in missing_entries:
                    missing_entries[path]=[]
                missing_entries[path].append({
                    "path":path,
                    "idx":idx,
                    "key":message.id.name
                })
    return missing_entries

def merge_missing_entries(missing_entries, src:Locale, dst:Locale):
    for src_path in missing_entries:
        src_file = src_path.read_text(encoding="utf-8-sig")
        for entry in missing_entries[src_path]:
            analog_path=Path(str(src_path).replace(src.path.name, dst.path.name))
            parsed_entry = src.files[src_path].body[entry["idx"]]
            raw_entry = src_file[parsed_entry.span.start:parsed_entry.span.end]
            src_id = parsed_entry.id.name
            print(f"[INFO] adding {src_id} to {analog_path}")
            # print(f"[INFO] adding {raw_entry} to {analog_path}")
            os.makedirs(os.path.dirname(analog_path), exist_ok=True)
            with open(analog_path, 'a', encoding='utf8') as file:
                file.write(f"{raw_entry}\n")

en_missing_entries = find_missing_entries(ru_loc, en_loc)
en_missing_translations = get_missing_translations(en_loc)
count_entries = lambda data: sum(map(len, data.values()))
print(f"[INFO] {en_loc.path.name} has {count_entries(en_missing_entries)} missing entries (from {ru_loc.path.name})")
print(f"[INFO] {en_loc.path.name} has {count_entries(en_missing_translations)} entries with russian content (Cyrillic)")

def ensure_indent(text, min_indent=4):
    lines = text.splitlines(keepends=True)
    if len(lines) <= 1:
        return text

    result = [lines[0]]

    # Line 0 establishes the baseline if it already has indentation.
    first_content = lines[0].lstrip(" \t")
    first_indent = len(lines[0]) - len(first_content)

    if first_indent > 0:
        base_indent = first_indent
    else:
        # Otherwise, line 1 establishes the baseline,
        # but cannot be less than min_indent.
        content = lines[1].lstrip(" \t")
        base_indent = max(
            min_indent,
            len(lines[1]) - len(content)
        )

    # content = lines[1].lstrip(" \t")
    # result.append(" " * base_indent + content)

    for line in lines[1:]:
        content = line.lstrip(" \t")
        current_indent = len(line) - len(content)

        if content and current_indent < base_indent:
            line = " " * (base_indent - current_indent) + line

        result.append(line)

    return "".join(result)

def run_translation():
    tr=Translator()
    batch_size=10
    for n_files, path in enumerate(list(en_missing_translations.keys())):
        text=path.read_text(encoding="utf-8-sig")
        tasks=[]
        print(f"[{n_files} of {len(en_missing_translations.keys())}] translating: {path}")
        for i in range(0, len(en_missing_translations[path]), batch_size):
            entry_batch = en_missing_translations[path][i:i + batch_size]
            translation_spans=[]
            translation_batch=[]
            comment_spans=[]
            for entry in entry_batch:
                parsed_entry = en_loc.files[path].body[entry["idx"]]
                value_span=(parsed_entry.value.span.start,parsed_entry.value.span.end)
                raw_id = text[parsed_entry.id.span.start:parsed_entry.id.span.end]
                raw_value = text[value_span[0]:value_span[1]]
                matches = list(CYRILLIC_RE.finditer(raw_value))
                prepare_batch=[]
                
                if matches:
                    prepare_batch.append((
                        (f"{raw_id}",f"{raw_value}"),
                        value_span
                    ))                    
                for a in parsed_entry.attributes:
                    raw_attrib_id = text[a.id.span.start:a.id.span.end]
                    attrib_span=(a.value.span.start,a.value.span.end)
                    raw_attrib_value = text[attrib_span[0]:attrib_span[1]]
                    matches = list(CYRILLIC_RE.finditer(raw_attrib_value))
                    if matches:
                        prepare_batch.append((
                            (f"{raw_id}.{raw_attrib_id}",f"{raw_attrib_value}"),
                            attrib_span
                        ))
                comment_field=(
                    parsed_entry.id.span.start,
                    [x[0] for x,_ in prepare_batch]
                )

                for idx, (t, s) in enumerate(prepare_batch):
                    comment_spans.append(
                        comment_field if (idx==0) else None
                    )
                    translation_batch.append(t)
                    translation_spans.append(s)

                #raw_entry = text[parsed_entry.id.span.start:parsed_entry.span.end]
            results=tr.call_batch(translation_batch)
            #sanitize
            for span, (_ , original), translation, comment in zip(translation_spans, translation_batch, results, comment_spans):
                matches = list(CYRILLIC_RE.finditer(translation))
                if matches:
                    # translation failed
                    continue
                if "</think>" in translation:
                    continue

                # Preserve indentation/leading whitespace from the original
                leading = original[:len(original) - len(original.lstrip())]
                translation = leading + translation.lstrip()

                tasks.append((span, translation, comment))
                print(f"\t{text[span[0]:span[1]]} -> {translation}")
            #task.append()
        result = []
        pos = 0
        for task in tasks:
            replace_span, translation, comment = task
            if comment is not None:
                comment_start, ids= comment
                line_start = text.rfind("\n", 0, comment_start) + 1
                result.append(text[pos:line_start])
                result.append(f"# [AUTO_EN]\n")
                pos=line_start
            line_start = text.rfind("\n", 0, replace_span[0]) + 1
            result.append(text[pos:replace_span[0]])
            result.append(ensure_indent(translation))
            pos = replace_span[1]

        result.append(text[pos:])
        text = "".join(result)

        path.write_text(text, encoding="utf-8")
        print(f"Translated {len(tasks)} entries in {path}")

if __name__ == "__main__":
    if command == "merge":
        print("Merging localization folders...")
        merge_missing_entries(en_missing_entries, ru_loc, en_loc)
    elif command == "translate":
        print("Translating en-US entries")
        run_translation()
    else:
        print("Usage: scan_english_locale.py [merge|translate]")