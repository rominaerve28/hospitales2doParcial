DELIMITER $$

CREATE TRIGGER trg_insert_cama AFTER INSERT ON cama 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cama', CURRENT_USER(), 'Insertado registro en cama'); 
END $$

CREATE TRIGGER trg_update_cama AFTER UPDATE ON cama 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cama', CURRENT_USER(), 'Actualizado registro en cama'); 
END $$

CREATE TRIGGER trg_delete_cama AFTER DELETE ON cama 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cama', CURRENT_USER(), 'Eliminado registro en cama'); 
END $$

CREATE TRIGGER trg_insert_cita AFTER INSERT ON cita 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cita', CURRENT_USER(), 'Insertado registro en cita'); 
END $$

CREATE TRIGGER trg_update_cita AFTER UPDATE ON cita 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cita', CURRENT_USER(), 'Actualizado registro en cita'); 
END $$

CREATE TRIGGER trg_delete_cita AFTER DELETE ON cita 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('cita', CURRENT_USER(), 'Eliminado registro en cita'); 
END $$

CREATE TRIGGER trg_insert_compra AFTER INSERT ON compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('compra', CURRENT_USER(), 'Insertado registro en compra'); 
END $$

CREATE TRIGGER trg_update_compra AFTER UPDATE ON compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('compra', CURRENT_USER(), 'Actualizado registro en compra'); 
END $$

CREATE TRIGGER trg_delete_compra AFTER DELETE ON compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('compra', CURRENT_USER(), 'Eliminado registro en compra'); 
END $$

CREATE TRIGGER trg_insert_consulta AFTER INSERT ON consulta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('consulta', CURRENT_USER(), 'Insertado registro en consulta'); 
END $$

CREATE TRIGGER trg_update_consulta AFTER UPDATE ON consulta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('consulta', CURRENT_USER(), 'Actualizado registro en consulta'); 
END $$

CREATE TRIGGER trg_delete_consulta AFTER DELETE ON consulta 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('consulta', CURRENT_USER(), 'Eliminado registro en consulta'); 
END $$

CREATE TRIGGER trg_insert_departamento AFTER INSERT ON departamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('departamento', CURRENT_USER(), 'Insertado registro en departamento'); 
END $$

CREATE TRIGGER trg_update_departamento AFTER UPDATE ON departamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('departamento', CURRENT_USER(), 'Actualizado registro en departamento'); 
END $$

CREATE TRIGGER trg_delete_departamento AFTER DELETE ON departamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('departamento', CURRENT_USER(), 'Eliminado registro en departamento'); 
END $$

CREATE TRIGGER trg_insert_detalle_compra AFTER INSERT ON detalle_compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalle_compra', CURRENT_USER(), 'Insertado registro en detalle_compra'); 
END $$

CREATE TRIGGER trg_update_detalle_compra AFTER UPDATE ON detalle_compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalle_compra', CURRENT_USER(), 'Actualizado registro en detalle_compra'); 
END $$

CREATE TRIGGER trg_delete_detalle_compra AFTER DELETE ON detalle_compra 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('detalle_compra', CURRENT_USER(), 'Eliminado registro en detalle_compra'); 
END $$

CREATE TRIGGER trg_insert_empleado AFTER INSERT ON empleado 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('empleado', CURRENT_USER(), 'Insertado registro en empleado'); 
END $$

CREATE TRIGGER trg_update_empleado AFTER UPDATE ON empleado 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('empleado', CURRENT_USER(), 'Actualizado registro en empleado'); 
END $$

CREATE TRIGGER trg_delete_empleado AFTER DELETE ON empleado 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('empleado', CURRENT_USER(), 'Eliminado registro en empleado'); 
END $$

CREATE TRIGGER trg_insert_especialidad AFTER INSERT ON especialidad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('especialidad', CURRENT_USER(), 'Insertado registro en especialidad'); 
END $$

CREATE TRIGGER trg_update_especialidad AFTER UPDATE ON especialidad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('especialidad', CURRENT_USER(), 'Actualizado registro en especialidad'); 
END $$

CREATE TRIGGER trg_delete_especialidad AFTER DELETE ON especialidad 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('especialidad', CURRENT_USER(), 'Eliminado registro en especialidad'); 
END $$

CREATE TRIGGER trg_insert_examen AFTER INSERT ON examen 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('examen', CURRENT_USER(), 'Insertado registro en examen'); 
END $$

CREATE TRIGGER trg_update_examen AFTER UPDATE ON examen 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('examen', CURRENT_USER(), 'Actualizado registro en examen'); 
END $$

CREATE TRIGGER trg_delete_examen AFTER DELETE ON examen 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('examen', CURRENT_USER(), 'Eliminado registro en examen'); 
END $$

CREATE TRIGGER trg_insert_factura AFTER INSERT ON factura 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('factura', CURRENT_USER(), 'Insertado registro en factura'); 
END $$

CREATE TRIGGER trg_update_factura AFTER UPDATE ON factura 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('factura', CURRENT_USER(), 'Actualizado registro en factura'); 
END $$

CREATE TRIGGER trg_delete_factura AFTER DELETE ON factura 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('factura', CURRENT_USER(), 'Eliminado registro en factura'); 
END $$

CREATE TRIGGER trg_insert_hospital AFTER INSERT ON hospital 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('hospital', CURRENT_USER(), 'Insertado registro en hospital'); 
END $$

