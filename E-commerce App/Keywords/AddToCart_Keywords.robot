*** Settings ***
Resource    ../TestData/Data_Common.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../ObjectRepository/AddToCart_Locators.robot
Resource    ../TestData/Data_AddToCart.robot

*** Keywords ***
Verify sucessfully added to cart message is displayed
    Wait Until Element Is Visible    ${SUCCESSFULLY_ADDED_TO_CART}
    ${actual_success_msg}=    Get Text    ${SUCCESSFULLY_ADDED_TO_CART}
    Should Contain    ${actual_success_msg}    ${expected_success_message} 

Click Add To cart
    Wait Until Element Is Visible    ${ADD_TO_CART}
    Click Element    ${ADD_TO_CART}
    


    