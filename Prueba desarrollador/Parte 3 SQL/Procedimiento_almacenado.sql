CREATE OR REPLACE PROCEDURE SP_PRESTAR_LIBRO (
    p_libro_id IN NUMBER,
    p_nombre_usuario IN VARCHAR2,
    p_mensaje OUT VARCHAR2
)
AS
    v_disponibles NUMBER;
    v_existe NUMBER;

BEGIN
    SELECT COUNT(*)
    INTO v_existe
    FROM LIBROS
    WHERE libro_id = p_libro_id;

    IF v_existe = 0 THEN
        p_mensaje := 'El libro no existe';
        RETURN;
    END IF;

    SELECT disponibles
    INTO v_disponibles
    FROM LIBROS
    WHERE libro_id = p_libro_id;

    IF v_disponibles > 0 THEN

        INSERT INTO 
        PRESTAMOS (prestamo_id, libro_id, fecha_prestamo, fecha_devolucion, nombre_usuario, estado)
        VALUES (PRESTAMOS_SEQ.NEXTVAL,p_libro_id,SYSDATE,NULL,p_nombre_usuario,'ACTIVO');

        UPDATE LIBROS SET disponibles = disponibles - 1 
        WHERE libro_id = p_libro_id;

        p_mensaje := 'Préstamo realizado con éxito';

    ELSE
        p_mensaje := 'No hay copias disponibles';
    END IF;

END;
/
