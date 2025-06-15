*** Settings ***
Resource    resource/config.resource


*** Test Cases ***
first
    Log    Hello World
    Log To Console    $BROWSER
    Log To Console    $URL

