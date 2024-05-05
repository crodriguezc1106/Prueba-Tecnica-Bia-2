Archivo PaginaLoginResource.robot
*** Settings ***
Library    SeleniumLibrary
Library    ../objetos_pagina/PaginaLogin.py

*** Variables ***
${URL_LOGIN}        https://practicetestautomation.com/practice-test-login/


*** Keywords ***
Ingresa a la pagina principal Test Login
    Open Browser    ${URL_LOGIN}    browser=Chrome
    Set Browser Implicit Wait    10
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    abrir_sitio    ${URL_LOGIN}

Ingresa usuario y contraseña
    [Arguments]    ${username}    ${password}
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    ingresar_usuario    ${username}
    Call Method    ${pagina_login}    ingresar_password    ${password}

Inicia sesion y se redirige a una página con el mensaje
    [Arguments]    ${mensaje}
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    inicia_sesion_y_valida_login_exitoso     ${mensaje}

Validar la opción cerrar sesión
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    valida_opcion_cerrar_sesion

Dar clic en cerrar sesion
    ${pagina_login}=    Get Library Instance    PaginaLogin
    Call Method    ${pagina_login}    clic_cerrar_sesion