*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open Browser    https://th.search.yahoo.com/    Chrome
Test Setup      Input Text    id=yschsp    robot
Test Teardown   Go To  http://www.google.com
Suite Teardown  Close Browser

*** Test Cases ***
Searching "robot" on Google, the search result should contain Wikipedia
    Press Keys    id=APjFqb    ENTER
    Page Should Contain Link    https://th.wikipedia.org/wiki/%E0%B8%AB%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%A2%E0%B8%99%E0%B8%95%E0%B9%8C

Searching "robot" on Google, the search result should contain Longdo Directory
    Press Keys    id=APjFqb    ENTER
    Page Should Contain Link    https://dict.longdo.com/search/ROBOT