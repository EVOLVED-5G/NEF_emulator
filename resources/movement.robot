*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***
Initiate Movement
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/ue_movement/start-loop
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Terminate Movement
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/ue_movement/stop-loop
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

State Movement
    [Arguments]    ${nef_url}    ${access_token}    ${supi}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/ue_movement/state-loop/${supi}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

State UEs
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/ue_movement/state-ues
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}