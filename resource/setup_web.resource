*** Settings ***
Documentation    Setup webdriver for web testing
Resource         resource/config.resource


*** Keywords ***
Open Browser Then Access Base URL
    [Arguments]
    ...    ${url}=${BASE_URL}
    ...    ${browser}=${BROWSER}
    [Documentation]
    ...    opening browser then go to web address that has been
    ...    setup in conf.tml (please check robot.BASE_URL)
    
    ${driverpath}    Evaluate    webdriver_manager.chrome.ChromeDriverManager().install()
    ...    modules=webdriver_manager.chrome
        
    Open Browser
    ...    url=${url}
    ...    browser=${browser}
    ...    executable_path=${driverpath}

    Set Window Size    1400    900
    Set Selenium Speed    0.1ms
    Set Selenium Timeout    ${TIMEOUT}
    Set Log Level    INFO


