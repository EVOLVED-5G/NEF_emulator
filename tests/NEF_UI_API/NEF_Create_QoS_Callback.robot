*** Settings ***
Documentation   This test file contains the test cases of the get qos callback endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/ui.robot
Library         /opt/robot-tests/libraries/ui_commons.py

*** Variables ***


*** Test Cases ***
Create valid qos callback
    [Tags]    create_valid_qos_callback
    ${body}=    Run Keyword    Get Qos Callback
    ${resp}=    Create QoS Callback  %{NEF_URL}   ${body}

    Status Should Be    200  ${resp}

Create invalid qos callback
    [Tags]    create_invalid_qos_callback
    ${resp}=    Create QoS Callback  %{NEF_URL}   {}    422

    Status Should Be    422  ${resp}