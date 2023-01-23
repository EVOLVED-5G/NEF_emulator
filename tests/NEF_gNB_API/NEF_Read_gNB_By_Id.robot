*** Settings ***
Documentation   This test file contains the test cases of the read gnb by id endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/gnb.robot
Library         /opt/robot-tests/libraries/gnb_commons.py

*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Read by id valid gnb valid token
    [Tags]    read_by_id_valid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${gnb}=    Run Keyword    Get Gnb
    ${resp}=    Create gNB    %{NEF_URL}  ${token.json()['access_token']}  ${gnb}
    ${gnb_id}=     Set Variable    ${gnb['gNB_id']}
    ${resp}=    Read gNB By Id    %{NEF_URL}  ${token.json()['access_token']}  ${gnb_id}
    Status Should Be    200  ${resp}
    Delete gNB    %{NEF_URL}  ${token.json()['access_token']}    ${gnb_id}

Read by id invalid gnb valid token
    [Tags]    read_by_id_invalid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    
    ${resp}=    Read gNB By Id    %{NEF_URL}  ${token.json()['access_token']}    -1    404   

    Status Should Be    404  ${resp}
    
Read by id gnb invalid token
    [Tags]    read_by_id_gnb_invalid_token

    ${resp}=    Read gNB By Id    %{NEF_URL}  ${NEF_INVALID_TOKEN}    -1    401   

    Status Should Be    401  ${resp}