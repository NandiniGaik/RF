*** Settings ***
Library    SeleniumLibrary    run_on_failure=Take Screenshot
Resource    ../TestData/Data_Common.robot

*** Keywords ***
Open Browser and Maximize Window
    Open Browser    ${url}    Chrome
    Maximize Browser Window
