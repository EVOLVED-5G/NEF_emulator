*** Settings ***
Library     /opt/robot-tests/libraries/helpers.py

*** Variables ***

*** Keywords ***
Initialize Test, Register And Import Scenario

    [Arguments]    ${email}    ${full_name}    ${password}    ${num}    

    # Reset Db
    Register User At Jwt Auth    password=${password}    email=${email}    full_name=${full_name}    num=${num}  

Reset Db
	Log            Db nef invoker details will be removed in order to isolate each test.

	# Clean Test Information By HTTP Requests