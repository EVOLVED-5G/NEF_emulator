*** Settings ***
Documentation   This test file contains the test cases of the create user open endpoint for NEF Emulator API.
Resource        /opt/robot-tests/resources/users.robot

*** Variables ***

*** Keywords ***


*** Test Cases ***
Create valid user
    [Tags]    create_valid_user
    ${user}=    Create Dictionary    email=create-user-open@mail.com  is_active=true  is_superuser=false  full_name=create-user-open  password=pass
    ${resp}=    Create User Open    %{NEF_URL}  ${user}

    Status Should Be    200  ${resp}

Create invalid user
    [Tags]    create_invalid_user

    ${resp}=    Create User Open    %{NEF_URL}  {}  422
    Status Should Be    422  ${resp}
