*** Settings ***
Resource    ../TestData/Data_Common.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../ObjectRepository/Home_Page_Locators.robot
Resource    ../ObjectRepository/Generic_Locators.robot
Resource    ../ObjectRepository/Login_Page_Locators.robot
Resource    ../TestData/Data_HomePage.robot


*** Keywords ***
Login to Application
    [Arguments]    ${username}    ${password}
    Open Browser and Maximize Window
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${MY_ACCOUNT}    timeout=${timeout_thirty_seconds}
    WHILE    not ${status}    limit=4
        Close All Browsers
        Wait for Specified timeout    ${timeout_ten_seconds}
        Open Browser and Maximize Window
        ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${MY_ACCOUNT}    timeout=${timeout_ten_seconds}
    END
    Click Element    ${MY_ACCOUNT}
    Click Element    ${LOGIN_LIST_LINK}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Verify that user has been logged into application
    [Documentation]    Verify that user has been logged into application
    [Arguments]    ${MY_ACCOUNT_SUCCESS}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${MY_ACCOUNT_SUCCESS}    timeout=${timeout_thirty_seconds}
    IF    '${status}'== 'False'
        Attempt to Screen Loaded    ${MY_ACCOUNT_SUCCESS}    ${landing-sc-err-msg}
    END
    Page Should Contain Element    ${MY_ACCOUNT_SUCCESS}    message=User has not been logged in successfully 
    
Attempt to Screen Loaded
    [Arguments]    ${label}    ${err-msg}
    FOR    ${INDEX}    IN RANGE    1    6    
        Log    ${INDEX}
           ${portal-loaded}    Run Keyword And Return Status    
           ...    Wait Until Page Contains Element    
           ...    ${label}    timeout=${timeout_thirty_seconds}    error=Portal has not been loaded
            Log    ${portal-loaded}
           IF    ${portal-loaded} == 'True'    BREAK
           Log To Console    Login page has not ben loaded
           Reload Page
           Wait for Specified timeout    ${timeout_ten_seconds}
           IF    '${INDEX}' == 5    Fail    msg=${err-msg}    
    END
    
Home Page Header Colour Verfied
    [Documentation]    Verify the home page header colour
    Page Should Contain Element    ${HEADER_TEXT}
    ${color}    Get CSS Property Value    ${HEADER_TEXT}    ${backgroundColor}
    Should Contain    ${color}    ${header_color}
Get CSS Property Value
    [Documentation]    Get the CSS property value of an element
    [Arguments]    ${locator}    ${attribute name}
    ${css}    Get WebElement    ${locator}    
    ${prop_val}    Call Method    ${css}    value_of_css_property    ${attribute name}
    RETURN    ${prop_val}
    
Logout from application    
    [Documentation]    Logout from the application
    Click Element    ${MY_ACCOUNT}
    Wait Until Element Is Visible    ${LOGOUT_LINK}    timeout=${timeout_ten_seconds}
    Click Element    ${LOGOUT_LINK}
    Wait Until Page Contains Element    ${LOGOUT_SUCCESS}    timeout=${timeout_thirty_seconds}
    Page Should Contain Element    ${LOGOUT_SUCCESS}    message=User has not been logged out successfully
    

