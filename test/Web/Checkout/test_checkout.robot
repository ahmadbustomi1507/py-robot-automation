*** Settings ***
Resource    resource/setup_web.resource
Suite Setup    Initialization For Web Testing

Test Setup    Run Keywords
...    Open Browser Then Access Base URL    
...    AND    
...    Log To Console    opening the browser ${BASE_URL}

Test Teardown    Run Keywords    
...    Close Browser
...    AND
...    Stop Video Recording

*** Test Cases ***
Test Checkout 1
    [Tags]    checkout
    Start Video Recording
    Capture Page Screenshot    home_page.png
    Signing With Correct Password
    
    Set Test Variable    ${item1}    Sauce Labs Backpack
    Choose Product    ${item1}
    Add to cart
    Access shopping cart
    Checkout the product
    Complete the transaction
