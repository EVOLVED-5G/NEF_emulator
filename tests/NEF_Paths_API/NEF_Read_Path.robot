*** Settings ***
Documentation   This test file contains the test cases of the read path endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/path.robot
Library         /opt/robot-tests/libraries/path_commons.py


*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Read valid path valid token
    [Tags]    read_valid_path_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${path}=    Run Keyword    Get Path

    ${resp}=    Create Path    %{NEF_URL}  ${token.json()['access_token']}  ${path}

    ${path_id}=     Set Variable    ${resp.json()['id']}

    ${resp}=    Read Path    %{NEF_URL}  ${token.json()['access_token']}  ${path_id}
    Status Should Be    200  ${resp}
    Delete Path    %{NEF_URL}  ${token.json()['access_token']}    ${path_id}

Read invalid path invalid token
    [Tags]    read_invalid_path_invalid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${path}=    Run Keyword    Get Path
    ${resp}=    Read Path    %{NEF_URL}    ${token.json()['access_token']}    -1    404   

    Status Should Be    404  ${resp}
    
Read path invalid token
    [Tags]    read_path_invalid_token
    ${path}=    Run Keyword    Get Path
    ${resp}=    Read Path    %{NEF_URL}  ${NEF_INVALID_TOKEN}    -1    401   

    Status Should Be    401  ${resp}