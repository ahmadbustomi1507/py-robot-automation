*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Test Teardown    Close Application

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}


*** Test Cases ***
Randomly click this and click that
  Open Test Application
  Capture Page Screenshot    testing.png
  Click Element      //*[@text="Accessibility"]

  Wait Until Element Is Visible    //*[@text="Accessibility Node Querying"]
  Capture Page Screenshot    testing.png
  Click Element      //*[@text="Accessibility Node Querying"]

  Capture Page Screenshot    testing.png
  Click Element      //*[@text="Do Taxes"]/following-sibling::android.widget.CheckBox
  Press Keycode    4

  Capture Page Screenshot    testing.png
  Click Element     //*[@text="Accessibility Service"]
  ${text}    Get Text    //android.widget.TextView[contains(@text,"Enable TalkBack")]
  Log To Console    The text is \n ${text}

  Sleep    10s

*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723/wd/hub
  ...    automationName=${ANDROID_AUTOMATION_NAME}
  ...    platformName=${ANDROID_PLATFORM_NAME}
  ...    platformVersion=10
  ...    app=${ANDROID_APP}
#  ...    udid=RRCW40152BK
  ...    udid=32010305800b2665
  ...    appPackage=io.appium.android.apis
  ...    appActivity=io.appium.android.apis.ApiDemos
  ...    noReset=${False}
  ...    fullReset=${True}