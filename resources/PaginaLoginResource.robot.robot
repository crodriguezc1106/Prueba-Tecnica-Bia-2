*** Settings ***
Library    SeleniumLibrary
Library    ../objetos_pagina/PaginaLogin.py

*** Variables ***
${USUARIO_VALIDO}               student
${PASSWORD_VALIDO}              Password123
${USUARIO_NO_VALIDO}            Profesor
${PASSWORD_NO_VALIDO}           123
${URL_LOGIN}                    https://practicetestautomation.com/practice-test-login/
${MENSAJE_LOGIN_EXITOSO}        Logged In Successfully
${MENSAJE_USUARIO_NO_VALIDO}    Your username is invalid!
${MENSAJE_PASSWORD_NO_VALIDO}   Your password is invalid!

*** Keywords ***
Ingresa a la pagina principal Test Login
    Open Browser    ${URL_LOGIN}    browser=Chrome
    Set Browser Implicit Wait    10
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    abrir_sitio    ${URL_LOGIN}

Ingresa usuario student y contraseña Password123
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_usuario    ${USUARIO_VALIDO}
    Call Method    ${pagina_login}    ingresar_password    ${PASSWORD_VALIDO}

Inicia sesion y se redirige a una página con el mensaje "Logged In Successfully"
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    inicia_sesion_y_valida_login_exitoso     ${MENSAJE_LOGIN_EXITOSO}

Validar la opción cerrar sesión
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    valida_opcion_cerrar_sesion

Dar clic en cerrar sesion
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    clic_cerrar_sesion

Validar que sea redirigido a la página de inicio de sesión
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    validar_url_inicio_y_cerrar_navegador    ${URL_LOGIN}

Ingresa usuario no valido Profesor
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_usuario    ${USUARIO_NO_VALIDO}
    
Contraseña valida Password123
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_password    ${PASSWORD_VALIDO}

Dar clic en el botón submit
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    clic_boton_submit

Muestra un mesaje de error "Your username is invalid!"
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    valida_mensaje_error     ${MENSAJE_USUARIO_NO_VALIDO}

Ingresa usuario valido student
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_usuario    ${USUARIO_VALIDO}

Contraseña no valida 123
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_password    ${PASSWORD_NO_VALIDO}

Muestra un mesaje de error "Your password is invalid!"
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    valida_mensaje_error     ${MENSAJE_PASSWORD_NO_VALIDO}
Archivo login_tests.robot

*** Settings ***
Resource    ../resources/PaginaLoginResource.robot

*** Test Cases ***
Iniciar sesión con éxito utilizando nombre de usuario y contraseña válidos
    Given Ingresa a la pagina principal Test Login
    When Ingresa usuario student y contraseña Password123
    Then Inicia sesion y se redirige a una página con el mensaje "Logged In Successfully"
    And Validar la opción cerrar sesión
    And Dar clic en cerrar sesion
    And Validar que sea redirigido a la página de inicio de sesión

Iniciar sesión con datos incorrectos utilizando nombre de usuario invalido y contraseña válida
    Given Ingresa a la pagina principal Test login
    When Ingresa usuario no valido Profesor
    And Contraseña valida Password123
    And Dar clic en el botón submit
    Then Muestra un mesaje de error "Your username is invalid!"

Iniciar sesión con datos incorrectos utilizando nombre de usuario valido y contraseña invalida
    Given Ingresa a la pagina principal Test login
    When Ingresa usuario valido student
    And Contraseña no valida 123
    And Dar clic en el botón submit
    Then Muestra un mesaje de error "Your password is invalid!"
