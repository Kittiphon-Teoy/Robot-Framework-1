*** Settings ***
Library         SeleniumLibrary
Test Setup      Open Browser   https://demo.thingsboard.io/login  Chrome
Suite Teardown  Close Browser


*** Test Cases ***
TC001: Login with Valid E-mail and Password
    Maximize Browser Window
    Wait Until Element Is Visible   xpath=//img[@src="assets/logo_title_white.svg"]
    Wait Until Element Is Visible   xpath=//span[normalize-space()='Log in to see ThingsBoard in action.']
    Wait Until Element Is Enabled   xpath=//input[@type='email']
    Input Text                      xpath=//input[@type='email']     text=cpfapp@gmail.com
    Wait Until Element Is Enabled   xpath=//input[@type='password']
    Input Text                      xpath=//input[@type='password']  text=12345678910
    Click Element                   xpath=//button[@type='submit']
    Wait Until Element Is Visible   xpath=//mat-toolbar[@color='primary']//tb-breadcrumb//div//span//span[contains(text(),'Home')]
    Element Should Be Visible       xpath=//span[normalize-space()='Test Test']
    Sleep   15s
    Element Should Be Visible       xpath=//a[normalize-space()='Demo use cases']
    ${demoUseCase}=    Get Element Count   xpath=//body//tb-root//article
    IF  ${demoUseCase} == 5
        Element Should Be Visible           xpath=//a[contains(text(),'Devices')]
    ELSE
        Fail msg="Dashboard not loaded"
    END

