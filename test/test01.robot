*** Settings ***
Library           Screenshot
Library           Collections
Library           SeleniumLibrary
Resource          D:/robot/test/基础关键字.txt
Resource          业务关键字.txt

*** Variables ***
${abobo}          哈哈

*** Test Cases ***
case1
    Comment    ${a}    set variable    gaga
    Comment    log    ${abobo}
    Comment    log    ${a}
    Comment    ${hi}    Catenate    hello    world
    Comment    log    ${hi}
    打开谷歌浏览器    https://stg.innisfree.cn/Main.do?ref=2
    Close Browser

case2
    Comment    ${t}    get time
    Comment    log    ${t}
    Comment    ${d}    Evaluate    random.randint(1000,9999)    random
    Comment    log    ${d}
    Comment    ImportLibrary    abobo
    Comment    TakeScreenshot
    ${dict}    CreateDictionary    a    1    b    2
    ${itmes}    GetDictionaryItems    ${dict}
    log    ${itmes}
    ${key}    GetDictionaryKeys    ${dict}
    log    ${key}

case3
    Connect To Database Using Custom Params    pymysql    database='test_auto_new', user='root', password='root', host='127.0.0.1', port=3306,charset='utf8'
    ${g}    query    select steps from test_case where id=1
    log    ${g}
    Disconnect From Database
    ${a}    Create List    我们    他们
    log    ${a}

case4(monishouji)
    ${devname}    Create Dictionary    deviceName=iPhone 6
    ${mobile_emulation}    Create Dictionary    mobileEmulation=${devname}
    ${chromeoptions}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys, selenium.webdriver.chrome.options
    ${chromeoptions._experimental_options}    Set Variable    ${mobile_emulation}
    Comment    log    ${chromeoptions}
    Create Webdriver    Chrome    chrome_options=${chromeoptions}
    Go To    https://stg.innisfree.cn/Main.do?ref=2
    sleep    7
    Click Element    xpath=/html/body/header/div/div[5]/img
    Click Element    xpath=/html/body/section[1]/div[2]/div[1]/div
    sleep    1
    Input Text    id=u-id    18850369373
    Input Password    id=u-pw    qwe123
    Comment    Click Button    id=index-bn
    sleep    1
    Comment    Close All Browsers

1
    登陆系统

2
    Open Browser    https://stg.innisfree.cn/Main.do?ref=2    chrome
    Maximize Browser Window
    Comment    Click Element    xpath=//*[@id="wrap"]/div[1]/div[3]/img
    Comment    Set Screenshot Directory    D:\web_ui\AutoLink\pic
    Take Screenshot    jietu
    Comment    Click Element    xpath=//img[@src='/cn_resources/images/newpc/user.png']
    Comment    Click Element    xpath=//*[@id=\"header\"]/div/div[3]/div[3]/div/div/a/span
    Comment    SeleniumLibrary.Input Text    id=email    18850369373
    Comment    SeleniumLibrary.Input Text    id=pwd    qwe123
    Comment    Click Element    xpath=//img[@src='/cn_resources/images/util/btn_login.gif']
    Comment    Add Image Path    D:\\robot\\test\\img
    Comment    Click    9.png

3
    log    ${gaga}

4
    log    ${abobo}
