*** Settings ***
Library     SeleniumLibrary
Test Setup      Open Browser    https://search.yahoo.com/   Chrome
Suite Teardown  Close Browser
*** Variables ***
${WIKIPEDIA}    //a[@aria-label='Robot - Wikipedia']
${LONGDO}       //a[contains(text(),'Robot | Definition, History, Uses, Types, & Facts ')]
*** Test Cases ***
Searching "robot" on Yahoo, the search result should contain Wikipedia
    Search With     SearchText=robot
    Page Should Contain Element xpath=${WIKIPEDIA}

Searching "robot" on Yahoo, the search result should contain Britania
    Search With     SearchText=robot
    Page Should Contain Element xpath=${LONGDO}

*** Keywords ***
Search With
    [Arguments] ${SearchText}
        Input Text  xpath=//input[@id='yschsp']    ${SearchText}
        Press Keys  xpath=//input[@id='yschsp']    ENTER