*** Settings ***
Documentation       This file contains test cases related to valid login

Resource    ../Resource/Base/Common_Functionalities.Resource

Test Setup      Launch Browser and Navigate To Url
Test Teardown       Close Browser

Test Template       valid login template

*** Test Cases ***
TC1     Admin      admin123        Dashboard

*** Keywords ***
valid login template
    [Arguments]     ${username}     ${password}     ${expected_data}
    Input Text    name=username      ${username}
    Input Password    name=password   ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain      xpath=//h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']       ${expected_data}