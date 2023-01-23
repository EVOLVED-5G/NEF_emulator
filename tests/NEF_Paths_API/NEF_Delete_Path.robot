*** Settings ***
Documentation   This test file contains the test cases of the delete path endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/path.robot
Library         /opt/robot-tests/libraries/path_commons.py


*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Delete valid path valid token
    [Tags]    delete_valid_path_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${path}=    Run Keyword    Get Path

    ${resp}=    Create Path    %{NEF_URL}  ${token.json()['access_token']}  ${path}

    ${path_id}=     Set Variable    ${resp.json()['id']}
    ${resp}=    Delete Path    %{NEF_URL}  ${token.json()['access_token']}    ${path_id}
    Status Should Be    200  ${resp}

Delete invalid path valid token
    [Tags]    delete_invalid_path_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${resp}=    Delete Path    %{NEF_URL}  ${token.json()['access_token']}   -1    404   

    Status Should Be    404  ${resp}

Create path invalid token
    [Tags]    create_path_invalid_token
    ${path}=    Run Keyword    Get Path
    ${resp}=    Create Path    %{NEF_URL}  ${NEF_INVALID_TOKEN}    ${path}    401   

    Status Should Be    401  ${resp}