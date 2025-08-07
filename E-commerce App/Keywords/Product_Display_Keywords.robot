*** Settings ***
Resource    ../TestData/Data_Product_Display.robot
Resource    ../Keywords/Common_Keywords.robot
Resource    ../ObjectRepository/ProductDisplay_Locators.robot
Resource    ../ObjectRepository/Generic_Locators.robot
Resource    ../TestData/Data_HomePage.robot
Resource    ../Keywords/Key_Login_Keywords.robot
Resource    ../TestData/Data_HomePage.robot

*** Keywords ***
Search product in Search Bar
    [Documentation]    Searches for the specified product in the search bar
    [Arguments]    ${product_name}    ${input_name_field}
    Input text in field    ${product_name}    ${input_name_field}
    #Wait for Specified timeout    ${timeout_five_seconds}
    Click button_name    ${button_name}
    
Click on on thumbnail product display and verify thumbnails
    [Documentation]    Clicks on the thumbnail product display for the specified product
    [Arguments]    ${thumbnail_color}
    FOR    ${counter}    IN RANGE    1    4    
        Log    ${PRODUCT_DISPLAY_THUMBNAIL}
        Log    ${PRODUCT_DISPLAY_THUMBNAIL}[${counter}]
        ${xpath}=    Set Variable    ${PRODUCT_DISPLAY_THUMBNAIL.replace('{index}', str(${counter}))}
        Log    Clicking: ${xpath}
        Click Element    ${xpath}
        Verify color of thumbnail white box    ${thumbnail_color}
        Wait for Specified timeout    ${timeout_ten_seconds}
        #Capture Whole Page Screenshot    Thumbnail_white_box
        Capture Page Screenshot without Zoom    Thumbnail_white_box
        Verify navigation to next and prev thumbnail
        Capture Page Screenshot without Zoom    Next_Prev_Thumbnail
        Click button_name    ${close_class}
        Verify focus is on display Page
        Capture Page Screenshot without Zoom    Focus_Display_Page
        Wait for Specified timeout    ${timeout_five_seconds}
    END

Verify color of thumbnail white box
    [Documentation]    Verifies the color of the thumbnail white box
    [Arguments]    ${expected_color}
    ${color}=    Get CSS Property Value    ${THUMBNAIL_WHITE_BOX}    ${backgroundColor}
    Log    ${color}:${expected_color}
    Should Contain    ${color}    ${expected_color}

Verify navigation to next and prev thumbnail
    [Documentation]    Verifies navigation to the next thumbnail
    Click button_name    ${next_class}
    Element Should Be Visible    ${THUMBNAIL_IMG}
    Click button_name    ${prev_class}
    Element Should Be Visible    ${THUMBNAIL_IMG}

 Verify focus is on display Page
    [Documentation]    Verifies that the focus is on the display page after clicking on close
    ${CLOSE_BTN}=    Create Dynamic Xpath    ${GENERIC_BUTTON}    $value_to_replace=${close_class}
    Element Should Not Be Visible    ${CLOSE_BTN}

Verify Product Name,Brand and Product Code is
    [Documentation]    Verifies that Product Name, Brand and Product Code are displayed in the Product Display Page
    [Arguments]    ${product_name}    ${product_brand}    ${product_code}
    ${product_name_xpath}=    Create Dynamic Xpath    ${GENERIC_H1}    ${product_name}
    Element Should Be Visible    ${product_name_xpath}
    ${brand_txt}=    Get Text    ${BRAND}
    Should Be Equal    ${brand_txt}    ${product_brand}
    ${actual_product_code}=    Get Text    ${CODE}
    ${parts}=          Split String    ${actual_product_code}    :    
    ${actual_product_code}=        Set Variable    ${parts[1]}          
    Should Be Equal    ${actual_product_code}    ${product_code}
