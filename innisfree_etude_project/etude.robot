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
    Comment    登陆etude    ${测试环境}    13799447123    abobo123
    Comment    Comment    PC端关闭页面提示信息
    Comment    Comment    清空购物车
    Comment    ${old_number}    获取各类型订单总数    待付款
    Comment    PC端下单流程
    Comment    ${new_number}    获取各类型订单总数    待付款
    Comment    ${expect_number}    Evaluate    int(${old_number})+1
    Comment    Should Be Equal As Integers    ${new_number}    ${expect_number}    #验证总订单数为之前+1
    Comment    Close Window
    Comment    关闭浏览器

0001_手机端下单
    Comment    手机端登陆etude    ${测试环境}    13799447123    abobo123
    Comment    ${old_num}    获取手机端各类型订单数量    待付款
    Comment    手机端清空购物车
    Comment    手机端下单
    Comment    关闭浏览器
    Comment    手机端登陆etude    ${测试环境}    13799447123    abobo123
    Comment    ${new_num}    获取手机端各类型订单数量    待付款
    Comment    ${expect_num}    Evaluate    int(${old_num})+1
    Comment    Should Be Equal As Integers    ${new_num}    ${expect_num}    #验证总订单数为之前+1
    Comment    关闭浏览器
