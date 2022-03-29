*** Settings ***
Documentation   This file contains the Test Cases for Nef AsSessionsWithQoS API.
Resource        /opt/robot-tests/tests/resources/common.resource
Resource        /opt/robot-tests/tests/resources/common/basicRequests.robot
Library         /opt/robot-tests/tests/libraries/allBodyRequests.py
Library         Collections

# Test Setup    Initialize Test, Register And Import Scenario  
        
*** Variables ***
${NETAPP_NOT_REGISTERED}        not-valid
${SUBSCRIPTION_ID_NOT_VALID}    6229fea993b01806fee65775
${access_token}                 not-valid
${test_sub_id}                  666f6f2d6261722d71757578
${sub_id}                   

*** Keywords ***


*** Test Cases ***

Create Nef subscription

    [Tags]    create_nef_subscription

    Initialize Test, Register And Import Scenario    email=dummy-session@example.com   full_name=robot    password=password    #ip4=10.0.0.3    ext_id=10003@domain.com

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


*** Comments ***
