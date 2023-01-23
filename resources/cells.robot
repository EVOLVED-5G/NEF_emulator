*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Create Cell
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    POST    url=${url}    headers=${headers}    data=${body_string}  expected_status=${status}    verify=False

    [Return]     ${response}

Delete Cell
    [Arguments]    ${nef_url}    ${access_token}    ${cell_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells/${cell_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    DELETE    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read cells
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells?skip=0&limit=10
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Update Cell
    [Arguments]    ${nef_url}    ${access_token}    ${body}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells/${body['cell_id']}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${body_string}    Evaluate    json.dumps(${body})    json
    ${response}=    PUT    url=${url}    headers=${headers}    data=${body_string}  expected_status=${status}    verify=False

    [Return]     ${response}

Read Cell
    [Arguments]    ${nef_url}    ${access_token}    ${cell_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells/${cell_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Read Cell By gNB Id
    [Arguments]    ${nef_url}    ${access_token}    ${gnb_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/Cells/by_gNB/${gnb_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}