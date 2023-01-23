*** Settings ***
Documentation   This test file contains the test cases of the errXXX endpoints for NEF Emulator API.
Resource        /opt/robot-tests/resources/default.robot

*** Variables ***

*** Test Cases ***
Access err401 page
    [Tags]    access_err401_page
    ${resp}=    Get Error401 Page    %{NEF_URL}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    401

Access err404 page
    [Tags]    access_err404_page
    ${resp}=    Get Error404 Page    %{NEF_URL}
    
    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    404

Access err500 page
    [Tags]    access_err500_page
    ${resp}=    Get Error500 Page    %{NEF_URL}
    
    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    500