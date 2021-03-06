/*
Cursor de base de datos que muestre el histórico por cada carro, el nombre del carro, la cantidad de gente que ha alquilado el carro, la cantidad de veces que ha ido a mantenimiento, la cantidad de plata que me ha representado como ingreso. 
*/
-----------------------------------
-- CURSOR HISTORICO POR CADA CARRO
-----------------------------------
DO $$
DECLARE
	DATOS RECORD;
	MANTENIMIENTO INT;
	ALQUILER INT;
	DINERO MONEY;
	MODELO VARCHAR(30);
	MARCA VARCHAR (30);
	
	--Creación del cursor explicito
	C_CARROS CURSOR FOR SELECT * FROM VEHICULO;
	
BEGIN
	FOR CAR IN C_CARROS 
		LOOP
			--Asignacion de datos
			SELECT NOMBRE_MODELO INTO MODELO FROM VEHICULO INNER JOIN MODELO_VEHICULO MODEL ON MODEL.ID_MODELO = CAR.ID_MODELO 
				WHERE VEHICULO.ID_VEHICULO = CAR.ID_VEHICULO; 
			SELECT NOMBRE_MARCA INTO MARCA FROM VEHICULO INNER JOIN MARCA_VEHICULO MARC ON MARC.ID_MARCA = CAR.ID_MARCA
				WHERE VEHICULO.ID_VEHICULO = CAR.ID_VEHICULO;  
			SELECT COUNT(ALQ.ID_ALQUILER) INTO ALQUILER FROM VEHICULO INNER JOIN ALQUILER ALQ ON ALQ.ID_VEHICULO = CAR.ID_VEHICULO
				WHERE VEHICULO.ID_VEHICULO = CAR.ID_VEHICULO;  
			SELECT COUNT(MANT.ID_MANTENIMIENTO) INTO MANTENIMIENTO FROM VEHICULO INNER JOIN MANTENIMIENTO MANT ON MANT.ID_VEHICULO = CAR.ID_VEHICULO
				WHERE VEHICULO.ID_VEHICULO = CAR.ID_VEHICULO; 
			SELECT SUM(TOTAL_ALQUILER) INTO DINERO FROM VEHICULO INNER JOIN ALQUILER ALQ ON ALQ.ID_VEHICULO = CAR.ID_VEHICULO
				WHERE VEHICULO.ID_VEHICULO = CAR.ID_VEHICULO; 
			
			--Mostrar mensaje
			RAISE NOTICE '
			VEHICULO: % 		MODELO: % 			MARCA: % 		PLACA: % 		
			ALQUILADO: % 		NUMERO DE MANTENIMIENTOS: % 		DINERO GENERADO: % 
			',
			CAR.ID_VEHICULO, MODELO, MARCA, CAR.PLACA_VEHICULO, ALQUILER, MANTENIMIENTO, DINERO;
		END LOOP;
END; 
$$ LANGUAGE 'plpgsql';
