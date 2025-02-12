*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}  https://www.practo.com/tawang/doctors
${LOGIN}  //a[@name='Practo login']
${PHONE_NUMBER}  //input[@id="username"]
${PASSWORD}  //input[@id="password"]
${LOGIN_BUTTON}  //button[@id='login']
${DOCTOR_PROFILE}  (//h2[@data-qa-id='doctor_name'])[1]/ancestor::a
${SHARE_YOUR_STORY}  //a[@data-qa-id='doctor-give-feedback']
${RECOMMEND_DOCTOR}  //div[contains(@class, 'recommend-yes')]
${SELECT_CLINIC}   //div[@class='Select-placeholder']
${FIRST_CLINIC}  //div[contains(@class, 'Select-menu')]//div[contains(@class, 'Select-option')][1]
${TEXT_AREA}  //textarea[@placeholder="Start typing here..."]
${ENTER_NAME}  //input[@placeholder="Your Name"]
${ENTER_NUMBER}  //input[@placeholder="Your Phone Number"]
${GET_OTP}  //span[@class="c-feedback-form__submit-text"]
${TEXT_INPUT}  The doctor was extremely professional, demonstrating a high level of expertise and compassion throughout the entire consultation. They took the time to listen carefully to all concerns, provided a thorough examination, and explained the diagnosis and treatment plan in a clear and reassuring manner.
${USER_NAME}   Dhanush M
${PHONE_NUMBER_INPUT}  8296161413
${CLICK_YES}  (//span[text()="Yes"])[2]
${VERIFY}  //p[@class='thankyou-layout__header']
${PASSWORD_INPUT}  Dhanush@82961



*** Test Cases ***
Submitting Doctor Feedback
    Open Browser  ${URL}  Chrome
    Maximize Browser Window

    Wait Until Element Is Visible  ${LOGIN}  20s
    Click Element  ${LOGIN}

    Wait Until Element Is Visible  ${PHONE_NUMBER}  10s
    Input Text  ${PHONE_NUMBER}  ${PHONE_NUMBER_INPUT}

    Wait Until Element Is Visible  ${PASSWORD}  10s
    Input Text  ${PASSWORD}  ${PASSWORD_INPUT}

    Wait Until Element Is Visible  ${LOGIN_BUTTON}  20s
    Click Element  ${LOGIN_BUTTON}

    Wait Until Element Is Visible  ${DOCTOR_PROFILE}  10s
    ${doctor_href}=  Get Element Attribute    ${DOCTOR_PROFILE}  href

    Go To  ${doctor_href}

    Wait Until Element Is Visible  ${SHARE_YOUR_STORY}  20s
    Click Element  ${SHARE_YOUR_STORY}

    Wait Until Element Is Visible  ${RECOMMEND_DOCTOR}  10s
    Click Element  ${RECOMMEND_DOCTOR}

    Wait Until Element Is Visible  ${SELECT_CLINIC}  10s
    Click Element  ${SELECT_CLINIC}

    Wait Until Element Is Visible  ${FIRST_CLINIC}  10s
    Click Element  ${FIRST_CLINIC}

    Wait Until Element Is Visible  ${TEXT_AREA}  10s
    Input Text    ${TEXT_AREA}    ${TEXT_INPUT}

    Wait Until Element Is Visible  ${ENTER_NAME}  10s
    Input Text  ${ENTER_NAME}  ${USER_NAME}

    Wait Until Element Is Visible  ${ENTER_NUMBER}  10s
    Input Text   ${ENTER_NUMBER}    ${PHONE_NUMBER_INPUT}

    Wait Until Element Is Visible    ${GET_OTP}    10s
    Click Element    ${GET_OTP}

    ${status}=  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${CLICK_YES}  10s
    Run Keyword If  '${status}[0]' == 'PASS'  Click Element  ${CLICK_YES}

    Wait Until Element Is Visible  ${VERIFY}  10s

    Sleep  5s
    Close Browser
