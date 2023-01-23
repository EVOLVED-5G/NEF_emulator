*** Settings ***
Documentation   This test file contains the test cases of the read_users_me endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/users.robot
*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Read user me valid token
    [Tags]    read_user_me_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${resp}=    Read User Me    %{NEF_URL}  ${token.json()['access_token']}
    
    Should Contain    ${resp.text}    %{ADMIN_USER}
    Status Should Be    200  ${resp}

Read users me invalid token
    [Tags]    read_user_me_invalid_token

    ${resp}=    Read User Me    %{NEF_URL}  ${NEF_INVALID_TOKEN}  401

    Status Should Be    401  ${resp}