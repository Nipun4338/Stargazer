clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table exoplanet;
create table exoplanet(id number, name varchar2(30), planet_status varchar2(20), discovered number, updated VARCHAR2(30), publication VARCHAR2(30));

drop table structures;
create table structures(id number, mass float, radius float, orbital_period float, eccentricity float, inclination float);

@"C:\Users\Nipun\Desktop\DDS\trigger.sql"

insert into exoplanet values(1,'HAT-P-62 b', 'Confirmed', 2020, '2020-07-15', 'Not Published');
insert into exoplanet values(2,'HATS-32 b', 'Confirmed', 2016, '2016-07-11', 'Not Published');
insert into exoplanet values(3,'HATS-65 b', 'Confirmed', 2018, '2021-03-29', 'Not Published');
insert into exoplanet values(4,'K2-106 c', 'Confirmed', 2016, '2021-12-01', 'Not Published');
insert into exoplanet values(5,'K2-266 d', 'Confirmed', 2018, '2021-02-05', 'Not Published');
insert into exoplanet values(6,'Kepler-40 b', 'Confirmed', 2010, '2021-02-05', 'Not Published');
insert into exoplanet values(7,'TOI-1266 b', 'Confirmed', 2020, '2020-09-10', 'Not Published');
insert into exoplanet values(8,'TOI-1789 b', 'Confirmed', 2021, '2021-06-17', 'Not Published');
insert into exoplanet values(9,'TOI-712 c', 'Confirmed', 2021, '2021-11-05', 'Not Published');
insert into exoplanet values(10,'WASP-177 b', 'Confirmed', 2019, '2019-03-21', 'Not Published');

commit;
select * from exoplanet;


insert into structures values(1, '0.761', '1.073', '2.6453235', '0.1', '87.93');
insert into structures values(2, '0.92', '1.249', '2.8126548', '0.471', '87.1');
insert into structures values(3, '0.821', '1.501', '3.105161', '0.062', '84.82');
insert into structures values(4, '0.018', '0.244', '13.339079', '0.18', '89.35');
insert into structures values(5, '0.028', '0.261', '14.697', '0.047', '89.46');
insert into structures values(6, '2.2', '1.17', '6.87349', '0.0', '89.7');
insert into structures values(7, '0.05', '0.2114', '10.894843', '0.09', '89.5');
insert into structures values(8, '0.7', '1.4', '3.208666', '-1.0', '78.36');
insert into structures values(9, '0.0274', '0.241', '51.69906', '0.089', '89.78');
insert into structures values(10, '0.508', '1.58', '3.071722', '-1.0', '84.14');

commit;
select * from structures;

--CREATE OR REPLACE VIEW all_details as(select * from exoplanet@site1 natural join (select * from temperature@site1 natural join (select * from star@site1 natural join (select * from structures) )));

@"C:\Users\Nipun\Desktop\DDS\search.sql"