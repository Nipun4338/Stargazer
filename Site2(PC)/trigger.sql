SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER trig 
AFTER INSERT 
ON structures
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Exoplanet structure added!');
END;
/
