CREATE DATABASE mascotas_bd;
CREATE TABLE mascotas_bd.usuarios(
    id_usuario INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    es_propietario BOOLEAN DEFAULT 1,
    es_veterinario BOOLEAN DEFAULT 0,
    es_administrador BOOLEAN DEFAULT 0,
    email VARCHAR(100) NOT NULL,
    contrasenna VARCHAR(100) NOT NULL
);
INSERT INTO mascotas_bd.usuarios VALUES
(1, 'Ana', 'García', 'Madrid', 'Calle de la Luna 12', '600123456', 1, 0, 0, 'ana.garcia@email.com', 'contraseña123'),
(2, 'Luis', 'Martínez', 'Barcelona', 'Avenida Diagonal 45', '601234567', 0, 1, 0, 'luis.martinez@email.com', 'contrasena456'),
(3, 'Marta', 'Fernández', 'Valencia', 'Plaza del Ayuntamiento 3', '602345678', 1, 0, 0, 'marta.fernandez@email.com', 'contraseña789'),
(4, 'Jorge', 'Sánchez', 'Sevilla', 'Calle de la Tranquilidad 22', '603456789', 0, 0, 1, 'jorge.sanchez@email.com', 'secreta321'),
(5, 'Laura', 'Pérez', 'Bilbao', 'Calle del Norte 5', '604567890', 1, 0, 0, 'laura.perez@email.com', 'clave1234'),
(6, 'Carlos', 'López', 'Granada', 'Calle del Sol 7', '605678901', 0, 1, 0, 'carlos.lopez@email.com', 'clave5678'),
(7, 'Isabel', 'Hernández', 'Toledo', 'Calle del Álamo 9', '606789012', 1, 0, 0, 'isabel.hernandez@email.com', '123456password'),
(8, 'Fernando', 'Jiménez', 'Murcia', 'Calle del Mar 11', '607890123', 0, 0, 1, 'fernando.jimenez@email.com', 'contraseña987'),
(9, 'Beatriz', 'Ruiz', 'Alicante', 'Avenida del Parque 13', '608901234', 1, 0, 0, 'beatriz.ruiz@email.com', 'pass123456'),
(10, 'Pedro', 'Vázquez', 'San Sebastián', 'Calle de la Libertad 17', '609012345', 0, 1, 0, 'pedro.vazquez@email.com', 'password654');

SELECT * FROM mascotas_bd.usuarios;

CREATE TABLE mascotas_bd.propietarios(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    mascotas VARCHAR(100) NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) 
);
INSERT INTO mascotas_bd.propietarios VALUES
(1,"Max",1),
(2,"Whiskers",2),
(3,"Rex",3),
(4,"Bella",4),
(5,"Luna",5);

SELECT 
    u.id_usuario,
    u.nombre AS nombre_usuario,
    u.apellido,
    p.id_usuario AS id_propietario,
    m.codigo AS codigo_mascota,
    m.nombre AS nombre_mascota,
    m.especie,
    m.raza,
    m.edad,
    m.peso
FROM 
    mascotas_bd.usuarios u
INNER JOIN 
    mascotas_bd.propietarios p ON u.id_usuario = p.id_usuario
INNER JOIN 
    mascotas_bd.mascotas m ON p.id_usuario = m.id_propietario;

SELECT * FROM mascotas_bd.propietarios;

CREATE TABLE mascotas_bd.veterinarios(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    horario VARCHAR(100) NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
);

INSERT INTO mascotas_bd.veterinarios VALUES
(1, 'Cardiología', 'Lunes a Viernes 9:00-17:00', 1),
(2, 'Dermatología', 'Lunes a Viernes 10:00-18:00', 2),
(3, 'Cirugía', 'Lunes a Sábado 8:00-16:00', 3),
(4, 'Odontología', 'Martes a Sábado 9:00-14:00', 4),
(5, 'Medicina Interna', 'Lunes a Viernes 11:00-19:00', 5);

SELECT 
    v.id AS id_veterinario,
    v.especialidad,
    v.horario,
    u.id_usuario,
    u.nombre AS nombre_usuario,
    u.apellido,
    u.ciudad,
    u.direccion
FROM 
    mascotas_bd.veterinarios v
INNER JOIN 
    mascotas_bd.usuarios u ON v.id_usuario = u.id_usuario;

SELECT * FROM mascotas_bd.veterinarios;
CREATE TABLE mascotas_bd.mascotas(
    codigo INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    especie VARCHAR(100),
    raza VARCHAR(100),
    edad INT UNSIGNED NOT NULL,
    peso FLOAT UNSIGNED NOT NULL,
    id_propietario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_propietario) REFERENCES propietarios(id_usuario) ON DELETE CASCADE
);

INSERT INTO mascotas_bd.mascotas VALUES
(1, 'Max', 'Perro', 'Labrador', 5, 30.5, 1),
(2, 'Whiskers', 'Gato', 'Siamés', 3, 4.2, 2),
(3, 'Rex', 'Perro', 'Pastor Alemán', 7, 35.0, 3),
(4, 'Bella', 'Perro', 'Bulldog', 4, 25.3, 4),
(5, 'Luna', 'Gato', 'Maine Coon', 2, 6.0, 5);

SELECT 
    p.id_usuario AS id_propietario,
    u.nombre AS nombre_propietario,
    u.apellido,
    m.codigo AS codigo_mascota,
    m.nombre AS nombre_mascota,
    m.especie,
    m.raza,
    m.edad,
    m.peso
FROM 
    mascotas_bd.propietarios p
INNER JOIN 
    mascotas_bd.usuarios u ON p.id_usuario = u.id_usuario
INNER JOIN 
    mascotas_bd.mascotas m ON p.id_usuario = m.id_propietario;

SELECT * FROM mascotas_bd.mascotas;
CREATE TABLE mascotas_bd.administradores(
    id INT UNSIGNED UNIQUE PRIMARY KEY NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO mascotas_bd.administradores VALUES
(1, 'Gerente de Operaciones', '2023-01-15', 1),
(2, 'Coordinador de Recursos Humanos', '2023-03-22', 2),
(3, 'Responsable de Finanzas', '2022-11-05', 3),
(4, 'Jefe de Marketing', '2024-02-10', 4),
(5, 'Administrador de IT', '2023-07-19', 5);

SELECT 
    a.id AS id_administrador,
    a.cargo,
    a.fecha_ingreso,
    u.id_usuario,
    u.nombre AS nombre_usuario,
    u.apellido,
    u.ciudad,
    u.direccion
FROM 
    mascotas_bd.administradores a
INNER JOIN 
    mascotas_bd.usuarios u ON a.id_usuario = u.id_usuario;
