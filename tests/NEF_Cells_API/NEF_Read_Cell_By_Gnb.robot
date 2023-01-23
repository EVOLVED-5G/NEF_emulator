*** Settings ***
Documentation   This test file contains the test cases of the read cell by gnb endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/login.robot
Resource        /opt/robot-tests/resources/cells.robot
Resource        /opt/robot-tests/resources/gnb.robot
Library         /opt/robot-tests/libraries/cell_commons.py
Library         /opt/robot-tests/libraries/gnb_commons.py


*** Variables ***
${NEF_INVALID_TOKEN}    eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI

*** Keywords ***


*** Test Cases ***
Read cell valid gnb valid token
    [Tags]    read_cell_valid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${gnb}=    Run Keyword    Get Gnb
    ${resp}=    Create gNB    %{NEF_URL}  ${token.json()['access_token']}  ${gnb}

    ${id}=    Set Variable    ${resp.json()['id']}
    ${cell}=    Run Keyword    Get Cell
    Remove From Dictionary    ${cell}    gNB_id
    ${updated}=    Create Dictionary    &{cell}    gNB_id=${id}
        
    Create Cell    %{NEF_URL}  ${token.json()['access_token']}  ${updated}
    
    ${resp}=     Read Cell By gNB Id   %{NEF_URL}  ${token.json()['access_token']}    ${gnb['gNB_id']}
    Status Should Be    200  ${resp}

    Delete gNB    %{NEF_URL}  ${token.json()['access_token']}    ${gnb['gNB_id']}
    
    Delete Cell    %{NEF_URL}  ${token.json()['access_token']}    ${cell['cell_id']}

Read cell invalid gnb valid token
    [Tags]    read_cell_invalid_gnb_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS} 
    ${resp}=    Read Cell By gNB Id    %{NEF_URL}  ${token.json()['access_token']}    CHANGE    404   

    Status Should Be    404  ${resp}
    
Read cell invalid token
    [Tags]    read_cell_invalid_token
    ${resp}=    Read Cell    %{NEF_URL}  ${NEF_INVALID_TOKEN}    CHANGE    401   

    Status Should Be    401  ${resp}