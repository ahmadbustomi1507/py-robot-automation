*** Settings ***
Documentation    Setup webdriver for web testing
Library    SeleniumLibrary    timeout=5s    run_on_failure=Capture Page Screenshot
Library    RobotDebug
Library    String
Library    FakerLibrary    locale=id_ID
Library    DateTime
Library    Collections
Library    utility.py
Library    ScreenCapLibrary
Resource   pages/ImportPages.resource


*** Keywords ***
Initialization For Web Testing
    Log To Console        Starting initalization for Web Testing

    # Parsing configuration files robot.toml
    &{CONF}    Parsing Configuration    robot.toml

    #Robot configuration
    FOR    ${x}    IN    @{CONF.robot}
        Set Suite Variable    ${${x}}    ${CONF.robot.${x}}
    END

    #Logging configuration
    Set Suite Variable        ${RESULT_FOLDER}      ${CONF.logging.RESULT_FOLDER}
    SeleniumLibrary.Set Screenshot Directory     ${RESULT_FOLDER}/screenshot
    ScreenCapLibrary.Set Screenshot Directory    ${RESULT_FOLDER}/screenshot
    
Open Browser Then Access Base URL
    [Arguments]
    ...    ${url}=${BASE_URL}
    ...    ${browser}=${BROWSER}
    [Documentation]
    ...    opening browser then go to web address that has been
    ...    setup in conf.tml (please check robot.BASE_URL)

    #Adding web browser capabilities
#    ${caps}    Create Dictionary
#    ...    args=

    ${IS_EMPTY}    Run Keyword And Return Status    Should Be Empty    ${REMOTE_DRIVER}
    IF    ${IS_EMPTY}
        # Try opening Browser
        Log    Try opening browser with local webdriver
        ${is_opened}    Run Keyword And Return Status    Open Browser    url=${url}    browser=${browser}

        ${driverpath}    Run Keyword And Return If    not ${is_opened}
        ...    Install Webdriver Based on Installed Browser    ${browser}
            
        Run Keyword And Return If    not ${is_opened}    Open Browser
        ...    url=${url}
        ...    browser=${browser}
        ...    executable_path=${driverpath}
#        ...    options=add_argument("enable-automation");add_argument("")
    ELSE
        #Running with remote driver
        Open Browser
        ...    url=${url}
        ...    browser=${browser}
        ...    remote_url=${REMOTE_DRIVER}
#        ...    options=
    END

    #Set Window Size    1400    900
    Maximize Browser Window
    #Set Selenium Speed    0.1ms
    Set Selenium Speed    100ms
    Set Selenium Timeout   ${TIMEOUT}
    Set Log Level    INFO


