# py-robot-automation
personal robot framework project

# install driver for android
appium driver install uiautomator2

# logging appium to ports
appium --webhook localhost:9876

# running the appium server
appium server --port 4723 --base-path /wd/hub

# running paralel test cases
pabot --include <tag> --pythonpath . --testlevelsplit test

# for mobile 
appium plugin install --source=npm appium-device-farm
appium plugin install --source=npm appium-dashboard

# starting appium server
[//]: # (-ka => --keep-alive-timeout)
[//]: # (-pa => --base-path)
appium server -ka 800 --use-plugins=device-farm,appium-dashboard -pa /wd/hub --plugin-device-farm-platform=Android

