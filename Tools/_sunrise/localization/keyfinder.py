import typing
import logging

from pydash import py_

from file import FluentFile
from fluentast import FluentAstAbstract
from fluentformatter import FluentFormatter
from project import Project
from fluent.syntax import ast, FluentParser, FluentSerializer


# Осуществляет актуализацию ключей. Находит файлы английского перевода, проверяет: есть ли русскоязычная пара
# Если нет - создаёт файл с копией переводов из англоязычного
# Далее, пофайлово проверяются ключи. Если в английском файле больше ключей - создает недостающие в русском, с английской копией перевода
# Отмечает русские файлы, в которых есть те ключи, что нет в аналогичных английских
# Отмечает русские файлы, у которых нет англоязычной пары

######################################### Class defifitions ############################################################
class RelativeFile:
    def __init__(self, file: FluentFile, locale: typing.AnyStr, relative_path_from_locale: typing.AnyStr):
        self.file = file
        self.locale = locale
        self.relative_path_from_locale = relative_path_from_locale


class FilesFinder:
    def __init__(self, project: Project):
        self.project: Project = project
        self.created_files: typing.List[FluentFile] = []

    def get_relative_path_dict(self, file: FluentFile, locale):
        if locale == 'ru-RU':
            return RelativeFile(file=file, locale=locale,
                                relative_path_from_locale=file.get_relative_path(self.project.ru_locale_dir_path))
        elif locale == 'en-US':
            return RelativeFile(file=file, locale=locale,
                                relative_path_from_locale=file.get_relative_path(self.project.en_locale_dir_path))
        else:
            raise Exception(f'Локаль {locale} не поддерживается')

    def get_file_pair(self, en_file: FluentFile) -> typing.Tuple[FluentFile, FluentFile]:
        ru_file_path = en_file.full_path.replace('en-US', 'ru-RU')
        ru_file = FluentFile(ru_file_path)

        return en_file, ru_file

    def execute(self):
        self.created_files = []
        groups = self.get_files_pars()
        keys_without_pair = list(filter(lambda g: len(groups[g]) < 2, groups))

        for key_without_pair in keys_without_pair:
            relative_file: RelativeFile = groups.get(key_without_pair)[0]

            if relative_file.locale == 'en-US':
                # ru_file = self.create_ru_analog(relative_file)
                # self.created_files.append(ru_file)
                self.warn_xx_analog_not_exist(relative_file, 'en-US', 'ru-RU')
            elif relative_file.locale == 'ru-RU':
                # is_engine_files = "robust-toolbox" in (relative_file.file.full_path)
                # is_corvax_files = "corvax" in (relative_file.file.full_path)
                #if not is_engine_files and not is_corvax_files:
                    #self.warn_en_analog_not_exist(relative_file)
                en_file=self.create_en_analog(relative_file)
                self.created_files.append(en_file)
                    
            else:
                raise Exception(f'Файл {relative_file.file.full_path} имеет неизвестную локаль "{relative_file.locale}"')

        return self.created_files

    def get_files_pars(self):
        en_fluent_files = self.project.get_fluent_files_by_dir(project.en_locale_dir_path)
        ru_fluent_files = self.project.get_fluent_files_by_dir(project.ru_locale_dir_path)

        en_fluent_relative_files = list(map(lambda f: self.get_relative_path_dict(f, 'en-US'), en_fluent_files))
        ru_fluent_relative_files = list(map(lambda f: self.get_relative_path_dict(f, 'ru-RU'), ru_fluent_files))
        relative_files = py_.flatten_depth(py_.concat(en_fluent_relative_files, ru_fluent_relative_files), depth=1)

        return py_.group_by(relative_files, 'relative_path_from_locale')

    def create_xx_analog(self, src_relative_file: RelativeFile, src='en-US', dst="ru-RU") -> FluentFile:
        src_file: FluentFile = src_relative_file.file
        src_file_data = src_file.read_data()
        dst_file_path = src_file.full_path.replace(src, dst)
        dst_file = FluentFile(dst_file_path)
        dst_file.save_data(src_file_data)
        logging.info(f'Created file {dst_file_path} with translations from the {src} file')
        return dst_file
    
    def create_ru_analog(self, en_relative_file: RelativeFile) -> FluentFile:
        return self.create_xx_analog(en_relative_file)

    def create_en_analog(self, ru_relative_file: RelativeFile) -> FluentFile:
        return self.create_xx_analog(ru_relative_file, 'ru-RU', 'en-US')

    def warn_xx_analog_not_exist(self, src_relative_file: RelativeFile, src,  dst):
        file: FluentFile = src_relative_file.file
        dst_file_path = file.full_path.replace(src, dst)

        logging.warning(f'File {file.full_path} does not have an equivalent at path {dst_file_path}')


