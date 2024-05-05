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