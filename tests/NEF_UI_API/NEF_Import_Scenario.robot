*** Settings ***
Documentation   This test file contains the test cases of the import scenario endpoint for NEF Emulator API.
Library         /opt/robot-tests/libraries/scenario.py
Resource        /opt/robot-tests/resources/ui.robot
Resource        /opt/robot-tests/resources/login.robot

*** Variables ***
${NEF_INVALID_TOKEN}              eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTY0NzYxNDQxNSwianRpIjoiZTc3MDhjMmMtZjFiMi00MDc1LWFlNTctM2YxYmYyYmU4YWY1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6ImN1c3RvbTRuZXRhcHAgaW52b2tlciIsIm5iZiI6MTY0NzYxNDQxNSwiZXhwIjoxNjQ3NjE1MzE1fQ.8CWiqYTtje4AjDmNqA6OjmYMJF3M90NM4GnYIOyHNnI


*** Test Cases ***
Import valid scenario valid token
    [Tags]    import_valid_scenario_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${scenario}=    Run Keyword    scenario.Import Scenario
    ${resp}=    Import Scenario    %{NEF_URL}   ${token.json()['access_token']}    ${scenario}

    Status Should Be    200  ${resp}

Import invalid scenario valid token
    [Tags]    import_invalid_scenario_valid_token
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}
    ${resp}=    Import Scenario    %{NEF_URL}   ${token.json()['access_token']}    {}    422

    Status Should Be    422  ${resp}

Import scenario invalid token
    [Tags]    import_scenario_invalid_token

    ${resp}=    Import Scenario  %{NEF_URL}   ${NEF_INVALID_TOKEN}    {}    401

    Status Should Be    401  ${resp}