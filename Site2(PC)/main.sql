clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

@"C:\Users\Nipun\Desktop\DDS\insert.sql"

BEGIN 
    DBMS_OUTPUT.PUT_LINE('Welcome to STARGAZER!
	
1 = Search Planet By Id
2 = Update Planet Publication
3 = Show Exoplanets
4 = Show All Data');
END;
/

ACCEPT X NUMBER PROMPT "Choose option = ";
ACCEPT Y Number PROMPT   "Enter Planet Id = ";
ACCEPT Z CHAR PROMPT   "Enter Publication Status = ";
DECLARE
    N number;
	S number;
	D NUMBER;
	Z1 VARCHAR2(30);
	Nipun EXCEPTION;
Begin
	N := &X;
	S := &Y;
	Z1 :='&Z';
	if N=1 THEN
		searchId.show(S);
	elsif N=2 THEN
		D:=searchId.updatePublication(S, Z1);
		if D=-1 then
			DBMS_OUTPUT.PUT_LINE('Planet Not Found!');
		else 
		DBMS_OUTPUT.PUT_LINE('Successfully Updated!');
		end if;
	elsif N=3 THEN
		D:=searchId.showAll(S);
		if D=-1 then
			DBMS_OUTPUT.PUT_LINE('Empty!');
		else 
		DBMS_OUTPUT.PUT_LINE('End of list.');
		end if;
	elsif N=4 THEN
		D:=searchId.showAllData(S);
		if D=-1 then
			DBMS_OUTPUT.PUT_LINE('Empty!');
		else 
		DBMS_OUTPUT.PUT_LINE('End of list.');
		end if;
	else RAISE Nipun;
	end if;


	EXCEPTION 
		When Nipun THEN
		DBMS_OUTPUT.PUT_LINE('Invalid Option');

End;
/