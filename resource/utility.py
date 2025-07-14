import ast
import os
import json
import openpyxl
import toml
from typing import Union, Any
from datetime import datetime,timedelta
from robot.api.deco import keyword,not_keyword
from robot.libraries.BuiltIn import BuiltIn
import webdriver_manager.chrome
import webdriver_manager.firefox
import webdriver_manager.microsoft

result_folder = BuiltIn().get_variable_value("$RESULT_FOLDER")

def install_webdriver_based_on_installed_browser(browser: str ="google-chrome") -> str:
    match browser:
        case    "google-chrome":
            return webdriver_manager.chrome.ChromeDriverManager().install()
        case "firefox":
            return webdriver_manager.firefox.GeckoDriverManager().install()
        case "edge":
            return webdriver_manager.microsoft.EdgeChromiumDriverManager().install()
        case _:
            return "Unknown browser name, please check webdriver_manager documentation"

@keyword
def get_absolute_path(file_path: str) -> str:
    return os.path.abspath(file_path)

@keyword
def convert_string_dict_to_dict(string_dict: str) -> dict :
    return ast.literal_eval(string_dict)

@keyword
def read_values_from_json_file(folder_path: str , prefix="",extension="*.json") ->dict:
    abs_path = os.path.abspath(folder_path)
    valid_data = dict()

    for file in os.listdir(abs_path):
        filename = os.fsdecode(file)
        if (not filename.endswith(extension)) or (not filename.startswith(prefix)):
            continue

        with open(os.path.join(abs_path,filename)) as working_file:
            data = json.load(working_file)
            valid_data.update(data)

    return valid_data

@keyword
def read_values_from_spreadsheet(spreadsheet_file: str, sheet :str , coloumn_name:str) -> list:
    wb = openpyxl.load_workbook(spreadsheet_file)
    sheet_wb = wb[sheet]

    data = set()
    for col in sheet_wb.iter_cols(min_col=1, values_only=True):
        if col[0] == coloumn_name:
            for i,value in enumerate(col):
                if i != 0 and (value != None):
                    data.add(value)
        else:
            continue

    return list(data)

@keyword
def parsing_configuration(conf_path: str) -> dict:
    return toml.load(os.path.abspath(conf_path))