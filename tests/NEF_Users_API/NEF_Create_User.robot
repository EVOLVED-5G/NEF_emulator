*** Settings ***
Documentation   This test file contains the test cases of the create_user endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/users.robot
*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Create valid user valid token
    [Tags]    create_valid_user_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${user}=    Create Dictionary    email=create-user@mail.com  is_active=true  is_superuser=false  full_name=create-user  password=pass
    ${resp}=    Create User    %{NEF_URL}  ${token.json()['access_token']}  ${user}

    Status Should Be    200  ${resp}

Create invalid user valid token
    [Tags]    create_invalid_user_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Create User    %{NEF_URL}  ${token.json()['access_token']}  {}  422
    Status Should Be    422  ${resp}

Create user invalid token
    [Tags]    create_user_invalid_token

    ${resp}=    Create User    %{NEF_URL}  ${NEF_INVALID_TOKEN}  {}  401

    Status Should Be    401  ${resp}