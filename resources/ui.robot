*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Get Notifications
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/monitoring/notifications?skip=0&limit=10
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Last Notifications
    [Arguments]    ${nef_url}    ${access_token}    ${id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/monitoring/last_notifications?id=${id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Export Scenario
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/export/scenario
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Import Scenario
    [Arguments]    ${nef_url}    ${access_token}    ${scenario}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/import/scenario
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${scenario_string}    Evaluate    json.dumps(${scenario})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${scenario_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Create Test Callback
    [Arguments]    ${nef_url}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/test/callback
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Create Monitoring Callback
    [Arguments]    ${nef_url}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/monitoring/callback
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Create QoS Callback
    [Arguments]    ${nef_url}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/utils/session-with-qos/callback
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}