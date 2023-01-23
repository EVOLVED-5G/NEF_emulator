*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Get QoS Characteristics
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/qosInfo/qosCharacteristics
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get QoS Active Profiles
    [Arguments]    ${nef_url}    ${access_token}    ${gnb_id}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/api/v1/qosInfo/qosProfiles/${gnb_id}
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}