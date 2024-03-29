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
    Comment    headless_登陆innisfree    ${测试环境}    18850369373    qwe123
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
    手机端登陆innisfree    ${测试环境}    18850369373    qwe123
    手机端清空购物车
    ${old_order_num}    获取手机端各类型订单数量    等待付款
    Comment    log    ${a}
    手机端下单
    ${new_order_num}    获取手机端各类型订单数量    等待付款
    ${expect_number}    Evaluate    int(${old_order_num})+1
    Should Be Equal As Integers    ${new_order_num}    ${expect_number}    #验证总订单数为之前+1
    关闭浏览器

test
    Comment    Comment    配置 headless 启动方式
    Comment    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Comment    Call Method    ${chrome_options}    add_argument    headless
    Comment    Call Method    ${chrome_options}    add_argument    disable-gpu
    Comment    Comment    Call Method    ${chrome_options}    add_argument    no-sandbox
    Comment    ${options}    Run Keyword If    True    Call Method    ${chrome_options}    to_capabilities
    Comment    Open Browser    https://stg.innisfree.cn/Main.do?ref=2    chrome    desired_capabilities=${options}
    Comment    浏览器最大化
    Comment    Set Selenium Implicit Wait    5
    Comment    Set Selenium Speed    0.5
    Comment    PC端关闭页面提示信息
    Comment    聚焦    class=login
    Comment    等待    1
    Comment    Execute Javascript    document.getElementsByClassName("login").click;
    Comment    等待    0.5
    Comment    点击元素    link=登录
    Comment    输入    id=email    18850369373
    Comment    输入    id=pwd    qwe123
    Comment    点击元素    css=#login > img
    Comment    设置执行速度    0.5

0003_验证后台订单
    Comment    登陆innisfree后台    ${后台地址}    Markr    q1w2e3r4
    Comment    验证订单存在    19091215064761
    登陆innisfree    ${测试环境}    18850369373    qwe123
    ${num}    获取最新订单号
    关闭浏览器
    登陆innisfree后台    ${后台地址}    Markr    q1w2e3r4
    验证订单存在    ${num}
    关闭浏览器
