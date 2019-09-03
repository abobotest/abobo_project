import os
import time
from util.send_email import *

#测试报告输出
base_dir = '../reports'
now=time.strftime('%Y-%m-%d %H_%M_%S')
report_dir=base_dir+'/'+now+' 自动化测试报告'
report_dir=report_dir.replace(" ","_")
if not os.path.exists(report_dir):
    os.makedirs(report_dir)

#执行命令行操作，运行RFS生成测试报告到report_dir，argfile为运行参数可自行根据需求进行修改。
cmd = 'robot --outputdir '+report_dir+' --argumentfile D:\\abobo_project\\robot_project\\test_project\\argfile.txt D:\\abobo_project\\robot_project\\test_project'
os.system(cmd)

#邮件发送功能
# sub = '自动化测试'
# content = '这是第一轮测试邮件'
# files = get_report_file(report_dir)
# send_email = Email(email_server_user, email_server_user, subject=sub, content=content, files=files)
# send_email.sent()













# robot --outputdir D:\abobo_project\robot_project\reports\a 自动化测试报告 --argumentfile D:\abobo_project\robot_project\test\argfile.txt D:\abobo_project\robot_project\test


# os.system('d: &\
# cd D:\abobo_project\robot_project\venv\Scripts &\
# robot --argumentfile D:\abobo_project\robot_project\test\argfile.txt D:\abobo_project\robot_project\test')

# 'robot --outputdir D:\\abobo_project\\robot_project\\reports --argumentfile D:\\abobo_project\\robot_project\\test\\argfile.txt D:\\abobo_project\\robot_project\\test'