DELIMITER //

CREATE PROCEDURE MostrarVeterinarios()
BEGIN
     /* Declarar variables para almacenar los datos recuperados */
    DECLARE done INT DEFAULT 0;
    DECLARE vid INT UNSIGNED;
    DECLARE vespecialidad VARCHAR(100);
    DECLARE vhorario VARCHAR(100);
    DECLARE vid_usuario INT UNSIGNED;

     /* Declarar un cursor para recorrer los datos de la tabla 'veterinarios' */
    DECLARE VeterinariosCursor CURSOR FOR 
    SELECT id, especialidad, horario, u_id_usuario FROM mascotas_bd.veterinarios;

     /* Declarar un handler para el fin de datos del cursor */
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

     /* Abrir el cursor */
    OPEN VeterinariosCursor;

     /* Leer filas del cursor */
    leer_cursor: LOOP
        FETCH VeterinariosCursor INTO vid, vespecialidad, vhorario, vid_usuario;
        IF done THEN
            LEAVE leer_cursor;
        END IF;

         /* Procesar los datos (por ejemplo, imprimirlos) */
        SELECT vid AS ID, vespecialidad AS Especialidad, vhorario AS Horario, vid_usuario AS ID_Usuario;
    END LOOP leer_cursor;

     /* Cerrar el cursor */
    CLOSE VeterinariosCursor;
END //
CREATE PROCEDURE mostrar_usuarios()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE u_id_usuario VARCHAR(100);
    DECLARE u_nombre VARCHAR(100);
    DECLARE u_apellido VARCHAR(100);
    DECLARE u_ciudad VARCHAR(100);
    DECLARE u_direccion VARCHAR(100);
    DECLARE u_telefono VARCHAR(100);
    DECLARE u_es_propietario BOOLEAN DEFAULT 1;
    DECLARE u_es_veterinario BOOLEAN DEFAULT 0;
    DECLARE u_es_administrador BOOLEAN DEFAULT 0;
    DECLARE u_email VARCHAR(100);
    DECLARE u_contrasenna VARCHAR(100);

    DECLARE MostrasUsuarios CURSOR 
    FOR SELECT * FROM mascotas_bd.usuarios;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN MostrasUsuarios;

    leer_cursor: LOOP
        FETCH MostrasUsuarios INTO u_id_usuario,u_nombre,u_apellido,u_ciudad,u_direccion,u_telefono,u_es_propietario,u_es_veterinario,u_es_administrador,u_email,u_contrasenna;
        IF done THEN
            LEAVE leer_cursor;
        END IF;
        SELECT u_id_usuario AS id,
                u_nombre AS nombre,
                u_apellido AS apellido,
                u_ciudad AS ciudad,
                u_direccion AS direccion,
                u_telefono AS telefono,
                u_es_propietario AS es_propietario,
                u_es_veterinario AS es_veterinario,
                u_es_administrador AS es_administrador,
                u_email AS email,
                u_contrasenna AS contrasenna;
    END LOOP leer_cursor;

    CLOSE MostrasUsuarios;
END //
DELIMITER ;

CALL mostrar_usuarios();
