/*
Trigger cuando una persona vaya a alquiler por tercera vez un carro que le impida alquilar por tercera vez siempre y cuando haya tenido dos atrasos previos
*/
----------------------------
-- trigger 3 alquileres
----------------------------

--creación de funcion del proceso logico que retorna un trigger
CREATE OR REPLACE FUNCTION TG_IMPIDEALQUILAR() RETURNS TRIGGER
AS
$TG_IMPIDEALQUILAR$
	DECLARE
		NUMFALLAS INT;
		MAXIMO INT := 2;
	BEGIN
		SELECT COUNT(*) INTO NUMFALLAS 
		FROM ALQUILER 
		WHERE ALQUILER_TERMINADO = TRUE AND PENALIZACION_VALOR > CAST(0 AS MONEY);
		IF(NUMFALLAS >= MAXIMO) THEN
			RAISE EXCEPTION 'HA TENIDO DOS ATRASOS EN ALQUILERES ANTERIORES, POR EL MOMENTO NO PUEDE ALQUILAR NINGÚN VEHICULO';
		END IF;
		RETURN NEW;
	END;
	$TG_IMPIDEALQUILAR$
	LANGUAGE PLPGSQL;
	
--creación del trigger
CREATE TRIGGER TG_IMPIDEALQUILAR
BEFORE
INSERT ON ALQUILER
FOR EACH ROW
EXECUTE PROCEDURE TG_IMPIDEALQUILAR();

--dato de pruba para verificar la validez del trigger
INSERT INTO ALQUILER VALUES(DEFAULT, 2, 3, 19, 1, 2, 25, FALSE, '2021-08-17', '2021-08-19', 0, '', 0);