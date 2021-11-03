
/*
Procedimiento almacenado, retorna un valor pero que imprima varios valores
Ingrese el nombre de un agente y me aparezcan todas las fechas en la que ese agente ha alquilado un carro.
*/

------------------------------------
--PROCEDIMIENTO ALMACENADO
------------------------------------

CREATE OR REPLACE FUNCTION FECHAS_ALQUILER (VARCHAR, VARCHAR) RETURNS SETOF DATE
AS
$$ 

SELECT FECHA_INICIO_ALQUILER FROM ALQUILER ALQ
INNER JOIN EMPLEADO EMP ON ALQ.ID_EMPLEADO = EMP.ID_EMPLEADO 
WHERE
EMP.NOMBRES_EMPLEADO = $1 AND
EMP.APELLIDOS_EMPLEADO = $2

$$
LANGUAGE SQL;

SELECT FECHAS_ALQUILER('ROBERT WILFRIDO', 'MOREIRA CENTENO');
/*
Otros Nombres para realizar consultas:
PATRICIA SUSAN CEVALLOS LOPEZ
ANA XIMENA MACIAS CEDEÑO
MARIANO BAYRON RIOS SANTOS
ANIBAL ARMANDO SEVILLA QUINTANA
JOAN FELIPE MERA BRAVO
*/