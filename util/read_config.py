import configparser
from configparser import NoOptionError, NoSectionError
import os
import codecs


# from src.public.public import Public
# from src.log.log import Log

current_dir = os.path.abspath(os.path.dirname(__file__))
rootPath = os.path.split(current_dir)[0]

# logger = Log()



class GetConfig(object):
    def returnConfig(self):
        config = configparser.ConfigParser()
        config_path = rootPath + "\Config\config"
        config.read(
            filenames=config_path, encoding='utf-8'
        )  # 2018-6-10 END 判断文件的编码类型 如果是UTF-8 BOM格式，则将其转化为无BOM格式
        return config

    @property
    def projectDir(self):
        # return self.returnConfig().get(section="PROJECT", option="projectDir")
        # 不在需要配置项目路径，项目迁移更加灵活。
        return rootPath

    @property
    def is_sendEmail(self):
        try:
            is_sendEmail = self.returnConfig().get(
                section="EMAIL", option="sendEmail"
            )
        except (NoOptionError, NoSectionError):
            is_sendEmail = False
        return is_sendEmail

    @property
    def sub(self):
        try:
            sub = self.returnConfig().get(
                section="EMAIL", option="sub"
            )
        except (NoOptionError, NoSectionError) as e:
            sub = None
        return sub

    @property
    def content(self):
        try:
            content = self.returnConfig().get(
                section="EMAIL", option="content"
            )
        except (NoOptionError, NoSectionError) as e:
            content = None
        return content

    @property
    def argfile(self):
        try:
            argfile = self.returnConfig().get(
                section="PROJECT", option="argfile"
            )
        except (NoOptionError, NoSectionError) as e:
            argfile = None
        return argfile

    @property
    def rfs_projectDir(self):
        try:
            rfs_projectDir = self.returnConfig().get(
                section="PROJECT", option="rfs_projectDir"
            )
        except (NoOptionError, NoSectionError) as e:
            rfs_projectDir = None
        return rfs_projectDir

if __name__ == '__main__':
   a = GetConfig()
   print(a.is_sendEmail)
   print(a.sub)
   print(a.content)