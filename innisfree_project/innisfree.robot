*** Settings ***
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Resource          innisfree业务关键字.txt

*** Variables ***
${测试环境}           https://stg.innisfree.cn/Main.do?ref=2

*** Test Cases ***
0001_下单
    登陆innisfree    ${测试环境}    18850369373    qwe123
    清空购物车
    ${old_number}    获取我的订单中各类型订单总数    css=#contents > div.contentArea > ul.tabType.tabChild5.mgt30 > li.first-child > a > span > strong    #获取全部订单的数量
    Comment    log    ${old_number}
    PC端下单流程    test
    ${new_number}    获取我的订单中各类型订单总数    css=#contents > div.contentArea > ul.tabType.tabChild5.mgt30 > li.first-child > a > span > strong    #获取全部订单的数量
    Comment    log    ${new_number}
    ${expect_number}    Evaluate    int(${old_number})+1
    Should Be Equal As Integers    ${new_number}    ${expect_number}

0002_手机端下单
    移动端登陆innisfree    ${测试环境}    18850369373    qwe123
    移动端下单演示
    Comment    log    gaga

清空购物车
    登陆innisfree    ${测试环境}    18850369373    qwe123
    清空购物车
    Comment    关闭浏览器

test
    登陆innisfree    ${测试环境}    18850369373    qwe123
    刷新页面
    Comment    ${abobo}    获取我的订单中各类型订单总数    css=#contents > div.contentArea > ul.tabType.tabChild5.mgt30 > li.first-child > a > span > strong
    Comment    点击元素    class=user_name
    Comment    点击元素    xpath=//img[@alt='我的订单']
    Comment    Select From List By Value    id=selectboxSearch    21    #选择等待付款
    Comment    ${order_text}    Get Text    css=#contents > div.contentArea > ul.tabType.tabChild5.mgt30 > li.first-child > a > span > strong
    Comment    ${order_number_list}    Evaluate    re.findall('\\d+','${order_text}')    re
    Comment    ${abobo}    Evaluate    int(${order_number_list[0]})+1
    Comment    log    ${abobo}
