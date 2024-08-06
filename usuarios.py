
from conexion10 import BaseDatos
class Usuario:
    def __init__(
            self,
            id_usuario: int = None,
            nombre: str = None,
            apellido: str = None,
            ciudad: str = None,
            direccion: str = None,
            telefono: str = None,
            es_propietario: bool = 1,
            es_veterinario: bool = 0,
            es_administrador: bool = 0,
            email: str = None,
            contrasenna: str = None
            ):
        self.__id_usuario = id_usuario,
        self.__nombre = nombre,
        self.__apellido = apellido,
        self.__ciudad = ciudad,
        self.__direccion = direccion,
        self.__telefono = telefono,
        self.__es_propietario = es_propietario,
        self.__es_veterinario = es_veterinario,
        self.__es_administrador = es_administrador,
        self.__email = email,
        self.__contrasenna = contrasenna,

    # GET y SET
    def get_id_usuario(self):
        return self.__id_usuario
    
    def set_id_usuario(self):
        while True:
            id_usuario = int(input('Escriba el id del usuario: '))
            if 0 < id_usuario <= 9999999:
                self.__id_usuario = id_usuario
                break
            else:
                print('Id de usuario incorrecto. Intente de nuevo')

    def get_nombre(self):
        return self.__nombre

    def set_nombre(self):
        while True:
            nombre = input('Nombre del usuario: ')
            if len(nombre)>2:
                self.__nombre = nombre
                break
            else:
                print('Nombre incorrecto. Intente de nuevo')
    
    def get_apellido(self):
        return self.__apellido

    def set_apellido(self):
        while True:
            apellido = input('apellido del usuario: ')
            if len(apellido)>2:
                self.__apellido = apellido
                break
            else:
                print('Apellido incorrecto. Intente de nuevo')

    def get_ciudad(self):
        return self.__ciudad

    def set_ciudad(self):
        while True:
            ciudad = input('Ciudad del usuario: ')
            if len(ciudad)>2:
                self.__ciudad = ciudad
                break
            else:
                print('Ciudad incorrecto. Intente de nuevo')
    
    def get_direccion(self): 
        return self.__direccion
    
    def set_direccion(self):
        while True:
            direccion = input('Direccion del usuario: ')
            if len(direccion)>2:
                self.__direccion = direccion
                break
            else:
                print('Direccion incorrecto. Intente de nuevo')
                
    def get_telefono(self): 
        return self.__telefono
    
    def set_telefono(self):
        while True:
            telefono = input('Telefono del usuario: ')
            if len(telefono)>5:
                self.__telefono = telefono
                break
            else:
                print('Telefono incorrecto. Intente de nuevo')

    def get_es_propietario(self): 
        return self.__es_propietario
    
    def set_propietario(self):
        while True:
            try:
                propietario = int(input("Es propietario 1 si es verdadero 0 si es falso:"))
                if propietario == 1 or propietario == 0:
                    self.__es_propietario = propietario
                    break
                else:
                    print('Valor incorreto')
            except KeyboardInterrupt:
                print("Accion cancelada")

    def get_es_veterinario(self): 
        return self.__es_veterinario
    
    def set_veterinario(self):
        while True:
            try:
                veterinario = int(input("Es veterinario 1 si es verdadero 0 si es falso:"))
                if veterinario == 1 or veterinario == 0:
                    self.__es_veterinario = veterinario
                    break
                else:
                    print('Valor incorreto')
            except KeyboardInterrupt:
                print("Accion cancelada")
    def get_es_administrador(self):
        return self.__es_administrador
    
    def set_administrador(self):
        while True:
            try:
                administrador = int(input("Es administrador 1 si es verdadero 0 si es falso:"))
                if administrador == 1 or administrador == 0:
                    self.__es_administrador = administrador
                    break
                else:
                    print('Valor incorreto')
            except KeyboardInterrupt:
                print("Accion cancelada")
                
    def get_email(self): 
        return self.__email
    
    def set_email(self):
        while True:
            email = input("Email del usuario: ")
            if "@" in email:
                self.__email = email
                break
            else:
                print('Email no válido')

    def get_contrasenna(self):
        return self.__contrasenna
    
    def set_contrasenna(self):
        while True:
            contrasenna = input("Contraseña del usuario: ")
            if 8 <= len(contrasenna):
                self.__contrasenna = contrasenna
                break
            else:
                print("La contraseña debe ser mayor a 8 carateres")

    def capturar_datos(self):
            self.set_id_usuario()
            self.set_nombre()
            self.set_apellido()
            self.set_ciudad()
            self.set_direccion()
            self.set_telefono()
            self.set_propietario()
            self.set_veterinario()
            self.set_administrador()
            self.set_email()
            self.set_contrasenna()

    def registrar_usuario(self):
        self.capturar_datos()
        conexion = BaseDatos.conectar()
        if conexion:
            cursor_usuario = conexion.cursor()
            cursor_usuario.callproc('InsertarUsuario',[
                self.__id_usuario,
                self.__nombre,
                self.__apellido,
                self.__ciudad,
                self.__direccion,
                self.__telefono,
                self.__es_propietario,
                self.__es_veterinario,
                self.__es_administrador,
                self.__email,
                self.__contrasenna
            ])
            conexion.commit()
        print('usuario registrado correctamente...')
        if conexion:
            BaseDatos.desconectar()

    def eliminar_usuario(self):
        self.set_id_usuario()
        conexion = BaseDatos.conectar()
        if conexion:
            cursor_usuario = conexion.cursor()
            cursor_usuario.callproc('EliminarUsuario',[
                self.__id_usuario
            ])
            conexion.commit()
        print("Usuario eliminado correctamente...")
        if conexion:
            BaseDatos.desconectar()