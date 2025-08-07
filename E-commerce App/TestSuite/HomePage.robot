*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../Keywords/Common_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot

*** Test Cases ***
Application_Login_Test
    [Documentation]
    ...    <b>Objective(s):</b>
    ...     Verify user can log in to the application
    ...    <b>Prerequisite(s):</b>
    ...        1.User must have access to the application
    ...        2.User must have valid credentials
    ...    <b>Requirement Coverage:</b>
    ...        JIRA-12
    [Tags]    Login    Sanity    Homesuite
    Login to Application    ${testuser}    ${testpassword}
    Verify that user has been logged into application    ${MY_ACCOUNT_SUCCESS}
    Home Page Header Colour Verfied
    Capture Whole Page Screenshot    HomePage
    Run Keywords    Logout from application    AND    Close Browser


    
    
    
    
