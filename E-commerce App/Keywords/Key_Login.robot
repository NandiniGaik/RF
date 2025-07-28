*** Settings ***
Resource    ../TestData/Data_Common.robot
Resource    Common_Keywords.robot

*** Keywords ***
Login to Application
    [Arguments]    ${username}    ${password}
    Open Browser and Maximize Window
    Element Should Be Visible    