CREATE TRIGGER trg_update_hospital AFTER UPDATE ON hospital 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('hospital', CURRENT_USER(), 'Actualizado registro en hospital'); 
END $$

CREATE TRIGGER trg_delete_hospital AFTER DELETE ON hospital 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('hospital', CURRENT_USER(), 'Eliminado registro en hospital'); 
END $$

CREATE TRIGGER trg_insert_ingreso AFTER INSERT ON ingreso 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ingreso', CURRENT_USER(), 'Insertado registro en ingreso'); 
END $$

CREATE TRIGGER trg_update_ingreso AFTER UPDATE ON ingreso 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ingreso', CURRENT_USER(), 'Actualizado registro en ingreso'); 
END $$

CREATE TRIGGER trg_delete_ingreso AFTER DELETE ON ingreso 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('ingreso', CURRENT_USER(), 'Eliminado registro en ingreso'); 
END $$

CREATE TRIGGER trg_insert_inventario_medicamento AFTER INSERT ON inventario_medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('inventario_medicamento', CURRENT_USER(), 'Insertado registro en inventario_medicamento'); 
END $$

CREATE TRIGGER trg_update_inventario_medicamento AFTER UPDATE ON inventario_medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('inventario_medicamento', CURRENT_USER(), 'Actualizado registro en inventario_medicamento'); 
END $$

CREATE TRIGGER trg_delete_inventario_medicamento AFTER DELETE ON inventario_medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('inventario_medicamento', CURRENT_USER(), 'Eliminado registro en inventario_medicamento'); 
END $$

CREATE TRIGGER trg_insert_medicamento AFTER INSERT ON medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medicamento', CURRENT_USER(), 'Insertado registro en medicamento'); 
END $$

CREATE TRIGGER trg_update_medicamento AFTER UPDATE ON medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medicamento', CURRENT_USER(), 'Actualizado registro en medicamento'); 
END $$

CREATE TRIGGER trg_delete_medicamento AFTER DELETE ON medicamento 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medicamento', CURRENT_USER(), 'Eliminado registro en medicamento'); 
END $$

CREATE TRIGGER trg_insert_medico AFTER INSERT ON medico 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medico', CURRENT_USER(), 'Insertado registro en medico'); 
END $$

CREATE TRIGGER trg_update_medico AFTER UPDATE ON medico 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medico', CURRENT_USER(), 'Actualizado registro en medico'); 
END $$

CREATE TRIGGER trg_delete_medico AFTER DELETE ON medico 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('medico', CURRENT_USER(), 'Eliminado registro en medico'); 
END $$

CREATE TRIGGER trg_insert_paciente AFTER INSERT ON paciente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente', CURRENT_USER(), 'Insertado registro en paciente'); 
END $$

CREATE TRIGGER trg_update_paciente AFTER UPDATE ON paciente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente', CURRENT_USER(), 'Actualizado registro en paciente'); 
END $$

CREATE TRIGGER trg_delete_paciente AFTER DELETE ON paciente 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente', CURRENT_USER(), 'Eliminado registro en paciente'); 
END $$

CREATE TRIGGER trg_insert_paciente_seguro AFTER INSERT ON paciente_seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente_seguro', CURRENT_USER(), 'Insertado registro en paciente_seguro'); 
END $$

CREATE TRIGGER trg_update_paciente_seguro AFTER UPDATE ON paciente_seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente_seguro', CURRENT_USER(), 'Actualizado registro en paciente_seguro'); 
END $$

CREATE TRIGGER trg_delete_paciente_seguro AFTER DELETE ON paciente_seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('paciente_seguro', CURRENT_USER(), 'Eliminado registro en paciente_seguro'); 
END $$

CREATE TRIGGER trg_insert_proveedor AFTER INSERT ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Insertado registro en proveedor'); 
END $$

CREATE TRIGGER trg_update_proveedor AFTER UPDATE ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Actualizado registro en proveedor'); 
END $$

CREATE TRIGGER trg_delete_proveedor AFTER DELETE ON proveedor 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('proveedor', CURRENT_USER(), 'Eliminado registro en proveedor'); 
END $$

CREATE TRIGGER trg_insert_seguro AFTER INSERT ON seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('seguro', CURRENT_USER(), 'Insertado registro en seguro'); 
END $$

CREATE TRIGGER trg_update_seguro AFTER UPDATE ON seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('seguro', CURRENT_USER(), 'Actualizado registro en seguro'); 
END $$

CREATE TRIGGER trg_delete_seguro AFTER DELETE ON seguro 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('seguro', CURRENT_USER(), 'Eliminado registro en seguro'); 
END $$

CREATE TRIGGER trg_insert_usuario AFTER INSERT ON usuario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('usuario', CURRENT_USER(), 'Insertado registro en usuario'); 
END $$

CREATE TRIGGER trg_update_usuario AFTER UPDATE ON usuario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('usuario', CURRENT_USER(), 'Actualizado registro en usuario'); 
END $$

CREATE TRIGGER trg_delete_usuario AFTER DELETE ON usuario 
FOR EACH ROW 
BEGIN 
    INSERT INTO auditoria (Nombre_de_la_tabla, Usuario_actual, Detalle_de_la_accion) 
    VALUES ('usuario', CURRENT_USER(), 'Eliminado registro en usuario'); 
END $$

DELIMITER ;
