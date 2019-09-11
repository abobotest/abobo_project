*** Settings ***
Library           SeleniumLibrary
Library           Screenshot
Library           Collections
Resource          etude业务关键字.txt

*** Variables ***
${测试环境}           http://www.etude.cn/

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
    Comment    Close Window
    Comment    关闭浏览器
