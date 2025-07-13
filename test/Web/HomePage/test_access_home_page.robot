*** Settings ***
Resource    resource/setup_web.resource
Suite Setup    Initialization For Web Testing
Test Teardown    Close Browser

*** Test Cases ***
Sample test 1 - web ${BASE_URL}, dengan node ${BROWSER}
    [Tags]    home_page
    Open Browser Then Access Base URL
    ...    url=${BASE_URL}
    ...    browser=${BROWSER}
    Capture Page Screenshot    sample.png
    ${session}    Get Session Id
    Log    ${session}        
    Sleep    10s

Sample test 2 - web astra, dengan node ${BROWSER}
    [Tags]    home_page
    Open Browser Then Access Base URL
    ...    url=https://www.astralife.co.id/
    ...    browser=${BROWSER}
    Capture Page Screenshot    sample2.png
    ${session}    Get Session Id
    Log    ${session}
    Sleep    20s

    
Sample test 3 - python org, dengan node ${BROWSER}
    [Tags]    home_page
    Open Browser Then Access Base URL
    ...    url=https://www.python.org/
    ...    browser=${BROWSER}
    Capture Page Screenshot    sample3.png
    ${session}    Get Session Id
    Log    ${session}
    Sleep    20s

Sample test 4 - kompas , dengan node edge
    [Tags]    home_page
    Open Browser Then Access Base URL
    ...    url=https://www.kompas.com/
    ...    browser=edge
    Capture Page Screenshot    sample4.png
    ${session}    Get Session Id
    Log    ${session}
    Sleep    20s