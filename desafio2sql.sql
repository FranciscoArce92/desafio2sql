/****** Desafío 2 - Consultas agrupadas  ******/


/* 1- Se crea una tabla con los siguientes datos:  */
CREATE TABLE INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);

/* 2- Se insertan los siguientes datos:  */
INSERT INTO INSCRITOS (cantidad, fecha, fuente)
VALUES ( 44, '2021-01-01', 'Blog' ),
       ( 56, '2021-01-01', 'Página' ),
       ( 39, '2021-01-02', 'Blog' ),
       ( 81, '2021-01-02', 'Página' ),
       ( 12, '2021-01-03', 'Blog' ),
       ( 91, '2021-01-03', 'Página' ),
       ( 48, '2021-01-04', 'Blog' ),
       ( 45, '2021-01-04', 'Página' ),
       ( 55, '2021-01-05', 'Blog' ),
       ( 33, '2021-01-05', 'Página' ),
       ( 18, '2021-01-06', 'Blog' ),
       ( 12, '2021-01-06', 'Página' ),
       ( 34, '2021-01-07', 'Blog' ),
       ( 24, '2021-01-07', 'Página' ),
       ( 83, '2021-01-08', 'Blog' ),
       ( 99, '2021-01-08', 'Página' );

/******* REQUERIMIENTOS *********/

/* 1- Cuántos registros hay? */
SELECT COUNT(*) AS total_registros FROM INSCRITOS;

/* 2 - Cuántos inscritos hay en total? */
SELECT SUM(cantidad) AS total_inscritos FROM INSCRITOS;

/* 3- Cuál o cuáles son los registros de mayor antigüedad? */
SELECT * FROM INSCRITOS WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

/* 4- Cuántos inscritos hay por día? (Indistintamente de la fuente de inscripción) */
SELECT fecha, SUM(cantidad) AS total_inscritos
    FROM INSCRITOS
    GROUP BY fecha
    ORDER BY fecha;

/* 5- Cuántos inscritos hay por fuente? */
SELECT fuente, SUM(cantidad) AS total_inscritos
    FROM INSCRITOS
    GROUP BY fuente
    ORDER BY total_inscritos DESC;

/*  6- Qué día se inscribió la mayor cantidad de personas? */
SELECT fecha FROM INSCRITOS
    GROUP BY fecha
    ORDER BY SUM(cantidad) DESC
    LIMIT 1;
 
/* Cuántas personas se inscribiron ese día? */
 SELECT fecha, SUM(cantidad) AS total_inscritos
    FROM INSCRITOS
    GROUP BY fecha
    ORDER BY total_inscritos DESC
    LIMIT 1;

/* 7- Qué día se inscribieron la mayor cantidad de personas utilizando el blog */
SELECT fecha FROM INSCRITOS
    WHERE fuente = 'Blog'
    GROUP BY fecha
    ORDER BY SUM(cantidad) DESC
    LIMIT 1;

/* Cuántas personas fueron?  */
SELECT fecha, SUM(cantidad) AS total_inscritos
    FROM INSCRITOS
    WHERE fuente = 'Blog'
    GROUP BY fecha
    ORDER BY SUM(cantidad) DESC
    LIMIT 1;

/* 8- Cuál es el promedio de personas inscritas por día? */
SELECT fecha, ROUND(AVG(cantidad), 5) AS inscritos_por_dia
    FROM INSCRITOS
    GROUP BY fecha
    ORDER BY fecha;

/* 9- Qué días se inscribieron más de 50 personas? */
SELECT fecha, SUM(cantidad) AS total_inscritos
    FROM INSCRITOS
    GROUP BY fecha
    HAVING SUM(cantidad) > 50
    ORDER BY total_inscritos ASC;

/* 10- Cuál es el promedio por día de personas inscritas? */
SELECT fecha, ROUND(AVG(cantidad), 5) AS promedio_inscritos
    FROM INSCRITOS
    WHERE fecha >= '2021-01-03'
    GROUP BY fecha
    ORDER BY fecha;
