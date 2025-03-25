*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait for Thingsboard Load
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//img[@src="assets/logo_title_white.svg"]
    Wait Until Element Is Visible    xpath=//span[normalize-space()='Log in to see ThingsBoard in action.']

Fill In E-mail
    [Arguments]     ${E_MAIL}
    Wait Until Element Is Enabled    xpath=//input[@type='email']
    Input Text                       xpath=//input[@type='email']                               text=${E_MAIL}

Fill In Password
    [Arguments]     ${PASSWORD}
    Wait Until Element Is Enabled    xpath=//input[@type='password']
    Input Text                       xpath=//input[@type='password']                            text=${PASSWORD}

Verify If Cannot Login and Inform Error
    Sleep    5s
    Element Should Not Be Visible    xpath=//mat-toolbar[@color='primary']//tb-breadcrumb//div//span//span[contains(text(),'Home')]
    Sleep    1s
    Element Should Be Visible        xpath=//div[normalize-space()='Invalid username or password']
    ${class}=   Get Element Attribute       xpath=//body/div/div[@dir="ltr"]/div/mat-snack-bar-container/div/div/div[@aria-live="assertive"]/div/tb-snack-bar-component/div[1]    class
    Should Contain      ${class}     error-toast

Verify If Can Login and Dashboard Loaded
    Wait Until Element Is Visible    xpath=//mat-toolbar[@color='primary']//tb-breadcrumb//div//span//span[contains(text(),'Home')]
    Element Should Be Visible        xpath=//span[normalize-space()='Test Test']
    Sleep    5s
    Element Should Be Visible        xpath=//a[normalize-space()='Demo use cases']
    ${demoUseCase}=     Get Element Count                xpath=//body//tb-root//article
    IF    ${demoUseCase} == 5
          Element Should Be Visible        xpath=//a[contains(text(),'Devices')]
    ELSE
          Fail      msg="Dashboard not loaded"
    END