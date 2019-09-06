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
    下单流程    test
    log    abobo

0002_手机端下单
    Comment    移动端登陆innisfree    ${测试环境}    18850369373    qwe123
    Comment    移动端下单演示
    log    gaga
