DELIMITER //
CREATE PROCEDURE mascotas_bd.InsertarMascota(
    IN p_codigo INT UNSIGNED,
    IN p_nombre VARCHAR(100),
    IN p_especie VARCHAR(100),
    IN p_raza VARCHAR(100),
    IN p_edad INT UNSIGNED, 
    IN p_peso FLOAT,
    IN p_id_propietario INT UNSIGNED
)
    BEGIN
        INSERT INTO mascotas_bd.mascotas VALUES
        (p_codigo,p_nombre,p_especie,p_raza,p_edad,p_peso,p_id_propietario);
    END //

/* CALL InsertarMascota(); */
CREATE PROCEDURE mascotas_bd.InsertarUsuario(
    IN p_id_usuario INT UNSIGNED,
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_ciudad VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_telefono VARCHAR(100),
    IN p_es_propietario BOOLEAN,
    IN p_es_veterinario BOOLEAN,
    IN p_es_administrador BOOLEAN,
    IN p_email VARCHAR(100),
    IN p_contrasenna VARCHAR(100)
)
BEGIN
    INSERT INTO mascotas_bd.usuarios VALUES (
        p_id_usuario, p_nombre, p_apellido, p_ciudad, p_direccion, p_telefono,
        p_es_propietario, p_es_veterinario, p_es_administrador, p_email, p_contrasenna
    );
END //

/* CALL InsertarUsuario(); */
CREATE PROCEDURE mascotas_bd.InsertarPropietario(
    IN p_id INT,
    IN p_mascotas VARCHAR(100),
    IN p_id_usuario INT UNSIGNED
)
BEGIN
    INSERT INTO mascotas_bd.propietarios VALUES(p_id,p_mascotas,p_id_usuario);
END //

CREATE PROCEDURE mascotas_bd.InsertarAdministrador(
    IN p_id INT UNSIGNED,
    IN p_cargo VARCHAR(100),
    IN p_fecha_ingreso DATE,
    IN p_id_usuario INT UNSIGNED
)
BEGIN
    INSERT INTO mascotas_bd.administradores VALUES(p_id,p_cargo,p_fecha_ingreso,p_id_usuario);
END //

/* CALL InsertarPropietario(); */

CREATE PROCEDURE mascotas_bd.EliminarUsuario(
    IN p_id_usuario INT UNSIGNED
)
BEGIN
    DELETE FROM mascotas_bd.usuarios
    WHERE id_usuario = p_id_usuario;
END //

CREATE PROCEDURE mascotas_bd.EliminarPropietario(
    IN p_id INT UNSIGNED
)
BEGIN
    DELETE FROM mascotas_bd.propietarios WHERE id = p_id;
END //

CREATE PROCEDURE mascotas_bd.EliminarMascota(
    IN p_codigo INT UNSIGNED
) 
BEGIN
    DELETE FROM mascotas_bd.mascotas WHERE codigo = p_codigo;
END //
/* CALL EliminarPropietario(2) */
DELIMITER ;
SHOW PROCEDURE STATUS WHERE Db = "mascotas_bd";
DROP PROCEDURE InsertarMascota;
DROP PROCEDURE InsertarUsuario;
DROP PROCEDURE EliminarUsuario;
DROP PROCEDURE InsertarPropietario;
DROP PROCEDURE InsertarAdministrador;
DROP PROCEDURE EliminarPropietario;
DROP PROCEDURE EliminarMascota;
DROP PROCEDURE ActualizarPropietario;