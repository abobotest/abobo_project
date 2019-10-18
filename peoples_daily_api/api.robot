*** Settings ***
Suite Setup       get_config
Test Setup
Library           RequestsLibrary
Library           XML
Library           json
Library           OperatingSystem
Resource          用户账号管理.txt
Resource          基础关键字.txt

*** Variables ***
${username}       abobo_gaga
${password}       63d835ed02ba77d775097e0dcda3f577
${base_url}       http://idp.ams.bespinglobal.cn/api

*** Test Cases ***
login
    &{data}    Create Dictionary    username=abobo_gaga    password=63d835ed02ba77d775097e0dcda3f577
    &{myheader}    Create Dictionary    Content-Type=application/json    Postman-Token=c0e736a2-6be1-48f3-8394-a65727b69c18
    ${postdata}    json.Dumps    ${data}
    Create Session    Demo    http://idp.ams.bespinglobal.cn/api
    ${resp}    Post Request    Demo    auth/login    data=${postdata}    headers=&{myheader}
    log    ${resp.text}
    &{out}    To Json    ${resp.text}
    log    ${out.success}

验证查询角色分类成功
    &{out}    查询角色分类列表
    Should Be Equal As Strings    True    ${out.success}

验证查询角色列表成功
    &{out}    查询角色列表
    Should Be Equal As Strings    True    ${out.success}

验证创建角色成功
    ${var_name}    random_num    8
    &{out}    创建角色    测试角色${var_name}    1    2    ${null}
    Should Be Equal As Strings    True    ${out.success}

验证更新角色成功
    Comment    创建角色后通过角色名字查找对应的角色ID然后进行更新修改
    ${var_name}    random_num    8
    &{out}    创建角色    测试角色${var_name}    1    2    ${null}
    Should Be Equal As Strings    True    ${out.success}
    &{out}    查询角色列表
    @{abobo}    Set Variable    ${out.result.data}
    : FOR    ${var}    IN    @{abobo}
    \    Exit For Loop If    '${var.name}'=='测试角色${var_name}'
    ${out}    更新角色    测试角色更新${var_name}    2    ${null}    ${var.id}
    Should Be Equal As Strings    True    ${out.success}

验证查询以及删除角色成功
    Comment    创建角色后通过角色名字查找对应的角色ID然后进行更新修改
    ${var_name}    random_num    8
    &{out}    创建角色    测试角色${var_name}    1    2    ${null}
    Should Be Equal As Strings    True    ${out.success}
    &{out}    查询角色列表
    @{abobo}    Set Variable    ${out.result.data}
    : FOR    ${var}    IN    @{abobo}
    \    Exit For Loop If    '${var.name}'=='测试角色${var_name}'
    ${out}    查询角色    ${var.id}
    Should Be Equal As Strings    True    ${out.success}
    ${out}    删除角色    ${var.id}
    Should Be Equal As Strings    True    ${out.success}

test
    Comment    get_config
    Comment    log    ${token}
    test

验证创建模板分类成功
    ${var_name}    random_num    5
    &{out}    创建模板分类    测试模板分类${var_name}    2
    Should Be Equal As Strings    True    ${out.success}

验证查询模板分类列表成功
    &{out}    查询模板分类列表
    Should Be Equal As Strings    True    ${out.success}

验证更新模板分类成功
    Comment    创建模板分类后通过分类名字查找对应的分类ID然后进行更新修改
    ${var_name}    random_num    5
    &{out}    创建模板分类    测试模板分类${var_name}    2
    Should Be Equal As Strings    True    ${out.success}
    &{out}    查询模板分类列表
    @{abobo}    Set Variable    ${out.result.data}
    : FOR    ${var}    IN    @{abobo}
    \    Exit For Loop If    '${var.name}'=='测试模板分类${var_name}'
    ${out}    更新模板分类    测试模板分类更新${var_name}    2    ${var.id}
    Should Be Equal As Strings    True    ${out.success}

验证查询以及删除模板分类成功
    Comment    创建模板分类后通过分类名字查找对应的分类ID然后进行单个模板分类查找和删除
    ${var_name}    random_num    5
    &{out}    创建模板分类    测试模板分类${var_name}    2
    Should Be Equal As Strings    True    ${out.success}
    &{out}    查询模板分类列表
    @{abobo}    Set Variable    ${out.result.data}
    :FOR    ${var}    IN    @{abobo}
    \    Exit For Loop If    '${var.name}'=='测试模板分类${var_name}'
    ${out}    查询模板分类    ${var.id}
    Should Be Equal As Strings    True    ${out.success}
    ${out}    删除模板分类    ${var.id}
    Should Be Equal As Strings    True    ${out.success}

验证查询模板列表成功
    &{out}    查询模板列表
    Should Be Equal As Strings    True    ${out.success}

验证查询模板成功（未验证）
    &{out}    查询模板    ${id}
    Should Be Equal As Strings    True    ${out.success}

验证创建模板成功（未验证）
    &{out}    创建模板    ${name}    ${catalogId}    ${policy}
    Should Be Equal As Strings    True    ${out.success}

验证更新模板成功（未验证）
    &{out}    更新模板    ${name}    ${catalogId}    ${policy}    ${policyType}    ${id}
    Should Be Equal As Strings    True    ${out.success}

验证删除模板成功（未验证）
    ${out}    删除模板    ${id}
    Should Be Equal As Strings    True    ${out.success}
