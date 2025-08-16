*** Settings ***
Resource    ../TestData/Data_Common.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../ObjectRepository/Generic_Locators.robot
Resource    ../TestData/Data_Checkout.robot
*** Keywords ***
Verify "${product_search}" is not available
    [Documentation]    Keyword to verify product is not available
    ${PRODUCT_NOT_AVAILABLE_XP}=    Create Dynamic Xpath    ${GENERIC_DIV_CLASS}    ${product_not_available_class}    
    ${actual_product_not_available_text}=    Get Text    ${PRODUCT_NOT_AVAILABLE_XP}
    Should Contain    ${actual_product_not_available_text}    ${expected_product_not_available}
       
    


