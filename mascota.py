#from historial_medico import HistorialMedico
from conexion10 import BaseDatos
class Mascota:
    def __init__(
            self,
            codigo: int = None,
            nombre: str= None,
            especie: str= None,
            raza: str= None,
            edad: float= None,
            peso: float= None,
            usuario: int = None,
            historial_medico= None
            ):
        self.__codigo = codigo
        self.__nombre = nombre
        self.__especie = especie
        self.__raza = raza
        self.__edad = edad
        self.__peso = peso
        self.__usuario = usuario
        self.__historial_medico = historial_medico if historial_medico is not None else []

    # GET y SET

    def get_codigo(self):
        return self.__codigo
    
    def set_codigo(self):
        while True:
            codigo = int(input('Escriba el codigo de la mascota: '))
            if codigo >= 3 and codigo <= 9999999:
                self.__codigo = codigo
                break
            else:
                print('Codigo incorrecto. Intente de nuevo')


    def get_nombre(self):
        return self.__nombre


    def set_nombre(self):
        while True:
            nombre = input('Nombre de la mascota: ')
            if len(nombre)>2:
                self.__nombre = nombre
                break
            else:
                print('Nombre incorrecto. Intente de nuevo')

    def get_especie(self):
        return self.__especie
    
    def set_especie(self):
        while True:
            especie = input('Especie de la mascota (gato, perro...): ')
            if 2 < len(especie) <= 20:
                self.__especie = especie
                break
            else:
                print('Datos incorrectos. Intente de nuevo')

    def get_raza(self):
        return self.__raza

    def set_raza(self):
        while True:
            raza = input('Raza de la mascota: ')
            if raza.isalpha() and 2 < len(raza) <= 20:
                self.__especie = raza
                break
            else:
                print('Datos de raza incorrectos. Intente de nuevo')
        self.__raza = raza
    
    def get_edad(self):
        return self.__edad

    def set_edad(self):
        while True:
            edad = float(input('Edad de la mascota (años): '))
            if 0 < edad <= 25:
                self.__edad = edad
                break
            else:
                print('Edad no válida')

    def get_peso(self):
        return self.__peso

    def set_peso(self):
        while True:
            peso = float(input('Peso en kg: '))
            if (0 < peso <= 25):
                self.__peso = peso
                break
            else:
                print('Peso no válido')


    def get_usuario(self):
        return self.__usuario
    

    def set_usuario(self):
        while True:
            usuario = int(input('Id usuario: '))
            if (0 < usuario <= 1000000000):
                self.__usuario = usuario
                break
            else:
                print('Usuario no válido')

    def get_historial(self):
        return self.__historial
    

    def agregar_historial_medico(self, entrada: str):
        self.__historial_medico.append(entrada)


    def capturar_datos(self):
            self.set_codigo()
            self.set_nombre()
            self.set_especie()
            self.set_raza()
            self.set_edad()
            self.set_peso()
            self.set_usuario()


    def registrar_mascota(self):
        self.capturar_datos()
        conexion = BaseDatos.conectar()
        if conexion:
            cursor_mascota = conexion.cursor()
            cursor_mascota.callproc('insertar_mascota' , [
                self.__codigo,
                self.__nombre,
                self.__especie,
                self.__raza,
                self.__edad,
                self.__peso,
                self.__usuario
            ])
            conexion.commit()
        print('Mascota registrada correctamente...')
        if conexion:
            BaseDatos.desconectar()
    def eliminar_mascota(self):
        self.set_codigo()
        conexion = BaseDatos.conectar()
        if conexion:
            cursor_mascota = conexion.cursor()
            cursor_mascota.callproc('eliminar_mascota',[
                self.__codigo
            ])
            conexion.commit()
        print("Mascota eliminada correctamente...")
        if conexion:
            BaseDatos.desconectar()

mascota1 = Mascota()
# mascota1.registrar_mascota()
mascota1.eliminar_mascota()