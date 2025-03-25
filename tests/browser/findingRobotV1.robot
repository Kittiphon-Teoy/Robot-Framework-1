*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     CSVLibrary
Test Setup      Open Browser    https://search.yahoo.com/    Chrome
#Test Teardown  Close Browser
Suite Teardown  Close Browser
Resource    openGoogle.robot
*** Variables ***
#${WIKIPEDIA}    //a[@aria-label='Robot - Wikipedia']
#${BRITANIA}    //a[contains(text(),'Robot | Definition, History, Uses, Types, & Facts ')]
*** Test Cases ***
Searching "robot" on Google, the search result should contain Wikipedia
    ${dict}=    read csv file to associative   ./data/data.csv
    Set Suite Variable  ${dict}
    Search With                     SearchText=Robot
    Page Should Contain Element     xpath=${dict[0].WIKIPEDIA}
Searching "robot" on Google, the search result should contain Longdo Directory
    Search With   SearchText=Dota2
    Page Should Contain Element  xpath=${dict[0].BRITANIA}

*** Keywords ***
Search With
    [Arguments]     ${SearchText}
    Input Text      xpath=//input[@id='yschsp']     ${SearchText}
    Press Keys      xpath=//input[@id='yschsp']     ENTER
