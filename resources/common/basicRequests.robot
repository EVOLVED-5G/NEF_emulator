*** Settings ***
Documentation    This resource file contains the basic requests used by Nef.
Library          OperatingSystem
Library          RequestsLibrary
Library          Collections
Library          /opt/robot-tests/libraries/scenario.py


*** Variables ***
${NGINX_HOSTNAME}           %{NGINX_HOSTNAME}
${NETAPP_NOT_REGISTERED}    not-valid
${NEF_BEARER}   


*** keywords ***
Create NEF Session

    [Arguments]    ${server}=${NONE}    ${auth}=${NONE}

    Run Keyword If    "${server}" != "${NONE}"    Create Session    apisession    ${server}            verify=True
    ...               ELSE                        Create Session    apisession    ${NGINX_HOSTNAME}    verify=True

    ${headers}=    Run Keyword If    "${auth}" != "${NONE}" and "${auth}" != "${NETAPP_NOT_REGISTERED}"       Create Dictionary    Authorization=Bearer ${auth}  
    ...            ELSE IF           "${auth}" == "${NETAPP_NOT_REGISTERED}"                                  Create Dictionary    Authorization=Basic ${auth}  
    ...            ELSE IF           "${NEF_BEARER}" != ""                                                    Create Dictionary    Authorization=Bearer ${NEF_BEARER}                                                                             

    [Return]    ${headers}


Post Request Nef

    [Arguments]    ${endpoint}    ${json}=${NONE}    ${server}=${NONE}    ${auth}=${NONE}
    [Timeout]      60s

    ${headers}=    Create NEF Session    ${server}    ${auth}

    ${resp}=       POST On Session    apisession    ${endpoint}    headers=${headers}    json=${json}    expected_status=any

    [Return]       ${resp}


Get Request Nef

    [Arguments]    ${endpoint}    ${server}=${NONE}    ${auth}=${NONE}
    [Timeout]      60s

    ${headers}=    Create Nef Session    ${server}    ${auth}

    ${resp}=       GET On Session    apisession    ${endpoint}    headers=${headers}    expected_status=any

    [Return]       ${resp}


Put Request Nef

    [Arguments]    ${endpoint}    ${json}=${EMPTY}    ${server}=${NONE}    ${auth}=${NONE}
    [Timeout]      60s

    ${headers}=    Create NEF Session    ${server}    ${auth}

    ${resp}=    PUT On Session    apisession    ${endpoint}    headers=${headers}    json=${json}    expected_status=any

    [Return]    ${resp}


Delete Request Nef

    [Arguments]    ${endpoint}    ${server}=${NONE}    ${auth}=${NONE}
    [Timeout]      60s

    ${headers}=    Create NEF Session    ${server}    ${auth}

    ${resp}=    DELETE On Session    apisession    ${endpoint}    headers=${headers}    expected_status=any

    [Return]    ${resp}


Register User At Jwt Auth

    [Arguments]    ${email}     ${full_name}    ${password}    ${num}  

    ${body}=    Create Dictionary    email=${email}    full_name=${full_name}    password=${password}

    Create Session    mysession    ${NGINX_HOSTNAME}     verify=True

    ${resp}=    POST On Session    mysession    /api/v1/users/open    json=${body}

    Should Be Equal As Strings    ${resp.status_code}    200

    Set Global Variable    ${APF_ID}    ${resp.json()['id']}

    ${access_token}=    Get Token For User    username=${email}    password=${password}

    ${json}=            Import Scenario Body    ${num}  

    Import Scenario     ${json}    ${access_token}

    [Return]    ${access_token}


Create Temporary User

    [Arguments]    ${email}=dummy-monitor@example.com     ${full_name}=robot    ${password}=password    

    ${body}=    Create Dictionary    email=${email}    full_name=${full_name}    password=${password}

    Create Session    mysession    ${NGINX_HOSTNAME}     verify=True

    ${resp}=    POST On Session    mysession    /api/v1/users/open    json=${body}

    Should Be Equal As Strings    ${resp.status_code}    200

    ${access_token}=    Get Token For User    username=${email}    password=${password}

    [Return]    ${resp.json()['id']}    ${access_token}


Get Token For User

    [Arguments]    ${username}=dummy-monitor@example.com      ${password}=password    ${secret}=testing  

    ${header}=      Create Dictionary    Content-Type=application/x-www-form-urlencoded;charset=utf-8    Accept=application/json;charset=utf-8

    ${body}=        Create Dictionary    username=${username}    password=${password}    secret=${secret}   

    ${req_body}=    Convert Body    ${body}
    
    ${resp}=    POST On Session    mysession    /api/v1/login/access-token    headers=${header}    data=${req_body}    expected_status=any

    Should Be Equal As Strings    ${resp.status_code}    200

    Set Global Variable    ${NEF_BEARER}    ${resp.json()["access_token"]}

    [Return]    ${resp.json()["access_token"]}


Import Scenario

    [Arguments]     ${json}    ${access_token}
    
    ${resp}=    Post Request Nef    endpoint=/api/v1/utils/import/scenario    json=${json}     auth=${access_token}

    Should Be Equal As Strings    ${resp.status_code}    200


Clean Test Information By HTTP Requests

    Create Session    jwtsession    ${NGINX_HOSTNAME}     verify=True

    ${resp}=                      DELETE On Session      jwtsession    /testusers
    Should Be Equal As Strings    ${resp.status_code}    200

    ${resp}=                      DELETE On Session      jwtsession    /testservice
    Should Be Equal As Strings    ${resp.status_code}    200

    ${resp}=                      DELETE On Session      jwtsession    /testinvoker
    Should Be Equal As Strings    ${resp.status_code}    200

    ${resp}=                      DELETE On Session      jwtsession    /testevents
    Should Be Equal As Strings    ${resp.status_code}    200