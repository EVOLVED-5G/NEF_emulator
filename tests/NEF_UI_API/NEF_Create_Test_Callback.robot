*** Settings ***
Documentation   This test file contains the test cases of the get test callback endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/ui.robot

*** Variables ***


*** Test Cases ***
Create invalid test callback
    [Tags]    create_invalid_callback
    ${test}=    Create Dictionary    callbackurl=http://localhost:8888/api/v1/utils/test/callback
    ${resp}=    Create Test Callback  %{NEF_URL}   ${test}    409

    Status Should Be    409  ${resp}