class KeyFinder:
    def __init__(self, files_dict, src='en-US', dst='ru-RU'):
        self.src=src
        self.dst=dst
        self.files_dict = files_dict
        self.changed_files: typing.List[FluentFile] = []

    def execute(self) -> typing.List[FluentFile]:
        self.changed_files = []
        for pair in self.files_dict:
            dst_relative_file = py_.find(self.files_dict[pair], {'locale': self.dst})
            src_relative_file = py_.find(self.files_dict[pair], {'locale': self.src})

            if not src_relative_file or not dst_relative_file:
                continue

            dst_file: FluentFile = dst_relative_file.file
            src_file: FluentFile = src_relative_file.file

            self.compare_files(src_file, dst_file)

        return self.changed_files


    def compare_files(self, src_file, dst_file):
        dst_file_parsed: ast.Resource = dst_file.parse_data(dst_file.read_data())
        src_file_parsed: ast.Resource = src_file.parse_data(src_file.read_data())

        self.write_to_xx_files(dst_file, dst_file_parsed, src_file_parsed)
        self.log_not_exist_en_files(src_file, dst_file_parsed, src_file_parsed)


    def write_to_xx_files(self, dst_file, dst_file_parsed, src_file_parsed):
        for idx, src_message in enumerate(src_file_parsed.body):
            if isinstance(src_message, ast.ResourceComment) or isinstance(src_message, ast.GroupComment) or isinstance(src_message, ast.Comment):
                continue

            dst_message_analog_idx = py_.find_index(dst_file_parsed.body, lambda dst_message: self.find_duplicate_message_id_name(dst_message, src_message))
            have_changes = False

            # Attributes
            if getattr(src_message, 'attributes', None) and dst_message_analog_idx != -1:
                if not dst_file_parsed.body[dst_message_analog_idx].attributes:
                    dst_file_parsed.body[dst_message_analog_idx].attributes = src_message.attributes
                    have_changes = True
                else:
                    for src_attr in src_message.attributes:
                        dst_attr_analog = py_.find(dst_file_parsed.body[dst_message_analog_idx].attributes, lambda ru_attr: ru_attr.id.name == src_attr.id.name)
                        if not dst_attr_analog:
                            dst_file_parsed.body[dst_message_analog_idx].attributes.append(src_attr)
                            have_changes = True

            # New elements
            if dst_message_analog_idx == -1:
                dst_file_body = dst_file_parsed.body
                if (len(dst_file_body) >= idx + 1):
                    dst_file_parsed = self.append_message(dst_file_parsed, src_message, idx)
                else:
                    dst_file_parsed = self.push_message(dst_file_parsed, src_message)
                have_changes = True

            if have_changes:
                serialized = serializer.serialize(dst_file_parsed)
                self.save_and_log_file(dst_file, serialized, src_message)

    def log_not_exist_en_files(self, src_file, dst_file_parsed, src_file_parsed):
        for idx, dst_message in enumerate(dst_file_parsed.body):
            if isinstance(dst_message, ast.ResourceComment) or isinstance(dst_message, ast.GroupComment) or isinstance(dst_message, ast.Comment):
                continue

            src_message_analog = py_.find(src_file_parsed.body, lambda src_message: self.find_duplicate_message_id_name(dst_message, src_message))

            if not src_message_analog:
                logging.warning(f'The key "{FluentAstAbstract.get_id_name(dst_message)}" does not have an equivalent at the path {src_file.full_path}"')

    def append_message(self, dst_file_parsed, src_message, src_message_idx):
        dst_message_part_1 = dst_file_parsed.body[0:src_message_idx]
        dst_message_part_middle = [src_message]
        dst_message_part_2 = dst_file_parsed.body[src_message_idx:]
        new_body = py_.flatten_depth([dst_message_part_1, dst_message_part_middle, dst_message_part_2], depth=1)
        dst_file_parsed.body = new_body

        return dst_file_parsed

    def push_message(self,  dst_file_parsed, src_message):
        dst_file_parsed.body.append(src_message)
        return dst_file_parsed

    def save_and_log_file(self, file, file_data, message):
        file.save_data(file_data)
        logging.info(f'В файл {file.full_path} добавлен ключ "{FluentAstAbstract.get_id_name(message)}"')
        self.changed_files.append(file)

    def find_duplicate_message_id_name(self, dst_message, src_message):
        dst_element_id_name = FluentAstAbstract.get_id_name(dst_message)
        src_element_id_name = FluentAstAbstract.get_id_name(src_message)

        if not dst_element_id_name or not src_element_id_name:
            return False

        if dst_element_id_name == src_element_id_name:
            return dst_message
        else:
            return None

######################################## Var definitions ###############################################################

logging.basicConfig(level = logging.INFO)
project = Project()
parser = FluentParser()
serializer = FluentSerializer(with_junk=True)
files_finder = FilesFinder(project)
key_finder = KeyFinder(files_finder.get_files_pars(), src='ru-RU', dst='en-US')

########################################################################################################################

print('Проверка актуальности файлов ...')
created_files = files_finder.execute()
if len(created_files):
    print('Форматирование созданных файлов ...')
    print(created_files)
    FluentFormatter.format(created_files)
print('Проверка актуальности ключей ...')
changed_files = key_finder.execute()
if len(changed_files):
    print('Форматирование изменённых файлов ...')
    FluentFormatter.format(changed_files)
