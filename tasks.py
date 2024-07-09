import mysql.connector
import time

conexion = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456'
)

HOST = 'localhost'


def addUser():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario: ")
        contraseña = input("Ingresa la contraseña: ")
        
        cursor = conexion.cursor()

        consulta = f"CREATE USER '{usuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"

        cursor.execute(consulta)

        conexion.commit()

        print("Usuario agregado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def updateUser():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario que quiere actualizar: ")
        newUsuario = input("Ingresa el nuevo nombre del usuario: ")
        contraseña = input("Ingresa la nueva contraseña: ")
        
        cursor = conexion.cursor()

        consulta = f"RENAME USER '{usuario}'@'{HOST}' TO '{newUsuario}'@'{HOST}'"
        
        cursor.execute(consulta)
        conexion.commit()
        
        consulta2 = f"ALTER USER '{newUsuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"

        cursor.execute(consulta2)
        conexion.commit()
        

        print("Usuario actualizado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al actualizar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def deleteUser():
    try: 
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario a ser eliminado: ")

        cursor = conexion.cursor()

        consulta = f"DROP USER '{usuario}'@'{HOST}'"

        cursor.execute(consulta)
        conexion.commit()

        print("Usuario eliminado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al eliminar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")


def getUsers():
    try:
        conexion._open_connection()

        
        cursor = conexion.cursor()

        consulta = f"SELECT * FROM mysql.user"

        cursor.execute(consulta)

        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print(consulta)
        print("Presiona Enter para continuar...")
        input()
        print("Continuando con el programa...")

    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def getRoles():
    try:
        conexion._open_connection()
        
        cursor = conexion.cursor()

        consulta = f"""SELECT COLUMN_NAME
                    FROM information_schema.COLUMNS
                    WHERE TABLE_NAME = 'user' 
                    AND TABLE_SCHEMA = 'mysql' 
                    AND COLUMN_TYPE LIKE "enum('N','Y')"
                    AND IS_NULLABLE = 'NO'"""

        cursor.execute(consulta)

        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print("Presiona Enter para continuar...")
        input()
        print("Continuando con el programa...")

    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")


def procedimientosAlmacenados():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='hospitales_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()

        cursor.execute("SHOW TABLES FROM hospitales_db")
        tablas = cursor.fetchall()

        with open('procedimientoAlmacenado.sql', 'w') as archivo:
            archivo.write(f"DELIMITER $$\n\n")
            
            for tabla in tablas:
                nombre_tabla = tabla[0]
                cursor.execute(f"DESCRIBE {nombre_tabla}")
                columnas = cursor.fetchall()
                
                # Identificar la clave primaria
                primary_key = None
                columnas_nombres = []
                columnas_parametros = []
                columnas_update = []
                
                for columna in columnas:
                    col_name = columna[0]
                    col_type = columna[1]
                    if columna[3] == 'PRI' and columna[5] == 'auto_increment':
                        primary_key = col_name
                    else:
                        columnas_nombres.append(col_name)
                        columnas_parametros.append(f"IN p_{col_name} {col_type}")
                        columnas_update.append(f"{col_name} = p_{col_name}")

                # Generar nombres de columnas y parámetros
                columnas_insert = ", ".join(columnas_nombres)
                columnas_parametros = ", ".join(columnas_parametros)
                
                # Procedimiento almacenado para insertar registros
                archivo.write(f"CREATE PROCEDURE Insertar_{nombre_tabla} ({columnas_parametros}) \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    INSERT INTO {nombre_tabla} ({columnas_insert}) VALUES ({', '.join([f'p_{col}' for col in columnas_nombres])});\n")
                archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para actualizar registros
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Actualizar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}, {columnas_parametros}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    UPDATE {nombre_tabla} SET {', '.join(columnas_update)} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para eliminar registros
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Eliminar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    DELETE FROM {nombre_tabla} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para obtener todos los registros
                archivo.write(f"CREATE PROCEDURE ObtenerTodos_{nombre_tabla} () \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    SELECT * FROM {nombre_tabla};\n")
                archivo.write(f"END $$\n\n")
            
            archivo.write(f"DELIMITER ;\n")
    
        print("Scripts de procedimientos almacenados generados exitosamente.")
    
    except mysql.connector.Error as error:
        print("Error al generar script: ", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")

def triggers():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='hospitales_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()
        
        cursor2 = conexion.cursor()
        cursor2.execute("""SELECT 
                                TABLE_NAME AS 'Tabla',
                                COLUMN_NAME AS 'Columna'
                            FROM
                                INFORMATION_SCHEMA.COLUMNS
                            WHERE
                                TABLE_SCHEMA = 'hospitales_db'
                            ORDER BY TABLE_NAME, ORDINAL_POSITION;""")
        tablasAtributos = cursor2.fetchall()
        for tabla in tablasAtributos:
            print(tabla)

        time.sleep(2)

        cursor.execute("SHOW TABLES FROM hospitales_db")
        tablas = cursor.fetchall()
        


        with open('triggers.sql', 'w') as archivo:
            archivo.write("DELIMITER $$\n\n")
            
            for tabla in tablas:
                nombre_tabla = tabla[0]
                
                
                if nombre_tabla.lower() == 'auditoria':
                    continue
                
                # Trigger para INSERT
                archivo.write(f"CREATE TRIGGER trg_insert_{nombre_tabla} AFTER INSERT ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Insertado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
                # Trigger para UPDATE
                archivo.write(f"CREATE TRIGGER trg_update_{nombre_tabla} AFTER UPDATE ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Actualizado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
                # Trigger para DELETE
                archivo.write(f"CREATE TRIGGER trg_delete_{nombre_tabla} AFTER DELETE ON {nombre_tabla} \n")
                archivo.write(f"FOR EACH ROW \n")
                archivo.write(f"BEGIN \n")
                archivo.write(f"    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) \n")
                archivo.write(f"    VALUES ('{nombre_tabla}', CURRENT_USER(), 'Eliminado registro en {nombre_tabla}'); \n")
                archivo.write(f"END $$\n\n")
                
            archivo.write("DELIMITER ;\n")
        
        print("Scripts de triggers generados exitosamente.")
        time.sleep(2)

    
    except mysql.connector.Error as error:
        print("Error al generar script: ", error)
    
    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")


def crearProcedimiento():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='hospitales_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()
        cursor2 = conexion.cursor()
        
        cursor2.execute("SHOW PROCEDURE STATUS WHERE Name = 'CrearConsultaCompleta'")

        resultado = cursor2.fetchall()

        if resultado:
            print(f"El procedimiento almacenado CrearConsultaCompleta ya existe en la base de datos.")
            time.sleep(2)
        else:
    
            consulta = """  
                            CREATE PROCEDURE CrearConsultaCompleta(
                                IN p_id_paciente INT,
                                IN p_id_medico INT,
                                IN p_fecha_hora VARCHAR(255),
                                IN p_motivo TEXT,
                                IN p_diagnostico VARCHAR(255),
                                IN p_tratamiento VARCHAR(255),
                                IN p_medicamentos VARCHAR(255),
                                IN p_notas TEXT,
                                IN p_tipo_examen VARCHAR(255),
                                IN p_resultado VARCHAR(255),
                                IN p_fecha_realizacion VARCHAR(255)
                            )
                            BEGIN
                                DECLARE done INT DEFAULT 0;
                                DECLARE id_medicamento_cursor INT;
                                
                                -- Declaración de cursor
                                DECLARE medicamento_cursor CURSOR FOR
                                    SELECT id_medicamento
                                    FROM Medicamento
                                    WHERE nombre = p_medicamentos;
                            
                                -- Manejador para cuando el cursor no encuentra más filas
                                DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
                            
                                -- Manejo de errores: revertir la transacción
                                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                                BEGIN
                                    ROLLBACK;
                                    RESIGNAL;
                                END;
                            
                                -- Iniciar la transacción
                                START TRANSACTION;
                            
                                -- Crear una nueva cita
                                INSERT INTO Cita (id_paciente, id_medico, fecha_hora, motivo, estatus)
                                VALUES (p_id_paciente, p_id_medico, p_fecha_hora, p_motivo, 'Pendiente');
                            
                                -- Obtener el ID de la cita recién creada
                                SET @id_cita = LAST_INSERT_ID();
                            
                                -- Crear una nueva consulta basada en la cita
                                INSERT INTO Consulta (id_cita, diagnostico, tratamiento, medicamentos, notas)
                                VALUES (@id_cita, p_diagnostico, p_tratamiento, p_medicamentos, p_notas);
                            
                                -- Obtener el ID de la consulta recién creada
                                SET @id_consulta = LAST_INSERT_ID();
                            
                                -- Registrar un examen relacionado con la consulta
                                INSERT INTO Examen (id_consulta, tipo_examen, resultado, fecha_realizacion)
                                VALUES (@id_consulta, p_tipo_examen, p_resultado, p_fecha_realizacion);
                            
                                -- Abrir el cursor
                                OPEN medicamento_cursor;
                            
                                -- Bucle para recorrer los resultados del cursor
                                cursor_loop: LOOP
                                    FETCH medicamento_cursor INTO id_medicamento_cursor;
                                    IF done THEN
                                        LEAVE cursor_loop;
                                    END IF;
                                    
                                    -- Actualizar el inventario de medicamentos
                                    UPDATE Inventario_medicamento
                                    SET cantidad_stock = cantidad_stock - 1
                                    WHERE id_medicamento = id_medicamento_cursor;
                                   	SELECT cantidad_stock FROM Inventario_medicamento WHERE id_medicamento = id_medicamento_cursor;
                                END LOOP;
                            
                            
                                -- Cerrar el cursor
                                CLOSE medicamento_cursor;
                            
                                -- Finalizar la transacción
                                COMMIT;
                            END;                           
                            """
            cursor.execute(consulta)
            conexion.commit()
            print("Procedimiento creado correctamente.")
            time.sleep(2)
    
    except mysql.connector.Error as error:
        print("Error al crear el proceso.", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            cursor2.close()
            conexion.close()
            print("Conexión cerrada.")




def procesoCursor():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='hospitales_db'
    )
    try:
        conexion._open_connection()
        paciente = input("Ingresa el id del paciente: ")
        medico = input("Ingresa el id del medico: ")
        medicamento = input("Ingresa el nombre del medicamento: ")
        
        cursor = conexion.cursor()
        cursor.callproc('CrearConsultaCompleta', (
            paciente,  
            medico,  
            '2024-07-02 10:00:00',  
            'posible Cancer',  
            'Diagnóstico ejemplo',  
            'Tratamiento ejemplo',  
            medicamento,  
            'Notas',  
            'Examen de sangre',  
            'Resultados normales',  
            '2024-07-01'  
        ))

        conexion.commit()
        for result in cursor.stored_results():
            print(result.fetchall())

        print("Proceso realizado correctamente")
        time.sleep(2)

    
    except mysql.connector.Error as error:
        print("Error al realizar el proceso.", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")