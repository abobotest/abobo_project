*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
case1
    Open Browser    https://stg.innisfree.cn/Main.do?ref=2    chrome
    Maximize Browser Window
    Click Element    xpath=//*[@id="wrap"]/div[1]/div[3]/img
    Comment    Sleep    6
    Click Element    xpath=//img[@src='/cn_resources/images/newpc/user.png']
    Click Element    xpath=//*[@id=\"header\"]/div/div[3]/div[3]/div/div/a/span
    SeleniumLibrary.Input Text    id=email    18850369373
    SeleniumLibrary.Input Text    id=pwd    qwe123
    Click Element    xpath=//img[@src='/cn_resources/images/util/btn_login.gif']
