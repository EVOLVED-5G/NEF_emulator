*** Settings ***
Documentation   This test file contains the test cases of the qos information endpoints for NEF Emulator API.
Resource        /opt/robot-tests/resources/qos_information.robot
Resource        /opt/robot-tests/resources/login.robot

*** Variables ***
${NEF_INVALID_TOKEN}              eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI


*** Test Cases ***
Get qos characteristics valid token
    [Tags]    get_qos_characteristics_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get QoS Characteristics  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}

Get qos characteristics invalid token
    [Tags]    get_qos_characteristics_invalid_token
    ${resp}=    Get QoS Characteristics    %{NEF_URL}   ${NEF_INVALID_TOKEN}    401

    Status Should Be    401  ${resp}

Get active profiles invalid gnb valid token
    [Tags]    get_active_profiles_invalid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get QoS Active Profiles  %{NEF_URL}   ${token.json()['access_token']}    CHANGE    404

    Status Should Be    404  ${resp}

Get active profiles invalid token
    [Tags]    get_active_profilesinvalid_token
    ${resp}=    Get QoS Active Profiles    %{NEF_URL}   ${NEF_INVALID_TOKEN}    CHANGE    401

    Status Should Be    401  ${resp}