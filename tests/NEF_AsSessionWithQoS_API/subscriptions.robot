*** Settings ***
Documentation   This file contains the Test Cases for the As Session with QoS API of Nef Emulator.
Resource        /opt/robot-tests/resources/common.resource
Resource        /opt/robot-tests/resources/common/basicRequests.robot
Library         /opt/robot-tests/libraries/allBodyRequests.py
Library         Collections


*** Variables ***
${NETAPP_NOT_REGISTERED}        not-valid
${SUBSCRIPTION_ID_NOT_VALID}    6229fea993b01806fee65775
${access_token}                 not-valid
${test_sub_id}                  666f6f2d6261722d71757578
${sub_id}

*** Keywords ***

create_nef_subscription_function

    ${subscriber_id}=      Set Variable    ${APF_ID}

    ${request_body}=       Create Nef Subscription Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    201

    ${url}=    Parse Url      ${resp.headers['Location']}
    Log        ${url.path}

    Should Match Regexp    ${url.path}    ^/nef/api/v1/3gpp-as-session-with-qos/v1/[0-9a-zA-Z]+/subscriptions/[0-9a-zA-Z]+

    ${subscriber_id}    ${subscription_id}=    Get Subscriber And Subscription From Location    ${url.path}

    Set Global Variable    ${sub_id}    ${subscription_id}

    Log To Console         Response body: ${resp.json()}


*** Test Cases ***

Create Nef subscription

    [Tags]    create_nef_subscription

    Initialize Test, Register And Import Scenario    email=qos@example.com    full_name=robot-qos    password=password     num=2

    create_nef_subscription_function


Create Nef subscription with already active

    [Tags]    create_nef_subscription_w_already_active_sub

    ${subscriber_id}=      Set Variable    ${APF_ID}

    ${request_body}=       Create Nef Subscription Body

    ${resp}=               Post Request Nef    endpoint=/nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    409

    Log To Console    There is already an active subscription for UE


Create subscription by unAuthorized NetApp

    [Tags]    create_nef_subscription_w_unauthorized_netapp

    ${subscriber_id}=      Set Variable    ${NETAPP_NOT_REGISTERED}

    ${request_body}=       Create Nef Subscription Body

    ${resp}=               Post Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    json=${request_body}    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401

    Log To Console    Unauthorized NetApp


Read all active subscriptions by Authorized NetApp

    [Tags]    get_NetApp_subscriptions

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}

    ${length}=           Get Length    ${resp.json()}

    Log To Console       Length of list: ${length}


Read all active subscriptions by Authorized NetApp with no active ones

    [Tags]    get_NetApp_subscriptions_no_active

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Delete Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_BEARER}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    404


Read individual subscription by Authorized NetApp

    [Tags]    get_NetApp_individual_subscription

    create_nef_subscription_function

    ${subscriber_id}=      Set Variable    ${APF_ID}

    # Actual process
    ${subscription_id}=  Set Variable    ${sub_id}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console                Response body: ${resp.json()}


Read individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    get_NetApp_individual_subscription_with_invalid_sub_id

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions${test_sub_id}

	Should Be Equal As Strings    ${resp.status_code}    404


Read all active subscriptions by unAuthorized NetApp

    [Tags]    get_NetApp_subscriptions_by_unAuthorized_NetApp

    ${subscriber_id}=    Set Variable    ${NETAPP_NOT_REGISTERED}

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401


Read individual subscription by unAuthorized NetApp

    [Tags]    get_NetApp_individual_subscription_by_unAuthorized_NetApp

    ${subscriber_id}=    Set Variable    ${NETAPP_NOT_REGISTERED}

    ${subscription_id}=  Set Variable    1

    ${resp}=             Get Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${access_token}

	Should Be Equal As Strings    ${resp.status_code}    401


Update individual subscription by Authorized NetApp

    [Tags]    update_individual_sub

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${subscription_id}=  Set Variable    ${sub_id}

    ${request_body}=     Create Nef Subscription Body

    ${resp}=             Put Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${subscription_id}    json=${request_body}    auth=${NEF_BEARER}

	Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console       Response body: ${resp.json()}


Update individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    update_individual_sub_w_invalid_id

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${request_body}=     Create Nef Subscription Body

    ${resp}=             Put Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${SUBSCRIPTION_ID_NOT_VALID}    json=${request_body}    auth=${NEF_BEARER}

    Should Be Equal As Strings    ${resp.status_code}    404


Update individual subscription by unAuthorized NetApp

    [Tags]    update_individual_sub_by_unauthorized_netapp

    ${subscription_id}=      Set Variable    ${sub_id}

    ${request_body}=         Create Nef Subscription Body

    ${resp}=                 Put Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${NETAPP_NOT_REGISTERED}/subscriptions/${subscription_id}    json=${request_body}    auth=${access_token}

    Should Be Equal As Strings    ${resp.status_code}    401


Delete individual subscription by Authorized NetApp

    [Tags]    delete_individual_sub

    ${subscriber_id}=      Set Variable    ${APF_ID}

    ${subscription_id}=    Set Variable    ${sub_id}

    ${resp}=               Delete Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${subscription_id}    auth=${NEF_BEARER}

    Should Be Equal As Strings    ${resp.status_code}    200

    Log To Console         Response body: ${resp.json()}


Delete individual subscription by Authorized NetApp with invalid subscription id

    [Tags]    delete_individual_sub_unauthorized_netapp_w_invalid_sub_id

    ${subscriber_id}=    Set Variable    ${APF_ID}

    ${resp}=             Delete Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${subscriber_id}/subscriptions/${SUBSCRIPTION_ID_NOT_VALID}    auth=${NEF_BEARER}

    Should Be Equal As Strings    ${resp.status_code}    404


Delete individual subscription by unAuthorized NetApp

    [Tags]    delete_individual_sub_unauthorized_netapp

    ${subscriber_id}=      Set Variable    ${APF_ID}

    ${subscription_id}=    Set Variable    ${sub_id}

    ${resp}=               Delete Request Nef    /nef/api/v1/3gpp-as-session-with-qos/v1/${NETAPP_NOT_REGISTERED}/subscriptions/${subscription_id}    auth=${access_token}

    Should Be Equal As Strings    ${resp.status_code}    401


*** Comments ***
