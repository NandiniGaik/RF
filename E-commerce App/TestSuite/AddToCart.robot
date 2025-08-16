*** Settings ***
Resource    ../Keywords/AddToCart_Keywords.robot
Resource    ../ObjectRepository/AddToCart_Locators.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../Keywords/Product_Display_Keywords.robot
Resource    ../TestData/Data_AddToCart.robot
Test Setup    Login to Application    ${testuser}    ${testpassword}
#Test Teardown    Close All Browsers

*** Test Cases ***
Add_Items_To_Cart_Test
    [Documentation]
    ...    <b>Objective:</b>
    ...    Verify that the user can add items to the cart successfully.
    ...    <b>Pre-requisite:</b>
    ...    User must have access and is logged in to application
    ...    <b>Requirement Coverage:</b>
    ...    JIRA-45
    [Tags]    AddToCart    Sanity  
    Search product in Search Bar    ${product_to_search}    ${input_name_field}
    Click Add To cart
    Verify sucessfully added to cart message is displayed
    Capture Whole Page Screenshot    AddToCartSuccess


