*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../Resource/Base/Common_Functionalities.Resource

library     DataDriver      file=../Test_data/Orange_data.xlsx       sheet_name=Invalid login test

Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser

Test Template       Invalid login template

*** Test Cases ***
TC1


*** Keywords ***
Invalid login template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username      ${username}
    Input Password    name=password   ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']      ${expected_error}
