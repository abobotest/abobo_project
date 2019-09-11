import os
import time
import sys

current_dir = os.path.abspath(os.path.dirname(__file__))
rootPath = os.path.split(current_dir)[0]
#放入环境变量
sys.path.append(rootPath)
sys.path.append(rootPath+'\\venv\Scripts')

from util.send_email import *
from util.read_config import GetConfig

#配置文件中获取配置项
my_config = GetConfig()
sendEmail = my_config.is_sendEmail
sub = my_config.sub
content = my_config.content
argfile_path = my_config.argfile
rfs_projectDir_path = my_config.rfs_projectDir
rootPath=my_config.projectDir




#测试报告输出,按时间生成不同文件夹测试报告
# base_dir = rootPath+'/reports'
# now=time.strftime('%Y-%m-%d %H_%M_%S')
# report_dir=base_dir+'/'+now+' 自动化测试报告'
# report_dir=report_dir.replace(" ","_")
# if not os.path.exists(report_dir):
#     os.makedirs(report_dir)

#如果在jenkins上执行，需要固定的目录
report_dir = rootPath + '/reports/test'

#执行命令行操作，运行RFS生成测试报告到report_dir，argfile为运行参数可自行根据需求进行修改。
cmd = 'robot --outputdir '+report_dir+' --argumentfile '+argfile_path+' '+rfs_projectDir_path
os.system(cmd)


# #邮件发送功能
if sendEmail.lower() == "true":
    # sub = '自动化测试'
    # content = '这是第一轮测试邮件'
    files = get_report_file(report_dir)
    send_email = Email(email_server_user, email_server_user, subject=sub, content=content, files=files)
    send_email.sent()














# robot --outputdir D:\abobo_project\robot_project\reports\a 自动化测试报告 --argumentfile D:\abobo_project\robot_project\test\argfile.txt D:\abobo_project\robot_project\test


# os.system('d: &\
# cd D:\abobo_project\robot_project\venv\Scripts &\
# robot --argumentfile D:\abobo_project\robot_project\test\argfile.txt D:\abobo_project\robot_project\test')

# 'robot --outputdir D:\\abobo_project\\robot_project\\reports --argumentfile D:\\abobo_project\\robot_project\\test\\argfile.txt D:\\abobo_project\\robot_project\\test'