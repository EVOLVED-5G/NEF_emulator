*** Settings ***
Documentation   This test file contains the test cases of the get notifications endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/ui.robot
Resource        /opt/robot-tests/resources/login.robot

*** Variables ***
${NEF_INVALID_TOKEN}              eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI


*** Test Cases ***
Get notifications valid token
    [Tags]    get_notifications_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get Notifications  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}

Get notifications invalid token
    [Tags]    get_notifications_invalid_token

    ${resp}=    Get Notifications  %{NEF_URL}   ${NEF_INVALID_TOKEN}    401

    Status Should Be    401  ${resp}