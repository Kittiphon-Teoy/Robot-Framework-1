*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/browser/keyforthingpad.robot
Test Setup       Open Browser    https://demo.thingsboard.io/login    Chrome
Suite Teardown   Close Browser

*** Test Cases ***
TC001: Login with Correct E-mail and Invalid Password
    Wait for Thingsboard Load
    Fill In E-mail                              E_MAIL=cpfapp@gmail.com
    Fill In Password                            PASSWORD=123456789
    Click Element                               xpath=//button[@type='submit']
    Verify If Cannot Login and Inform Error

TC002: Login with Invalid E-mail and Correct Password
    Wait for Thingsboard Load
    Fill In E-mail                              E_MAIL=cpfap@gmail.com
    Fill In Password                            PASSWORD=12345678910
    Click Element                               xpath=//button[@type='submit']
    Verify If Cannot Login and Inform Error

TC003: Login with Invalid E-mail and Invalid Password
    Wait for Thingsboard Load
    Fill In E-mail                              E_MAIL=cpfap@gmail.com
    Fill In Password                            PASSWORD=123456789
    Click Element                               xpath=//button[@type='submit']
    Verify If Cannot Login and Inform Error