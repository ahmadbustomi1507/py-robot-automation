*** Settings ***
Library    SeleniumLibrary    timeout=5s    run_on_failure=Capture Page Screenshot
Library    RobotDebug
Library    String
Library    FakerLibrary    locale=id_ID
Library    DateTime
Library    Collections
Library    utility.py
Resource   pages/ImportPages.resource

*** Variables ***
${TIMEOUT}                90s


*** Keywords ***
Initialization For Web Testing
    Log To Console        Starting initalization for Web Testing

    # Parsing configuration files conf.toml
    &{CONF}    Parsing Configuration    conf.toml
    
    #Robot configuration
    Set Suite Variable    ${BASE_URL}     ${CONF.robot.BASE_URL}
    Set Suite Variable    ${BASE_API}     ${CONF.robot.BASE_API}
    Set Suite Variable    ${BROWSER}      ${CONF.robot.BROWSER}
    
    #Logging configuration
    Set Suite Variable        ${RESULT_FOLDER}      ${CONF.logging.RESULT_FOLDER}
    Set Screenshot Directory     ${RESULT_FOLDER}/screenshot


