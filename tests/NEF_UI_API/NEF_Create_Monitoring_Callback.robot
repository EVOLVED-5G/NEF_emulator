*** Settings ***
Documentation   This test file contains the test cases of the get monitoring callback endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/ui.robot
Library         /opt/robot-tests/libraries/ui_commons.py

*** Variables ***


*** Test Cases ***
Create valid monitoring callback
    [Tags]    create_valid_monitoring_callback
    ${body}=    Get Monitoring Callback
    ${resp}=    Create Monitoring Callback  %{NEF_URL}   ${body}

    Status Should Be    200  ${resp}

Create invalid monitoring callback
    [Tags]    create_invalid_monitoring_callback
    ${resp}=    Create Monitoring Callback  %{NEF_URL}   {}    422

    Status Should Be    422  ${resp}