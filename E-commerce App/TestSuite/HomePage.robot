*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../Keywords/Common_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot

*** Test Cases ***
Application_Login_Test
    [Documentation]    Test case to verify user can log in to the application
    Login to Application    ${testuser}    ${testpassword}
    Verify that user has been logged into application    ${MY_ACCOUNT_SUCCESS}
    Home Page Header Colour Verfied
    Capture Whole Page Screenshot    HomePage
    Run Keywords    Logout from application    AND    Close Browser
    
    
