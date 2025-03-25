*** Settings ***
Library      SeleniumLibrary
Test Setup  Open Browser   https://www.wikipedia.org/  Chrome
Suite Teardown  Close Browser

*** Test Cases ***
Search for Wikinews if exist
    Wait Until Element Is Visible   xpath=//span[normalize-space()='Wikipedia']
    ${wikinews}=    Get Element Count   xpath=//span[@data-jsl10n='wikinews.name']
    IF  ${wikinews} >= 1
        Click Element   xpath=//span[@data-jsl10n='wikinews.name']
        Sleep  3s
        Element Should Be Visible   xpath=//span[normalize-space()='Wikinews']
    ELSE
        Fail msg="Not Found Wiki News'
    END