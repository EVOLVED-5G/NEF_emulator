*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections

*** Variables ***

*** Keywords ***

Get Dashboard Page
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/dashboard
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Export Page
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/export
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Import Page
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/import
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Map Page
    [Arguments]    ${nef_url}    ${access_token}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/map
    ${headers}=    Create Dictionary     Authorization=Bearer ${access_token}  Content-Type=application/json; charset=utf-8
    ${response}=    GET    url=${url}    headers=${headers}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Error401 Page
    [Arguments]    ${nef_url}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/err401
    ${response}=    GET    url=${url}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Error404 Page
    [Arguments]    ${nef_url}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/err404
    ${response}=    GET    url=${url}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Error500 Page
    [Arguments]    ${nef_url}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/err500
    ${response}=    GET    url=${url}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Login Page
    [Arguments]    ${nef_url}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/login
    ${response}=    GET    url=${url}    expected_status=${status}    verify=False

    [Return]     ${response}

Get Register Page
    [Arguments]    ${nef_url}    ${status}=200
    ${url}=    Set Variable    ${nef_url}/register
    ${response}=    GET    url=${url}    expected_status=${status}    verify=False

    [Return]     ${response}