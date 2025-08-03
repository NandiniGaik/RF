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
    [Documentation]    Test case to verify the thumbnail product display on the home page
    Open Browser and Maximize Window
    Search product in Search Bar    ${product_name}    ${input_name_field}
    Click Dynamic Xpath Element    ${PRODUCT_DISPLAYED}    ${product_name}
    Click on on thumbnail product display and verify thumbnails    ${thumbnail_color}

    


    
    
    
    