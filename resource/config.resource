*** Settings ***
Library    SeleniumLibrary    timeout=5s    run_on_failure=Capture Page Screenshot    screenshot_root_directory=${SCREENSHOT_PATH}

*** Variables ***
${RESULT_FOLDER}          results
${SCREENSHOT_PATH}        $RESULT_FOLDER/ss


*** Keywords ***
Initialization
    Set Suite Variable    $BROWSER    chrome
    Set Suite Variable    $URL    www.google.com

    Log    Hello, world!
