*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Create UE
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}  expected_status=${status}    verify=False

    [Return]     ${response}

Delete UE
    [Arguments]    ${nef_url}    ${access_token}    ${supi}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/${supi}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    DELETE    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read UEs
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read UE
    [Arguments]    ${nef_url}    ${access_token}    ${supi}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/${supi}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Update UE
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/${body['supi']}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    PUT    url=${url}    headers=${headers}    data=${body_string}  expected_status=${status}    verify=False

    [Return]     ${response}

Read UE by gNB
    [Arguments]    ${nef_url}    ${access_token}    ${gnb_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/by_gNB/${gnb_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read UE by cell
    [Arguments]    ${nef_url}    ${access_token}    ${gnb_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/by_Cell/${gnb_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Assign Predefined Path
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/UEs/associate/path
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}  expected_status=${status}    verify=False

    [Return]     ${response}