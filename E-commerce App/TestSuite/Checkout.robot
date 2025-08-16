*** Settings ***
Resource    ../Keywords/Common_Keywords.robot
Resource    ../TestData/Data_Common.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../Keywords/AddToCart_Keywords.robot
Resource    ../TestData/Data_AddToCart.robot
Resource    ../TestData/Data_AddToCart.robot
Resource    ../Keywords/Product_Display_Keywords.robot
Resource    ../Keywords/Checkout_Keywords.robot
Test Setup    Login to Application    ${testuser}    ${testpassword}
Test Teardown    Close All Browsers

*** Test Cases ***
Checkout_Produtcs
    [Documentation]
    ...    <b>Objective:</b>
    ...    Verify checkout process 
    ...    <b>Pre-requisite</b>
    ...    User must have access and logged into application
    ...    <b>Requirement Coverage</b>
    ...    JIRA-344
    [Tags]    Checkout    Sanity
    Search product in Search Bar    ${product_to_search}    ${input_name_field}
    Click Add To cart
    Click Dynamic Xpath Element    ${GENERIC_TOP_LINK}    ${shopping_cart_class}
    Click Dynamic Xpath Element    ${GENERIC_A_CLASS}    ${checkout_class}
    Verify "${product_to_search}" is not available 
    Capture Whole Page Screenshot    ProductNotAvailable

