from selenium import webdriver
from selenium.common import NoSuchElementException
from selenium.webdriver.common.by import By


class PaginaLogin:
    def __init__(self):
        self.driver = None
        self.campo_usuario = 'username'
        self.campo_password = 'password'
        self.boton_login = 'submit'
        self.clase_login_exitoso = 'post-title'
        self.clase_boton_cerrar_sesion = 'wp-block-group'
        self.id_div_mensaje_error = 'error'

    def abrir_sitio(self, url):
        self.driver = webdriver.Chrome()
        self.driver.get(url)

    def ingresar_usuario(self, usuario):
        self.driver.find_element(By.ID, self.campo_usuario).send_keys(usuario)

    def ingresar_password(self, password):
        self.driver.find_element(By.ID, self.campo_password).send_keys(password)

    def inicia_sesion_y_valida_login_exitoso(self, mensaje):
        self.driver.find_element(By.ID, self.boton_login).click()
        mensaje_exitoso = self.driver.find_element(By.CLASS_NAME, self.clase_login_exitoso).text
        if mensaje_exitoso == mensaje:
            return True
        else:
            return False

    def valida_opcion_cerrar_sesion(self):
        try:
            self.driver.find_element(By.CLASS_NAME, self.clase_boton_cerrar_sesion)
            return True
        except NoSuchElementException:
            return False

    def clic_cerrar_sesion(self):
        self.driver.find_element(By.CLASS_NAME, self.clase_boton_cerrar_sesion).click()

    def validar_url_inicio_y_cerrar_navegador(self, url_inicio):
        assert self.driver.current_url == url_inicio, (f"La URL actual {self.driver.current_url} "
                                                       f"no coincide con {url_inicio}")
        self.driver.quit()

    def clic_boton_submit(self):
        self.driver.find_element(By.ID, self.boton_login).click()

    def valida_mensaje_error(self, mensaje):
        mensaje_error = self.driver.find_element(By.ID, self.id_div_mensaje_error).text
        if mensaje_error == mensaje:
            return True
        else:
            return False