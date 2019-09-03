""" 发送邮件 """
import smtplib, os, base64
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import os

email_server_user = '365544122@qq.com'
email_server_pwd = 'cntccciewvfbbjah'


class Email(object):
    """
    :param: to_email:字串，收件人地址，多个收件人时用逗号隔开
    :param: from_email:发件人地址
    :param: subject:邮件主题
    :param: content:邮件正文
    :param: files:列表，附件地址，支持多个附件
    :return: 则返发送状态和信息

    attachment是附件：
        attachment = MIMEText(f.read(), 'base64', 'utf-8')
        attachment['Content-Type'] = 'application/octet-stream'
        attachment["Content-Disposition"] = 'attachment; filename="%s"' % file_name
        self.mail.attach(attachment)

    因为阿里云禁用了25端口，smtp = smtplib.SMTP('smtp.qq.com', port=25)将不可用。
    需改用：smtp = smtplib.SMTP_SSL('smtp.qq.com', port=465)

    范例：
        email = Email(
            to_email='****@qq.com',
            from_email='****@qq.com',
            subject='Test',
            content='''
                <b>测试测试</b><br>
                这是我的Email模块！
                <center>send by python_mail</center>
                ''' + str(datetime.now())[:19]
            # file=['./1.png','./2.png']
        )
        email.sent()
    """

    def __init__(self, to_email, from_email, subject='无主题', content=None, files=None):
        self.to_email = to_email  # 收件人
        self.from_email = from_email  # 发件人
        self.subject = subject  # 主题
        self.content = content  # 邮件正文
        self.files = files  # 附件

    def sent(self):
        if self.content or self.files:
            try:
                # 构造邮件
                mail = MIMEMultipart()
                mail['From'] = self.from_email
                mail['To'] = self.to_email
                mail['Subject'] = self.subject

                if self.content:
                    mail.attach(MIMEText(self.content, _subtype='html', _charset='utf-8'))

                # 添加附件
                if self.files:
                    for file in self.files:
                        # 构造附件并添加至邮件
                        try:
                            with open(file, 'rb') as f:
                                attachment = MIMEText(f.read(), 'base64', 'utf-8')
                        except Exception as e:
                            return False, '发送失败:附件["{}"]读取错误【{}】'.format(file, str(e))
                        else:
                            attachment['Content-Type'] = 'application/octet-stream'
                            file_name = os.path.split(file)[1]
                            # 下面一句是处理附件名是中文的情况
                            file_name = '=?utf-8?b?' + base64.b64encode(file_name.encode()).decode() + '?='
                            attachment["Content-Disposition"] = 'attachment; filename="%s"' % file_name
                            mail.attach(attachment)

                # 发送邮件
                smtp = None
                try:
                    smtp = smtplib.SMTP_SSL('smtp.qq.com', port=465)  # 设置邮件服务器
                    smtp.login(email_server_user, email_server_pwd)  # 登录邮件服务器
                    smtp.sendmail(mail['From'], mail['To'].split(','), mail.as_string())  # 发送邮件
                except Exception as e:
                    return False, '发送失败:服务器连接/发送失败【{}】'.format(str(e))
                finally:
                    if smtp:
                        smtp.quit()  # 关闭邮件服务器

                return True, '发送成功'
            except Exception as e:
                return False, '发送失败:{}'.format(str(e))
        else:
            return False, '发送失败:【邮件正文与附件都为空】'

def get_report_file(report_dir):
    '''

    :param report_dir: reports目录下每次执行的报告文件夹
    :return: 返回文件路径的列表
    '''
    try:
        current_dir = os.getcwd()
        base_dir = os.path.dirname(current_dir)
        report_path = os.path.join(base_dir, 'reports', report_dir)
        report_file = os.listdir(report_path)
        get_report_file = []
        for file in report_file:
            get_report_file.append(os.path.join(report_path, file))
        return get_report_file
    except Exception as e:
        return False, '获取报告文件失败：{}'.format(str(e))



if __name__ == '__main__':
    report_dir = '2019-08-27_14_16_46_自动化测试报告'
    aaa = get_report_file(report_dir)
    print(aaa)

    #当前目录
    # os.getcwd()
    # '***获取上级目录***'
    # os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
    # os.path.abspath(os.path.dirname(os.getcwd()))
    #
    # gaga = os.listdir('../reports')

    # gaga = []

    # for file in gaga:
    #     gagaga.append(gaga)
    # gaga = '../reports/2019-08-27_14_16_37_自动化测试报告'
    # gaga = ['D:/abobo_project/robot_project/reports/2019-08-27_14_16_46_自动化测试报告/report.html','D:/abobo_project/robot_project/reports/2019-08-27_14_16_46_自动化测试报告/log.html']


    # email_server_user = '365544122@qq.com'
    # email_server_pwd = 'cntccciewvfbbjah'
    # sub = '自动化测试'
    # content = '这是第二个测试邮件'
    # # os.
    # abobo = Email(email_server_user, email_server_user, subject=sub, content=content, files=aaa)
    # abobo.sent()

