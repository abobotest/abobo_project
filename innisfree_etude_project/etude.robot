*** Settings ***
Suite Setup
Suite Teardown
Test Teardown
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Resource          etude业务关键字.txt
Resource          etude业务关键字_手机端.txt

*** Variables ***
${测试环境}           https://www.etude.cn/

*** Test Cases ***
0001_下单
    登陆etude    ${测试环境}    13799447123    abobo123
    Comment    PC端关闭页面提示信息
    Comment    清空购物车
    ${old_number}    获取各类型订单总数    待付款
    PC端下单流程
    ${new_number}    获取各类型订单总数    待付款
    ${expect_number}    Evaluate    int(${old_number})+1
    Should Be Equal As Integers    ${new_number}    ${expect_number}    #验证总订单数为之前+1
    Close Window
    关闭浏览器
    Comment    log    test_etude1

0001_手机端下单
    手机端登陆etude    ${测试环境}    13799447123    abobo123
    ${old_num}    获取手机端各类型订单数量    待付款
    手机端清空购物车
    手机端下单
    关闭浏览器
    手机端登陆etude    ${测试环境}    13799447123    abobo123
    ${new_num}    获取手机端各类型订单数量    待付款
    ${expect_num}    Evaluate    int(${old_num})+1
    Should Be Equal As Integers    ${new_num}    ${expect_num}    #验证总订单数为之前+1
    关闭浏览器
    Comment    log    test_etude2
