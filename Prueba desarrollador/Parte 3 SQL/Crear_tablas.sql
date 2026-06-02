CREATE TABLE LIBROS (
    libro_id NUMBER PRIMARY KEY,
    titulo VARCHAR2(100),
    autor VARCHAR2(100),
    disponibles NUMBER,
    total_copias NUMBER
);

CREATE TABLE PRESTAMOS (
    prestamo_id NUMBER PRIMARY KEY,
    libro_id NUMBER,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    nombre_usuario VARCHAR2(100),
    estado VARCHAR2(20),
    FOREIGN KEY (libro_id) REFERENCES LIBROS(libro_id)
); 

CREATE SEQUENCE PRESTAMOS_SEQ START WITH 4 INCREMENT BY 1; -- secuencia agregada para optimizar el procedimiento almacenado

INSERT INTO LIBROS VALUES (1, 'Cien años de soledad', 'Gabriel García Márquez', 3, 5);
INSERT INTO LIBROS VALUES (2, 'Don Quijote', 'Miguel de Cervantes', 2, 2);
INSERT INTO LIBROS VALUES (3, '1984', 'George Orwell', 0, 4);

INSERT INTO PRESTAMOS VALUES (1, 1, SYSDATE-10, SYSDATE-5, 'María López', 'DEVUELTO');
INSERT INTO PRESTAMOS VALUES (2, 1, SYSDATE-3, NULL, 'Carlos Ruiz', 'ACTIVO');
INSERT INTO PRESTAMOS VALUES (3, 3, SYSDATE-7, NULL, 'Ana Torres', 'ACTIVO');

SELECT * from libros;



--- Ejecuciones de prueba de la vista y el procedimiento almacenado

SET SERVEROUTPUT ON;

SELECT * from libros;

DECLARE
    v_mensaje VARCHAR2(200);
BEGIN
    SP_PRESTAR_LIBRO(1, 'Juan Pérez', v_mensaje);
    DBMS_OUTPUT.PUT_LINE(v_mensaje);
END;
/

SELECT * from libros;



SELECT * FROM V_REPORTE_LIBROS;