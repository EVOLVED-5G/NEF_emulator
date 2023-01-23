*** Settings ***
Documentation   This test file contains the test cases of the delete cell endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/cells.robot
Resource        /opt/robot-tests/resources/gnb.robot
Library         /opt/robot-tests/libraries/cell_commons.py
Library         /opt/robot-tests/libraries/gnb_commons.py


*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Delete valid cell valid token
    [Tags]    delete_valid_cell_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${gnb}=    Run Keyword    Get Gnb
    ${resp}=    Create gNB    %{NEF_URL}  ${token.json()['access_token']}  ${gnb}

    ${id}=    Set Variable    ${resp.json()['id']}
    ${cell}=    Run Keyword    Get Cell
    Remove From Dictionary    ${cell}    gNB_id
    ${updated}=    Create Dictionary    &{cell}    gNB_id=${id}
        
    Create Cell    %{NEF_URL}  ${token.json()['access_token']}  ${updated}

    ${gnb_id}=     Set Variable    ${gnb['gNB_id']}
    Delete gNB    %{NEF_URL}  ${token.json()['access_token']}    ${gnb['gNB_id']}
    ${cell_id}=     Set Variable    ${cell['cell_id']}
    ${resp}=    Delete Cell    %{NEF_URL}  ${token.json()['access_token']}    ${cell_id}
    Status Should Be    200  ${resp}

Delete invalid cell valid token
    [Tags]    delete_invalid_cell_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${resp}=    Delete Cell    %{NEF_URL}  ${token.json()['access_token']}    -1    404

    Status Should Be    404  ${resp}
    
Delete cell invalid token
    [Tags]    delete_cell_invalid_token
    ${resp}=    Delete Cell    %{NEF_URL}  ${NEF_INVALID_TOKEN}    -1    401   

    Status Should Be    401  ${resp}