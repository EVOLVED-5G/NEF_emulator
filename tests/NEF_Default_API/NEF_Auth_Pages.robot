*** Settings ***
Documentation   This test file contains the test cases of the dashboard,map,import,export endpoints for NEF Emulator API.
Resource        /opt/robot-tests/resources/default.robot
Resource        /opt/robot-tests/resources/login.robot

*** Variables ***

*** Test Cases ***
Authorized access dashboard page
    [Tags]    authorized_access_dashboard_page
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get Dashboard Page  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Dashboard

Authorized access map page
    [Tags]    authorized_access_map_page
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get Map Page  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Map

Authorized access import page
    [Tags]    authorized_access_import_page
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get Import Page  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Import

Authorized access export page
    [Tags]    authorized_access_export_page
    ${token}=    Get Access Token    %{NEF_URL}    %{ADMIN_USER}    %{ADMIN_PASS}

    ${resp}=    Get Export Page  %{NEF_URL}   ${token.json()['access_token']}

    Status Should Be    200  ${resp}
    Should Contain    ${resp.text}    Export