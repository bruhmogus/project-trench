#Script to find russian texts in the en-US locale folder (by checking if they contain Cyrillic)
#at some point I'll probably parse and auto translate them.

from pathlib import Path
import re
from fluent.syntax import parse 
from fluent.syntax import ast

ENGLISH_DIR = Path("Resources/Locale/en-US") #it contains russian strings

# Cyrillic Unicode block(s)
CYRILLIC_RE = re.compile(r"[\u0400-\u04FF]")

for path in ENGLISH_DIR.rglob("*"):
    #print(path)
    if not path.is_file():
        continue
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        continue

    matches = list(CYRILLIC_RE.finditer(text))

    if matches:
        print(f"\n{path}")
        
        # Show the lines containing Cyrillic
        for line_number, line in enumerate(text.splitlines(), 1):
            if CYRILLIC_RE.search(line):
                if "=" not in line:
                    print(f"OTHER:  {line_number}: {line}")
                    continue

                string_id, string_value = line.split("=", 1)
                print(f"  {line_number}: {string_id} = {string_value}")
