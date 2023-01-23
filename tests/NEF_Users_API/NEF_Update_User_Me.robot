*** Settings ***
Documentation   This test file contains the test cases of the update user me endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/users.robot
*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Update valid user valid token
    [Tags]    update_valid_user_valid_token
    ${user}=    Create Dictionary    email=update-user-open@mail.com  is_active=true  is_superuser=false  full_name=update-user-open  password=pass
    Create User Open    %{NEF_URL}  ${user}
    ${token}=    Get Access Token    %{NEF_URL}    update-user-open@mail.com    pass
    ${user}=    Create Dictionary    full_name=updated-user  password=pass
    ${resp}=    Update User Me   %{NEF_URL}  ${token.json()['access_token']}  ${user}

    Status Should Be    200  ${resp}


Update user invalid token
    [Tags]    update_user_invalid_token
    ${user}=    Create Dictionary    full_name=updated-user  password=pass
    ${resp}=    Update User Me    %{NEF_URL}  ${NEF_INVALID_TOKEN}  ${user}  401

    Status Should Be    401  ${resp}