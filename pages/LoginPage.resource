*** Settings ***
Library    SeleniumLibrary    timeout=5s    run_on_failure=Capture Page Screenshot

*** Variables ***
${sample_xpath}    xpath://a[.="Contract"]
${checkout_button}    css:button#checkout


*** Keywords ***
Complete the transaction
    Wait Until Page Contains    Checkout: Complete!
    Wait Until Page Contains    Thank you for your order!
    Click Button    css:button#back-to-products
    Wait Until Page Contains    Products

Checkout the product
    Click Button    css:button#checkout
    Input Text    css:input#first-name    ahmad
    Input Text    css:input#last-name    bustomi
    Input Text    css:input#postal-code    12313
    Click Button    css:input#continue
    Wait Until Page Contains    Checkout: Overview
    Click Button    css:button#finish


Access shopping cart
    Click Element    css:div#shopping_cart_container a
    Wait Until Page Contains    Your Cart
    Element Should Contain    css:div#cart_contents_container .cart_list    ${item1}


Add to cart
    Click Button    css:button#add-to-cart
    Element Should Be Visible   css:button#remove
    Element Should Not Be Visible    css:button#add-to-cart

Signing with correct password
    [Arguments]    ${username}=standard_user    ${password}=secret_sauce
    Input Text    css:input#user-name    ${username}
    Input Text    css:input#password    ${password}
    Click Button  css:input#login-button
    Capture Page Screenshot
    Wait Until Page Contains    Products

Choose product
    [Arguments]    ${product_name}
    Click Element    xpath://*[contains(text(),'${product_name}')]/parent::a

    Wait Until Element Is Enabled    css:#inventory_item_container
    Wait Until Element Is Visible    css:#inventory_item_container
    Wait Until Page Contains Element   css:#inventory_item_container

    Wait Until Page Contains    Back to products
    Capture Page Screenshot   ${product_name}.png
    #nama product
    ${nama_produk}    Get Text    css:.inventory_details_desc_container .inventory_details_name.large_size

    #deskripsi product
    ${deskripsi}    Get Text    css:.inventory_details_desc_container .inventory_details_desc.large_size    #deskripsi product

    #detail price
    ${price}    Get Text    css:.inventory_details_desc_container .inventory_details_price

    RETURN  ${nama_produk}    ${deskripsi}    ${price}