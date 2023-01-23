*** Settings ***
Documentation   This test file contains the test cases of the register, login endpoints for NEF Emulator API.
Resource        /opt/robot-tests/resources/default.robot

*** Variables ***

*** Test Cases ***
Access register page
    [Tags]    access_register_page
    ${resp}=    Get Register Page    %{NEF_URL}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Register

Access login page
    [Tags]    access_login_page
    ${resp}=    Get Login Page    %{NEF_URL}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Login