*** Settings ***
Library    SeleniumLibrary
Library    DataDriver       file=.../../data/Driven.csv
Resource   ../../resources/browser/keyforthingpad.robot
Test Template    TS002: Login with E-mail and Password with Invalid Credentials
Test Setup       Open Browser    https://demo.thingsboard.io/login    Chrome
Suite Teardown   Close Browser

*** Test Cases ***
TS002: Login with E-mail ${E_MAIL} and Password ${PASSWORD} with Invalid Credentials

*** Keywords ***
TS002: Login with E-mail and Password with Invalid Credentials
    [Arguments]     ${E_MAIL}       ${PASSWORD}
    Fill In E-mail                              E_MAIL=${E_MAIL}
    Fill In Password                            PASSWORD=${PASSWORD}
    Click Element                               xpath=//button[@type='submit']
    Verify If Cannot Login and Inform Error