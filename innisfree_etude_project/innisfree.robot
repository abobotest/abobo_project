*** Settings ***
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Resource          innisfree业务关键字.txt
Resource          lnnisfree业务关键字_手机端.txt

*** Variables ***
${测试环境}           https://stg.innisfree.cn/Main.do?ref=2
${后台地址}           https://stg.innisfree.cn/AdmLogin.do

*** Test Cases ***
0001_下单
    登陆innisfree    ${测试环境}    18850369373    qwe123
    清空购物车
    ${old_number}    获取我的订单中各类型订单总数    待付款    #获取全部订单的数量
    Comment    log    ${old_number}
    PC端下单流程    面膜    #验证下单成功
    ${new_number}    获取我的订单中各类型订单总数    待付款    #获取全部订单的数量
    Comment    log    ${new_number}
    ${expect_number}    Evaluate    int(${old_number})+1
    Should Be Equal As Integers    ${new_number}    ${expect_number}    #验证总订单数为之前+1
    Close Window
    关闭浏览器

0002_手机端下单
    Comment    手机端登陆innisfree    ${测试环境}    18850369373    qwe123
    Comment    手机端清空购物车
    Comment    ${old_order_num}    获取手机端各类型订单数量    等待付款
    Comment    Comment    log    ${a}
    Comment    手机端下单
    Comment    ${new_order_num}    获取手机端各类型订单数量    等待付款
    Comment    ${expect_number}    Evaluate    int(${old_order_num})+1
    Comment    Should Be Equal As Integers    ${new_order_num}    ${expect_number}    #验证总订单数为之前+1
    Comment    关闭浏览器

手机端test
    Comment    手机端登陆innisfree    ${测试环境}    18850369373    qwe123
    Comment    手机端清空购物车
    Comment    ${old_order_num}    获取手机端各类型订单数量    等待付款
    Comment    Comment    log    ${a}
    Comment    手机端下单
    Comment    ${new_order_num}    获取手机端各类型订单数量    等待付款
    Comment    ${expect_number}    Evaluate    int(${old_order_num})+1
    Comment    Should Be Equal As Integers    ${new_order_num}    ${expect_number}    #验证总订单数为之前+1
    Comment    gggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaa
    Comment    Import Library    D:\\test.py
    Comment    printprint
    Comment    printprint
    Comment    # 配置 headless 启动方式
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    ${options}    Run Keyword If    True    Call Method    ${chrome_options}    to_capabilities
    Comment    Call Method    ${chrome_options}    to_capabilities    ${options}
    Open Browser    https://stg.innisfree.cn/Main.do?ref=2    chrome    desired_capabilities=${options}
    浏览器最大化
    Set Selenium Implicit Wait    5
    Set Selenium Speed    0.5
    PC端关闭页面提示信息
    聚焦    class=login
    等待    1
    点击元素    class=login
    等待    0.5
    点击元素    link=登录
    输入    id=email    18850369373
    输入    id=pwd    qwe123
    点击元素    css=#login > img
    设置执行速度    0.5

0003_验证后台订单
    Comment    Comment    登陆innisfree后台    ${后台地址}    Markr    q1w2e3r4
    Comment    Comment    验证订单存在    19091215064761
    Comment    登陆innisfree    ${测试环境}    18850369373    qwe123
    Comment    ${num}    获取最新订单号
    Comment    关闭浏览器
    Comment    登陆innisfree后台    ${后台地址}    Markr    q1w2e3r4
    Comment    验证订单存在    ${num}
    Comment    关闭浏览器
