*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***
Create User
    [Arguments]    ${nef_url}    ${access_token}    ${user}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${user_string}    Evaluate    json.dumps(${user})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${user_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Create User Open
    [Arguments]    ${nef_url}    ${user}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users/open
    ${user_string}    Evaluate    json.dumps(${user})    json
    ${response}=    POST    url=${url}    data=${user_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Update User
    [Arguments]    ${nef_url}    ${access_token}    ${user}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users/${user['id']}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${user_string}    Evaluate    json.dumps(${user})    json
    ${response}=    PUT    url=${url}    headers=${headers}    data=${user_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Update User Me
    [Arguments]    ${nef_url}    ${access_token}    ${user}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users/me
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${user_string}    Evaluate    json.dumps(${user})    json
    ${response}=    PUT    url=${url}    headers=${headers}    data=${user_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Read Users
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users?skip=0&limit=10
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read User Me
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users/me
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read User By Id
    [Arguments]    ${nef_url}    ${access_token}    ${user}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/users/${user['id']}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}