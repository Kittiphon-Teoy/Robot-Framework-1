*** Settings ***
Library     SeleniumLibrary
Test Setup  Open Browser   https://docs.google.com/forms/d/e/1FAIpQLSe29xvKLYM1pt6eQfjvtp_EH5798Tub3NzNh04rqRvQ3UnaaQ/viewform  Chrome
Suite Teardown  Close Browser

*** Test Cases ***
TC001, Filling E-mail (E-mail), Course Like (String), Course Change (String)

    Wait For Page 1 Load
    Fill in E-Mail                      E_MAIL=cpfapp@gmail.com
    Fill in Course Like                 COURSE_LIKE=etetsertetgsdrgdsfgsd
    Fill in Course Change               COURSE_CHANGE=sfsdaewqerwqerqwe
    Sleep   3s
    Click Element                       xpath=//span[contains(text(),'ถัดไป')]
    Verify if Able to Click Next


TC002, Filling E-mail (Invalid E-mail), Course Like (String), Course Change (String)

    Wait For Page 1 Load
    Fill in E-Mail                      E_MAIL=cpfappgmail.com
    Fill in Course Like                 COURSE_LIKE=etetsertetgsdrgdsfgsd
    Fill in Course Change               COURSE_CHANGE=sfsdaewqerwqerqwe
    Click Element                       xpath=//span[contains(text(),'ถัดไป')]
    Verify if Not Able to Click Next
TC003, Filling E-mail (Invalid E-mail), Course Like (String), Course Change (String)

    Wait For Page 1 Load
    Fill in E-Mail                      E_MAIL=cpfappgmail.com
    Fill in Course Like                 COURSE_LIKE=${EMPTY}
    Fill in Course Change               COURSE_CHANGE=sfsdaewqerwqerqwe
    Click Element                       xpath=//span[contains(text(),'ถัดไป')]
    Verify if Not Able to Click Next


*** Keywords ***
Wait For Page 1 Load
    Wait Until Element Is Visible       xpath=//div[contains(text(),'ผู้สอน:')]

Fill in E-Mail
     [Arguments] ${E_MAIL}
     Wait Until Element Is Enabled      xpath=//input[@type='text']
     Input Text                         xpath=//input[@type='text'] text=${E_MAIL}

Fill in Course Like
     [Arguments] ${COURSE_LIKE}
     Wait Until Element Is Enabled      xpath=//textarea[@aria-labelledby='i6 i9']
     Input Text                         xpath=//textarea[@aria-labelledby='i6 i9'] text=${COURSE_LIKE}

Fill in Course Change
     [Arguments] ${COURSE_CHANGE}
     Wait Until Element Is Enabled      xpath=//textarea[@aria-labelledby='i11 i14']
     Input Text                         xpath=//textarea[@aria-labelledby='i11 i14'] text=${COURSE_CHANGE}

Verify if Able to Click Next
     Sleep  3s
     Element Should Be Visible          xpath=//div[contains(text(),'ผู้เรียน:')]

Verify if Not Able to Click Next
     Sleep  3s
     Element Should Be Visible          xpath=//span[normalize-space()='This is a required question']
     Element Should Not Be Visible      xpath=//div[contains(text(),'ผู้เรียน:')]