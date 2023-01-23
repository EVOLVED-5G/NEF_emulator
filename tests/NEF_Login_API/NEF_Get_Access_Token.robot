*** Settings ***
Documentation   This test file contains the test cases of the access_token  endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot

*** Variables ***
${NEF_INVALID_PASSWORD}           changeme

*** Test Cases ***
Get valid access token
    [Tags]    get_valid_access_token

    ${resp}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    Should not be empty     ${resp.json()['access_token']}
    Status Should Be    200  ${resp}

Get invalid access token
    [Tags]    get_invalid_access_token
    ${resp}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    ${NEF_INVALID_PASSWORD}    400
    
    Should not be empty     ${resp.json()['detail']}
    
    Should Be Equal     ${resp.json()['detail']}     Incorrect email or password

    Status Should Be    400  ${resp}