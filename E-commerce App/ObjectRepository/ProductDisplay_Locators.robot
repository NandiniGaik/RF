*** Variables ***
${PRODUCT_DISPLAYED}    //a[text()="VALUE_PLACEHOLDER"]
${PRODUCT_DISPLAY_THUMBNAIL}    (//ul[@class="thumbnails"]//li)[{index}]
${THUMBNAIL_WHITE_BOX}    //div[contains(@class,"mfp-container mfp")]
${THUMBNAIL_IMG}    //img[@class="mfp-img"]
${GENERIC_H1}    //h1[text()="VALUE_PLACEHOLDER"]
${BRAND}    //li[text()="Brand: "]//a
${CODE}    //ul[@class="list-unstyled"]//li[contains(text(),"Product Code:")]
