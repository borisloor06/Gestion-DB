/*
El histórico de mantenimientos que ha tenido cada vehículo, la placa del vehículo, el número de veces que ha sido llevado al mantenimiento, el dinero que se ha gastado en el mantenimiento del vehículo.
*/
-------------------------------
--historial mantenimientos
--------------------------------
SELECT PLACA_VEHICULO, COUNT(ID_MANTENIMIENTO) AS CANTIDAD_MANTENIMIENTO, SUM(COSTO_MANTENIMIENTO) AS COSTO_MANTENIMIENTO FROM MANTENIMIENTO MTN
INNER JOIN VEHICULO VHL ON VHL.ID_VEHICULO = MTN.ID_VEHICULO
GROUP BY VHL.ID_VEHICULO;