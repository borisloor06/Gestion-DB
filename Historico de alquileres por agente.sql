/*
La tercera consulta histórico de alquileres por agente, cada administrativo Robert Moreira cuantas veces ha alquila un carro y cuantos carros ha alquilado en total, por cada vendedor
*/
--------------------------------
--historico de alquileres por agente
--------------------------------
SELECT 
	T1.APELLIDOS_EMPLEADO, T1.NOMBRES_EMPLEADO,  T1.PLACA_VEHICULO, T1.ALQUILER_VEHICULO, T2.ALQUILER_TOTAL
FROM 
(SELECT NOMBRES_EMPLEADO, APELLIDOS_EMPLEADO, COUNT(ALQ.ID_ALQUILER) AS ALQUILER_VEHICULO, PLACA_VEHICULO 
FROM ALQUILER ALQ
INNER JOIN EMPLEADO EMP ON EMP.ID_EMPLEADO = ALQ.ID_EMPLEADO
INNER JOIN VEHICULO VHL ON VHL.ID_VEHICULO = ALQ.ID_VEHICULO
GROUP BY EMP.ID_EMPLEADO, PLACA_VEHICULO) 	T1
FULL OUTER JOIN
(SELECT NOMBRES_EMPLEADO, COUNT(ALQ.ID_ALQUILER) AS ALQUILER_TOTAL 
FROM ALQUILER ALQ
INNER JOIN EMPLEADO EMP ON EMP.ID_EMPLEADO = ALQ.ID_EMPLEADO
GROUP BY EMP.ID_EMPLEADO) 		T2 
ON T1.NOMBRES_EMPLEADO = T2.NOMBRES_EMPLEADO
ORDER BY T1.APELLIDOS_EMPLEADO ASC;