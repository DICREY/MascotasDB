START TRANSACTION;
INSERT INTO mascotas_bd.propietarios VALUES(12,"Diablo",1);
INSERT INTO mascotas_bd.propietarios VALUES(6,"Diablo",2);
INSERT INTO mascotas_bd.propietarios VALUES(7,"Diablo",3);

COMMIT;
ROLLBACK;

SELECT * FROM propietarios;