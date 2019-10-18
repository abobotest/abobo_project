# -*- coding: utf-8 -*-
import requests
import random



def random_num(num):
    # 多个字符中生成指定数量的随机字符：
    random_str = random.sample('zyxwvutsrqponmlkjihgfedcba',int(num))
    return ''.join(random_str)

def get_token():
    url="http://39.100.33.100:9010/auth/oauth/token?grant_type=password&username=abobo_gaga&password=63d835ed02ba77d775097e0dcda3f577&client_id=client1&client_secret=123456"
    res = requests.get(url=url)
    res_json = res.json()
    return 'Bearer '+res_json['access_token']

# def get_web_cookie(url,data):
#     res = requests.post(url=url, data=data)
#     cookie = res.cookies
#     cookie = requests.utils.dict_from_cookiejar(cookie)
#     cookies = []
#     for key, value in cookie.items():
#         cookies.append(key + "=" + value)
#     cookie = ";".join(cookies)
#     web_cookie = {}
#     web_cookie["Cookie"] = cookie
#     return web_cookie
#     # op_json = OperetionJson("../dataconfig/web_cookie.json")
#     # op_json.write_data(web_cookie)
#     # return json.dumps(res, ensure_ascii=False)
#
#
# # url='http://idp.ams.bespinglobal.cn/api/auth/login'
# # data={"username":"abobo_gaga","password":"63d835ed02ba77d775097e0dcda3f577"}
# # abobo = get_web_cookie(url,data)
# # print(abobo)
#
#
# def get_app_token(url,data):
#     res = requests.post(url=url,data=data).json()
#     print(res)
#     token = "Bearer " + res["data"]["Token"]
#     app_header = {}
#     app_header["Authorization"] = token
#     # op_json = OperetionJson("../dataconfig/app_token.json")
#     # op_json.write_data(app_header)
#     # return json.dumps(res, ensure_ascii=False)
