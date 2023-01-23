*** Settings ***
Documentation   This test file contains the test cases of the read user by id endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/users.robot
*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Read By Id valid user valid token
    [Tags]    read_by_id_valid_user_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${user}=    Create Dictionary    email=read-user@mail.com  is_active=true  is_superuser=false  full_name=read-user  password=pass
    ${resp}=    Create User    %{NEF_URL}  ${token.json()['access_token']}  ${user}
    ${user}=    Set Variable    ${resp.json()}
    ${resp}=    Read User By Id    %{NEF_URL}  ${token.json()['access_token']}  ${user}

    Should Contain    ${resp.text}    read-user@mail.com
    Status Should Be    200  ${resp}

Read By Id invalid user valid token
    [Tags]    read_by_id_invalid_user_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${user}=    Create Dictionary    id=-1
    ${resp}=    Read User By Id    %{NEF_URL}  ${token.json()['access_token']}  ${user}

    Should Contain    ${resp.text}    null
    Status Should Be    200  ${resp}

Read By Id user invalid token
    [Tags]    read_by_id_user_invalid_token
    ${user}=    Create Dictionary    id=-1
    ${resp}=    Read User By Id    %{NEF_URL}  ${NEF_INVALID_TOKEN}  ${user}  401

    Status Should Be    401  ${resp}