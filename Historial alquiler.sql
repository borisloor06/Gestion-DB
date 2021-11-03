/*
Mostrar el histórico de alquileres de vehículos, debe aparecer la placa del vehículo, cuantos clientes lo han alquilado unos 20 clientes, cuánto dinero ha generado ese vehículo
*/
---------------------------------
--historial alquiler
---------------------------------
SELECT PLACA_VEHICULO, COUNT(CLI.ID_CLIENTE) AS NUMERO_ALQUILADAS, SUM(TOTAL_ALQUILER) AS DINERO_GENERADO FROM ALQUILER ALQ 
INNER JOIN VEHICULO VHL ON ALQ.ID_VEHICULO = VHL.ID_VEHICULO
INNER JOIN CLIENTE CLI ON CLI.ID_CLIENTE = ALQ.ID_CLIENTE
GROUP BY VHL.ID_VEHICULO;