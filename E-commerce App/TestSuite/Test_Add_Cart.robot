*** Settings ***
Library    SeleniumLibrary
Resource    ../Keywords/Common_Keywords.robot

*** Test Cases ***
Application_Login_Test
    [Documentation]    Test case to verify user can log in to the application
    Open Browser and Maximize Window
    
