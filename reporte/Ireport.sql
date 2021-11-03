
--Ireport, un gráfico de barras con la cantidad de dinero que ha representado cada carro.
-------------------------------------
---iREPORT
------------------------------------
SELECT PLACA_VEHICULO, CAST(SUM(TOTAL_ALQUILER) AS NUMERIC) AS DINERO_GENERADO, count(alq.id_alquiler) as Veces_alquilado FROM ALQUILER ALQ
INNER JOIN VEHICULO VHL ON ALQ.ID_VEHICULO = VHL.ID_VEHICULO
GROUP BY VHL.ID_VEHICULO;
