*** Settings ***
Documentation       This file contains test cases for add valid employee
...     records

Resource    ../Resource/Base/Common_Functionalities.Resource

Library     DataDriver      file=../Test_data/Orange_data.xlsx      sheet_name=Add_Employee_Test

Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser

Test Template       Add Valid Employee Test

*** Test Cases ***
TC1_${test_case}
TC2

*** Keywords ***
Add Valid Employee Test
    [Arguments]     ${username}     ${password}     ${firstName}        ${middleName}       ${lastName}
    ...     ${expected_data1}       ${expected_data2}
    Input Text    name=username     ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Click Element    xpath=(//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name'])[2]
    Click Element    xpath=//li[@class='oxd-topbar-body-nav-tab']
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName     ${middleName}
    Input Text    name=lastName    ${lastName}
    Sleep    5s
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space']
    Wait Until Page Contains    ${expected_data1}
    Element Should Contain    xpath=//h6[@class='oxd-text oxd-text--h6 --strong']    ${expected_data1}
    Element Attribute Value Should Be    name=firstName    value        ${expected_data2}



