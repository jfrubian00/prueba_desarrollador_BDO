CREATE OR REPLACE VIEW V_REPORTE_LIBROS AS
SELECT
    libro_id,
    titulo,
    autor,
    total_copias,
    disponibles AS copias_disponibles_actualmente
FROM LIBROS;


SELECT * FROM V_REPORTE_LIBROS;