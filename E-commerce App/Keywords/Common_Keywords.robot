*** Settings ***
Library    SeleniumLibrary    run_on_failure=Take Screenshot
Library    DateTime
Library    String
Resource    ../TestData/Data_Common.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../ObjectRepository/Home_Page_Locators.robot
Resource    ../ObjectRepository/Generic_Locators.robot

*** Keywords ***
Open Browser and Maximize Window
    Open Browser    ${url}    Chrome
    Maximize Browser Window

Wait for Specified timeout
    [Arguments]    ${timeout}
    Run Keyword And Ignore Error    ${DUMMY_LOC}    ${timeout}

Capture Whole Page Screenshot
    [Arguments]    ${name}    ${zoom_in}=50%
    Execute Javascript    "document.body.style.zoom='${zoom_in}';"
    ${timestamp}    Get Current Date    result_format=%Y%m%d%H%M%S
    ${SCREENSHOT_PATH}=    Capture Page Screenshot    ${name}_${timestamp}.png
    Execute Javascript    "document.body.style.zoom='100%';"
    RETURN    ${SCREENSHOT_PATH}

Capture Page Screenshot without Zoom
    [Arguments]    ${name}
    ${timestamp}    Get Current Date    result_format=%Y%m%d%H%M%S
    ${SCREENSHOT_PATH}=    Capture Page Screenshot    ${name}_${timestamp}.png
    RETURN    ${SCREENSHOT_PATH}

Click Dynamic Xpath Element
    [Arguments]    ${element_locator}    ${value_to_replace}
    ${xpath}=    Create Dynamic Xpath    ${element_locator}    ${value_to_replace}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${xpath}    timeout=${timeout_ten_seconds}
    IF    ${status}
        Scroll Element Into View    ${xpath}
        Wait for Specified timeout    ${timeout_five_seconds}
        ${status1}=    Run Keyword And Return Status    Click Element    ${xpath}
        IF    ${status1}==$False
            Click Element Using Javascript Executor    ${xpath}
        END
    END

Create Dynamic Xpath
    [Documentation]    Keyword to create dynamic xpath replacing single string or two string
    [Arguments]    ${xpath}    ${value_to_replace}    ${key_to_replace}=${EMPTY}    ${single_value_replacement}=True
    IF    ${single_value_replacement}
        ${final_xpath}=    Replace String    ${xpath}    VALUE_PLACEHOLDER    ${value_to_replace}
    ELSE
        ${final_replaced_xpath}=    Replace String    ${xpath}    KEY_PLACEHOLDER    ${key_to_replace}
        ${final_xpath}=    Replace String    ${final_replaced_xpath}    VALUE_PLACEHOLDER    ${value_to_replace}            
    END
    RETURN    ${final_xpath}
    #Changed

Click Element Using Javascript Executor
    [Arguments]    ${element_locator}
    ${element_locator}=    Get WebElement    ${element_locator}
    Execute Javascript    arguments[0].click();    ARGUEMENTS    ${element_locator}

Click button_name
    [Documentation]    Clicks the button with the specified name
    [Arguments]    ${button_name}
    ${buttton_xpath}=    Create Dynamic Xpath    ${GENERIC_BUTTON}    ${button_name}
    Wait Until Page Contains Element    ${buttton_xpath}    timeout=${timeout_ten_seconds}
    ${status}=    Run Keyword And Return Status    Scroll Element Into View    ${buttton_xpath}
    Run Keyword If    ${status}==${False}    Repeat Keyword    ${retry_ten_times}    Press Keys    ${None}    PAGE_DOWN
    TRY
        Click Element    ${buttton_xpath}
    EXCEPT    SeleniumLibrary.ElementNotFound
        Click Element Using Javascript Executor    ${buttton_xpath}
    END
    
Input text in field
    [Documentation]    Inputs text in the specified input field
    [Arguments]    ${product_name}    ${input_name_field}
    ${input_xpath}=    Create Dynamic Xpath    ${GENERIC_INPUT_NAME}    ${input_name_field}
    #Wait Until Element Is Visible    ${input_xpath}    ${timeout_thirty_seconds}
    Run Keyword And Ignore Error    Scroll Element Into View    ${input_xpath}
    Wait Until Element Is Visible    locator=${input_xpath}    timeout=${timeout_ten_seconds}
    Wait for Specified timeout    ${timeout_five_seconds}
    Input Text    ${input_xpath}    ${product_name}
