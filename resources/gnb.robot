*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Create gNB
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/gNBs
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Delete gNB
    [Arguments]    ${nef_url}    ${access_token}    ${gbn_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/gNBs/${gbn_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    DELETE    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read gNBs
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/gNBs?skip=0&limit=10
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Update gNB
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${gnb_id}=    Set Variable    ${body['gNB_id']}
    ${url}=    Set Variable    ${nef_url}/api/v1/gNBs/${gnb_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    PUT    url=${url}    headers=${headers}    data=${body_string}    expected_status=${status}    verify=False

    [Return]     ${response}

Read gNB By Id
    [Arguments]    ${nef_url}    ${access_token}    ${gbn_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/gNBs/${gbn_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}