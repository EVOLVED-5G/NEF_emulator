*** Settings ***
Library     /opt/robot-tests/tests/libraries/helpers.py

*** Variables ***

*** Keywords ***
Initialize Test, Register And Import Scenario

    [Arguments]    ${email}    ${full_name}    ${password}    #${ip4}    ${ext_id}

    Reset Db
    Register User At Jwt Auth    password=${password}    email=${email}    full_name=${full_name}    #ip4=${ip4}    ext_id=${ext_id}

Reset Db
	Log            Db capif.invokerdetails collection will be removed in order to isolate each test.

	# Clean Test Information By HTTP Requests
	