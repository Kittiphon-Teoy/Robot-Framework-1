*** Settings ***
Library SeleniumLibrary
Test Setup      Open Browser    https://search.yahoo.com/ Chrome
Suite Teardown  Close Browser

*** Test Cases ***
Searching "robot" on Yahoo, the search result should contain Wikipedia
 Search With SearchText=robot
 Page Should Contain Element xpath=//a[@aria-label='Robot - Wikipedia']

Searching "robot" on Yahoo, the search result should contain Britania
 Search With SearchText=robot
 Page Should Contain Element xpath=//a[contains(text(),'Robot | Definition, History, Uses, Types, & Facts ')]

*** Keywords ***
Search With
 [Arguments] ${SearchText}
 Input Text xpath=//input[@id='yschsp'] ${SearchText}
 Press Keys xpath=//input[@id='yschsp'] ENTER