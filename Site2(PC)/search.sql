SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE searchId AS
	PROCEDURE show(S IN number);
	Function updatePublication(S IN number, z1 IN VARCHAR2)
	RETURN NUMBER;
	Function showAll(S IN number)
	RETURN NUMBER;
	Function showAllData(S IN number)
	RETURN NUMBER;

END searchId;
/

CREATE OR REPLACE PACKAGE BODY searchId AS
	PROCEDURE show(S IN number)
	IS
	A Number;
	B1 VARCHAR2(30);
	B VARCHAR2(30);
	C Number;
	D VARCHAR2(30);
	E VARCHAR2(30);
	f Number;
	cnt number;
	BEGIN
        f := 1;
        cnt:= 0;
		FOR R IN (select id, name, planet_status, discovered, updated, publication from exoplanet@site1 order by id desc) LOOP
			A := R.id;
			B1 := R.name;
			B := R.planet_status;
			C := R.discovered;
			D := R.updated;
			E := R.publication;
			
			if A = S Then	
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
				cnt := cnt+1;
				DBMS_OUTPUT.PUT_LINE('ID'||' | '||'Name'||' | '||'Planet Status'||' | '||'Discovered'||' | '||'Updated'||' | '||'Publication');		
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');				
				DBMS_OUTPUT.PUT_LINE(A||' | '||B1||' | '||B||' | '||C||' | '||D||' | '||E);
				DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
				f := 0;
			END if;		
        END Loop;
		if f = 1 then
			DBMS_OUTPUT.PUT_LINE('N/A');
		end if;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	END show;
	
	
	
	Function updatePublication(S IN number, z1 IN VARCHAR2)
	RETURN NUMBER
	IS 
	A Number;
	B1 VARCHAR2(30);
	B VARCHAR2(30);
	C Number;
	D VARCHAR2(30);
	E VARCHAR2(30);
	f Number;
	cnt number;
	BEGIN
        f := -1;
        cnt:= 0;
		FOR R IN (select id, name, planet_status, discovered, updated, publication from exoplanet) LOOP
			A := R.id;
			B1 := R.name;
			B := R.planet_status;
			C := R.discovered;
			D := R.updated;
			E := R.publication;
			if A = S Then	
				delete from exoplanet where id=A;
				COMMIT;
				Insert into exoplanet(id, name, planet_status, discovered, updated, publication) values(A, B1, B, C, D, z1);
				COMMIT;
				FOR R IN (select id, name, planet_status, discovered, updated, publication from exoplanet) LOOP
					A := R.id;
					B1 := R.name;
					B := R.planet_status;
					C := R.discovered;
					D := R.updated;
					E := R.publication;
					if A = S Then
					DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
					cnt := cnt+1;
					DBMS_OUTPUT.PUT_LINE('ID'||' | '||'Name'||' | '||'Planet Status'||' | '||'Discovered'||' | '||'Updated'||' | '||'Publication');		
					DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');				
					DBMS_OUTPUT.PUT_LINE(A||' | '||B1||' | '||B||' | '||C||' | '||D||' | '||E);
					DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
					f := 0;
					END if;	
				END Loop;
			END if;		
        END Loop;
		RETURN f;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	End updatePublication;
	
	
	
	
	Function showAll(S IN number)
	RETURN NUMBER
	IS 
	A Number;
	B1 VARCHAR2(30);
	B VARCHAR2(30);
	C Number;
	D VARCHAR2(30);
	E VARCHAR2(30);
	f Number;
	cnt number;
	BEGIN
        f := -1;
        cnt:= 0;
		DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
		DBMS_OUTPUT.PUT_LINE('ID'||' | '||'Name'||' | '||'Planet Status'||' | '||'Discovered'||' | '||'Updated'||' | '||'Publication');		
		DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');				
		FOR R IN (select id, name, planet_status, discovered, updated, publication from exoplanet order by id) LOOP
			A := R.id;
			B1 := R.name;
			B := R.planet_status;
			C := R.discovered;
			D := R.updated;
			E := R.publication;
			cnt := cnt+1;	
				DBMS_OUTPUT.PUT_LINE(A||' | '||B1||' | '||B||' | '||C||' | '||D||' | '||E);
			DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------');
			f := 0;	
        END Loop;
		RETURN f;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	End showAll;
	
	
	
	
	
	
	Function showAllData(S IN number)
	RETURN NUMBER
	IS 
	A Number;
	B1 VARCHAR2(30);
	B VARCHAR2(30);
	C Number;
	D VARCHAR2(30);
	E VARCHAR2(30);
	t1 FLOAT;
	t2 FLOAT;
	s1 VARCHAR2(30);
	s2 FLOAT;
	s3 FLOAT;
	s4 FLOAT;
	s5 FLOAT;
	s6 FLOAT;
	st1 FLOAT;
	st2 FLOAT;
	st3 FLOAT;
	st4 FLOAT;
	st5 FLOAT;
	f Number;
	cnt number;
	BEGIN
        f := -1;
        cnt:= 0;
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------');
		DBMS_OUTPUT.PUT_LINE('ID'||' | '||'Name'||' | '||'Planet Status'||' | '||'Discovered'||' | '||'Updated'||' | '||'Publication'||' | '||'Temp Calculated'||' | '||'Temp Measured'||' | '||'Star Name'||' | '||'Star Distance'||' | '||'Star Metallicity'||' | '||'Star Mass'||' | '||'Star Radius'||' | '||'Star Age'||' | '||'Mass'||' | '||'Radius'||' | '||'Orbital Period'||' | '||'Eccentricity'||' | '||'Inclination');		
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------');
		FOR R IN (select id, name, planet_status, discovered, updated, publication, temp_calculated, temp_measured, star_name, star_distance, star_metallicity, star_mass, star_radius, star_age, mass, radius, orbital_period, eccentricity, inclination from exoplanet natural join temperature@site1 natural join star@site1 natural join structures order by id) LOOP
			A := R.id;
			B1 := R.name;
			B := R.planet_status;
			C := R.discovered;
			D := R.updated;
			E := R.publication;
			t1 := R.temp_calculated;
			t2 := R.temp_measured;
			s1 :=R.star_name;
			s2 :=R.star_distance;
			s3 :=R.star_metallicity;
			s4 :=R.star_mass;
			s5 :=R.star_radius;
			s6 :=R.star_age;
			st1 :=R.mass;
			st2 :=R.radius;
			st3 :=R.orbital_period;
			st4 :=R.eccentricity;
			st5 :=R.inclination;
			cnt := cnt+1;	
				DBMS_OUTPUT.PUT_LINE(A||' | '||B1||' | '||B||' | '||C||' | '||D||' | '||E||' | '||t1||' | '||t2||' | '||s1||' | '||s2||' | '||s3||' | '||s4||' | '||s5||' | '||s6||' | '||st1||' | '||st2||' | '||st3||' | '||st4||' | '||st5);
		DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------');
			f := 0;	
        END Loop;
		RETURN f;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('DATA NOT FOUND');
	
	End showAllData;
END searchId;
/