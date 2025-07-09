*** Settings ***
Library    SeleniumLibrary    timeout=5s    run_on_failure=Capture Page Screenshot
Library    RobotDebug
Library    String
Library    FakerLibrary    locale=id_ID
Library    DateTime
Library    Collections
Library    utility.py
Resource   pages/ImportPages.resource

*** Keywords ***
Initialization For Web Testing
    Log To Console        Starting initalization for Web Testing

    # Parsing configuration files robot.toml
    &{CONF}    Parsing Configuration    robot.toml
    
    #Robot configuration
    Set Suite Variable    ${BASE_URL}     ${CONF.robot.BASE_URL}
    Set Suite Variable    ${BASE_API}     ${CONF.robot.BASE_API}
    Set Suite Variable    ${BROWSER}      ${CONF.robot.BROWSER}
    Set Suite Variable    ${TIMEOUT}      ${CONF.robot.TIMEOUT}
    Set Suite Variable    ${REMOTE_DRIVER}      ${CONF.robot.REMOTE_DRIVER}
    
    #Logging configuration
    Set Suite Variable        ${RESULT_FOLDER}      ${CONF.logging.RESULT_FOLDER}
    Set Screenshot Directory     ${RESULT_FOLDER}/screenshot

