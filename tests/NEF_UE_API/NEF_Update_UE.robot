*** Settings ***
Documentation   This test file contains the test cases of the update ue endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/ue.robot
Resource        /opt/robot-tests/resources/gnb.robot
Resource        /opt/robot-tests/resources/cells.robot
Library         /opt/robot-tests/libraries/cell_commons.py
Library         /opt/robot-tests/libraries/gnb_commons.py
Library         /opt/robot-tests/libraries/ue_commons.py

*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Update valid ue valid token
    [Tags]    update_valid_ue_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${gnb}=    Run Keyword    Get Gnb
    ${resp}=    Create gNB    %{NEF_URL}  ${token.json()['access_token']}  ${gnb}

    ${gnb}=    Set Variable    ${resp.json()}
    ${cell}=    Run Keyword    Get Cell
    Remove From Dictionary    ${cell}    gNB_id
    ${updated}=    Create Dictionary    &{cell}    gNB_id=${gnb['id']}
        
    ${resp}=    Create Cell    %{NEF_URL}  ${token.json()['access_token']}  ${updated}
    ${cell}=    Set Variable    ${resp.json()}

    ${ue}=    Run Keyword    Get Ue    ${cell['id']}    ${gnb['id']}
    Create UE    %{NEF_URL}  ${token.json()['access_token']}  ${ue}
    Remove From Dictionary    ${ue}    description
    ${updated}=    Create Dictionary    &{ue}    description=updated
    ${resp}=   Update UE    %{NEF_URL}  ${token.json()['access_token']}  ${updated}
    Status Should Be    200  ${resp}

    Delete gNB    %{NEF_URL}  ${token.json()['access_token']}    ${gnb['gNB_id']}
    
    Delete Cell    %{NEF_URL}  ${token.json()['access_token']}    ${cell['cell_id']}

    Delete UE    %{NEF_URL}  ${token.json()['access_token']}    ${ue['supi']}

Update invalid ue valid token
    [Tags]    update_invalid_ue_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${ue}=    Run Keyword    Get Ue    -1    -1
    ${resp}=   Update UE    %{NEF_URL}  ${token.json()['access_token']}  ${ue}    404
    Status Should Be    404  ${resp}

Update ue invalid token
    [Tags]    update_ue_invalid_token

    ${ue}=    Run Keyword    Get Ue    -1    -1
    ${resp}=    Update UE    %{NEF_URL}  ${NEF_INVALID_TOKEN}    ${ue}    401   

    Status Should Be    401  ${resp}