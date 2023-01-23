*** Settings ***
Documentation   This test file contains the test cases of the update gnb endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/gnb.robot
Library         /opt/robot-tests/libraries/gnb_commons.py

*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Update valid gnb valid token
    [Tags]    update_valid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${gnb}=    Run Keyword    Get Gnb
    ${resp}=    Create gNB    %{NEF_URL}  ${token.json()['access_token']}  ${gnb}
    Remove From Dictionary    ${gnb}    description

    ${updated}=    Create Dictionary    &{gnb}    description=updated
    ${resp}=    Update gNB    %{NEF_URL}  ${token.json()['access_token']}  ${updated}
    Status Should Be    200  ${resp}

    ${gnb_id}=     Set Variable    ${gnb['gNB_id']}
    Delete gNB    %{NEF_URL}  ${token.json()['access_token']}    ${gnb['gNB_id']}

Update invalid gnb valid token
    [Tags]    update_invalid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    
    ${dummy}=    Create Dictionary    gNB_id=-1

    ${resp}=    Update gNB    %{NEF_URL}  ${token.json()['access_token']}    ${dummy}    422   

    Status Should Be    422  ${resp}
    
Update gnb invalid token
    [Tags]    update_gnb_invalid_token
    ${dummy}=    Create Dictionary    gNB_id=-1

    ${resp}=    Update gNB    %{NEF_URL}  ${NEF_INVALID_TOKEN}    ${dummy}    401   

    Status Should Be    401  ${resp}