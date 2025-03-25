*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     CSVLibrary
Test Setup      Open Browser    https://search.yahoo.com/   Chrome
Suite Teardown  Close Browser
Resource    openGoogle.robot

*** Test Cases ***
Searching "robot" on Yahoo, the search result should contain Wikipedia
    ${dict}= read csv file to associative   ./data/data.csv
    Set Suite Variable  ${dict}
    Search With                     SearchText = robot
    Page Should Contain Element     xpath=${dict[0].WIKIPEDIA}

Searching "robot" on Yahoo, the search result should contain Britania
    Search With                     SearchText=robot
    Page Should Contain Element     xpath=${dict[0].BRITANIA}

*** Keywords ***
Search With
    [Arguments] ${SearchText}
    Input Text  xpath=//input[@id='yschsp'] ${SearchText}
    Press Keys  xpath=//input[@id='yschsp'] ENTER
