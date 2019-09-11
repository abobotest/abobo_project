*** Settings ***
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Resource          innisfree业务关键字.txt
Resource          lnnisfree业务关键字_手机端.txt

*** Variables ***
${测试环境}           https://stg.innisfree.cn/Main.do?ref=2

*** Test Cases ***
0001_下单
    登陆innisfree    ${测试环境}    18850369373    qwe123
    清空购物车
    ${old_number}    获取我的订单中各类型订单总数    待付款    #获取全部订单的数量
    Comment    log    ${old_number}
    PC端下单流程    test    #验证下单成功
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

手机端test
    手机端登陆innisfree    ${测试环境}    18850369373    qwe123
    手机端清空购物车
    ${old_order_num}    获取手机端各类型订单数量    等待付款
    Comment    log    ${a}
    手机端下单
    ${new_order_num}    获取手机端各类型订单数量    等待付款
    ${expect_number}    Evaluate    int(${old_order_num})+1
    Should Be Equal As Integers    ${new_order_num}    ${expect_number}    #验证总订单数为之前+1

TESTTEST
    : FOR    ${index}    IN RANGE    10
    \    LOG    ${index}
