*** Settings ***
Documentation   This file contains the Test Cases for the Monitoring Event API of Nef Emulator.
Resource        /opt/robot-tests/resources/common.resource
Resource        /opt/robot-tests/resources/common/basicRequests.robot
Resource        /opt/robot-tests/resources/common/basicRequests.robot
Library         /opt/robot-tests/libraries/allBodyRequests.py
Library         Collections

*** Variables ***
${NETAPP_NOT_REGISTERED}        not-valid
${SUBSCRIPTION_ID_NOT_VALID}    6229fea993b01806fee65775
${access_token}                 not-valid
${sub_id}


*** Keywords ***


*** Test Cases ***

Create Nef subscription

    [Tags]    create_nef_subscription

    Initialize Test, Register And Import Scenario    email=monitor2@example.com    full_name=robot-monitor2    password=password    num=2

    ${subscriber_id}=      Set Variable    ${APF_ID}

    ${request_body}=       Monitoring Event Sub Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    201

    ${url}=    Parse Url      ${resp.headers['Location']}
    Log        ${url.path}

    Should Match Regexp    ${url.path}    ^/nef/api/v1/3gpp-monitoring-event/v1/[0-9a-zA-Z]+/subscriptions/[0-9a-zA-Z]+

    ${subscriber_id}    ${subscription_id}=    Get Subscriber And Subscription From Location    ${url.path}

    Set Global Variable    ${sub_id}    ${subscription_id}

    Set Global Variable    ${subber_id}    ${subscriber_id}

    Set Global Variable    ${NEF_TOKEN}    ${NEF_BEARER}

    Log To Console         Response body: ${resp.json()}


Create Nef subscription with already active

    [Tags]    create_nef_subscription_w_already_active_sub

    ${subscriber_id}=      Set Variable    ${subber_id}

    Log To Console    ${subscriber_id}

    ${request_body}=       Monitoring Event Sub Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_TOKEN}

	Should Be Equal As Strings    ${resp.status_code}    409

    Log To Console         There is already an active subscription for UE


Create subscription by unAuthorized NetApp

    [Tags]    create_nef_subscription_w_unauthorized_netapp

    ${subscriber_id}=      Set Variable    ${subber_id}

    ${request_body}=       Monitoring Event Sub Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401

    Log To Console         Unauthorized NetApp


Read all active subscriptions by Authorized NetApp

    [Tags]    get_NetApp_subscriptions

    ${subscriber_id}=    Set Variable    ${subber_id}
    Log To Console      ${subscriber_id}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    auth=${NEF_TOKEN}

	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}

    ${length}=    Get Length    ${resp.json()}

    Log To Console       Length of list: ${length}


Read all active subscriptions by Authorized NetApp with no active ones

    [Tags]    get_NetApp_subscriptions_no_active

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Delete Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_TOKEN}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    auth=${NEF_TOKEN}

	Should Be Equal As Strings    ${resp.status_code}    204


Read individual subscription by Authorized NetApp

    [Tags]    get_NetApp_individual_subscription

    ${subscriber_id}=      Set Variable    ${subber_id}

    ${request_body}=       Monitoring Event Sub Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_TOKEN}

	Should Be Equal As Strings    ${resp.status_code}    201

    ${url}=    Parse Url      ${resp.headers['Location']}
    Log        ${url.path}

    Should Match Regexp    ${url.path}    ^/nef/api/v1/3gpp-monitoring-event/v1/[0-9a-zA-Z]+/subscriptions/[0-9a-zA-Z]+

    ${subscriber_id}    ${subscription_id}=    Get Subscriber And Subscription From Location    ${url.path}

    Set Global Variable    ${sub_id}    ${subscription_id}

    # Actual process
    # ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_TOKEN}
    Log To Console       Response body: ${resp.json()}
	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}


Read individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    get_NetApp_individual_subscription_with_invalid_sub_id

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${SUBSCRIPTION_ID_NOT_VALID}

	Should Be Equal As Strings    ${resp.status_code}    404


Read all active subscriptions by unAuthorized NetApp

    [Tags]    get_NetApp_subscriptions_by_unAuthorized_NetApp

    ${subscriber_id}=    Set Variable    ${NETAPP_NOT_REGISTERED}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401


Read individual subscription by unAuthorized NetApp

    [Tags]    get_NetApp_individual_subscription_by_unAuthorized_NetApp

    ${subscriber_id}=    Set Variable    ${NETAPP_NOT_REGISTERED}

    ${subscription_id}=  Set Variable    1

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401


Update individual subscription by Authorized NetApp

    [Tags]    update_individual_sub

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${request_body}=     Monitoring Event Sub Body

    ${resp}=             Put Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${subscription_id}    json=${request_body}    auth=${NEF_TOKEN}

	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}


Update individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    update_individual_sub_w_invalid_id

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${request_body}=     Monitoring Event Sub Body

    ${resp}=             Put Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${SUBSCRIPTION_ID_NOT_VALID}    json=${request_body}    auth=${NEF_TOKEN}

    Should Be Equal As Strings    ${resp.status_code}    404


Update individual subscription by unAuthorized NetApp

    [Tags]    update_individual_sub_by_unauthorized_netapp

    ${subscription_id}=      Set Variable    ${sub_id}

    ${request_body}=         Monitoring Event Sub Body

    ${resp}=                 Put Request Nef    /nef/api/v1/3gpp-monitoring-event/v1/${NETAPP_NOT_REGISTERED}/subscriptions/${subscription_id}    json=${request_body}    auth=${access_token}

    Should Be Equal As Strings    ${resp.status_code}    401


Delete individual subscription by Authorized NetApp

    [Tags]    delete_individual_sub

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Delete Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_TOKEN}

    Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}


Delete individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    delete_individual_sub_unauthorized_netapp_w_invalid_sub_id

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${resp}=             Delete Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions/${SUBSCRIPTION_ID_NOT_VALID}    auth=${NEF_TOKEN}

    Should Be Equal As Strings    ${resp.status_code}    404


Delete individual subscription by unAuthorized NetApp

    [Tags]    delete_individual_sub_unauthorized_netapp

    ${subscriber_id}=    Set Variable    ${subber_id}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Delete Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${NETAPP_NOT_REGISTERED}/subscriptions/${subscription_id}    auth=${access_token}

    Should Be Equal As Strings    ${resp.status_code}    401


One-time request to the Monitoring Event API by Authorized NetApp

    Initialize Test, Register And Import Scenario    email=onetime@example.com    full_name=robot-onetime    password=password    num=1

    ${subscriber_id}=          Set Variable    ${APF_ID}

    ${request_body}=       One Time Monitoring Event Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-monitoring-event/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_BEARER}

    Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console         Response body: ${resp.json()}


*** Comments ***
