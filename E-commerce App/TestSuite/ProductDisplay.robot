*** Settings ***
Resource    ../Keywords/Common_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../TestData/Data_Product_Display.robot
Resource    ../TestData/Data_HomePage.robot  
Resource    ../ObjectRepository/ProductDisplay_Locators.robot  
Resource    ../ObjectRepository/Generic_Locators.robot
Resource    ../Keywords/Product_Display_Keywords.robot



*** Test Cases ***
Thumbnail_Product_Display_Test
    [Documentation]
    ...    <b>Objective(s):</b>
    ...     Verify product display on thumbnail
    ...    <b>Prerequisite(s):</b>
    ...        1.User must have access to the application
    ...        2.User must have valid credentials
    ...    <b>Requirement Coverage:</b>
    ...        JIRA-125
    [Tags]    Thumbnail    Sanity    ProductDisplay
    Open Browser and Maximize Window
    Search product in Search Bar    ${product_name}    ${input_name_field}
    Click Dynamic Xpath Element    ${PRODUCT_DISPLAYED}    ${product_name}
    Click on on thumbnail product display and verify thumbnails    ${thumbnail_color}
    

 Validate_Product_Name_Brand_And_Code_Displayed
    [Documentation]
    ...    <b>Objective(s):</b>
    ...     Validate that Product Name, Brand and Product Code are displayed in the Product Display Page
    ...    <b>Prerequisite(s):</b>
    ...        1. User must have access to the application
    ...        2. User must have valid credentials
    ...    <b>Requirement Coverage:</b>
    ...        JIRA-126
    [Tags]    ProductInfo    Sanity    ProductDisplay
    Open Browser and Maximize Window
    Search product in Search Bar    ${product_name}    ${input_name_field}
    Click Dynamic Xpath Element    ${PRODUCT_DISPLAYED}    ${product_name}
    Verify Product Name,Brand and Product Code is    ${product_name}    ${product_brand}    ${product_code}
    Capture Whole Page Screenshot    ProductDisplayPage
    
    
    
    