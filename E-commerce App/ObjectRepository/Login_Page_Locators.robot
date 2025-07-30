*** Variables ***
${USERNAME_FIELD}    //input[@name="email"]
${PASSWORD_FIELD}    //input[@name="password"]
${LOGIN_BUTTON}    //input[@value="Login"]
${MY_ACCOUNT_SUCCESS}    //div[@id='content']//h2[text()='My Account']
${LOGOUT_LINK}    //ul[@class="dropdown-menu dropdown-menu-right"]//a[text()="Logout"]
${LOGOUT_SUCCESS}    //h1[contains(text(),"Account Logout")]