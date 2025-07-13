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
    FOR    ${x}    IN    @{CONF.robot}
        Set Suite Variable    ${${x}}    ${CONF.robot.${x}}
    END

    #Logging configuration
    Set Suite Variable        ${RESULT_FOLDER}      ${CONF.logging.RESULT_FOLDER}
    Set Screenshot Directory     ${RESULT_FOLDER}/screenshot

