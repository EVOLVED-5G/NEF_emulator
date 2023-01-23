*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Get Access Token
    [Arguments]    ${nef_url}    ${user}    ${password}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/login/access-token
    ${payload}=    Create Dictionary    username=${user}    password=${password}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${response}=    POST    url=${url}    headers=${headers}    data=${payload}    expected_status=${status}    verify=False

    [Return]     ${response}

Test Token
    [Arguments]    ${nef_host}    ${access_token}    ${status}=200

    ${url}=     Set Variable     ${nef_host}/api/v1/login/test-token
    
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    POST     url=${url}  headers=${headers}  verify=False    expected_status=${status}

    [Return]     ${response}