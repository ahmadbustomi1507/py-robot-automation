*** Settings ***
Resource    resource/setup_web.resource
Suite Setup    Initialization For Web Testing
Test Setup    Open Browser Then Access Base URL
Test Teardown    Close Browser

*** Test Cases ***
Sample test
    Log To Console    ${BASE_URL}

