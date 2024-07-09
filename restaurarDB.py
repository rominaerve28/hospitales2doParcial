import mysql.connector
import subprocess
import os

# #importaciones
# import subprocess
# import getpass

# with open('D:/world.sql', 'w') as out:
#     subprocess.Popen(f'"C:/Program Files/MySQL/MySQL Server 8.0/"mysqldump --user=root --password={getpass.getpass()} --databases world', shell=True, stdout=out)





conexion = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456'
)

HOST = 'localhost'

def respaldoBaseDatos():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario: ")
        contrasena = input("Ingresa la contraseña: ")
        nombre_base_datos = input("Ingrese el nombre de la base de datos a respaldar. ")
        archivo_respaldo = input("Ingrese el nombre para el archivo.sql(ubique el '.sql' al final): ")
    
    
        # os.popen(f"mysqldump -h {HOST} -u {usuario} -p {contrasena} {nombre_base_datos} > {archivo_respaldo}")
        
        # os.popen(f'"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/"mysqldump -h {HOST} -u {usuario} -p {contrasena} {nombre_base_datos} > {archivo_respaldo}')
        # comando = f'"C:/Program Files/MySQL/MySQL Server 8.0/"mysqldump -u {usuario} -p{contrasena} {nombre_base_datos} > {archivo_respaldo}'
        
        # resultado = subprocess.run(comando, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        
        # if resultado.returncode == 0:
        #     print(f"Respaldo de la base de datos '{nombre_base_datos}' realizado correctamente en '{archivo_respaldo}'.")
        # else:
        #     print(f"Error al realizar el respaldo: {resultado.stderr.decode()}")
        
        with open(f'C:/Respaldosdb/{archivo_respaldo}', 'w') as out:
            subprocess.Popen(f'"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/"mysqldump --user={usuario} --password={contrasena} --databases {nombre_base_datos}', shell=True, stdout=out)
    
    except subprocess.CalledProcessError as error:
        print(f"Error al ejecutar el comando: {error}")
    finally:
        if conexion.is_connected():
            conexion.close()
            print("Conexión cerrada.")




def restaurarBaseDatos():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario: ")
        contrasena = input("Ingresa la contraseña: ")
        archivo_respaldo = input("Ingrese el nombre para el archivo.sql(ubique el '.sql' al final): ")
        subprocess.Popen(f'"C:/Program Files/MySQL/MySQL Workbench 8.0 CE/mysql" --user={usuario} --password={contrasena} < C:/Respaldosdb/{archivo_respaldo}', shell=True)
        
        
    except subprocess.CalledProcessError as error:
        print(f"Error al ejecutar el comando: {error}")
    finally:
        if conexion.is_connected():
            conexion.close()
            print("Conexión cerrada.")