clear screen;
SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table exoplanet;
create table exoplanet(id number, name varchar2(30), planet_status varchar2(20), discovered number, updated VARCHAR2(30), publication VARCHAR2(30));

drop table temperature;
create table temperature(id number, temp_calculated FLOAT, temp_measured FLOAT);

drop table star;
create table star(id number, star_name varchar2(30), star_distance float, star_metallicity FLOAT, star_mass float, star_radius float, star_age float);

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
--select * from exoplanet;

insert into temperature values(1, 1512.0, -1.0);
insert into temperature values(2, 1437.0, -1.0);
insert into temperature values(3, 1634.0, -1.0);
insert into temperature values(4, 741.0, -1.0);
insert into temperature values(5, 538.0, -1.0);
insert into temperature values(6, 1620.0, -1.0);
insert into temperature values(7, 413.0, -1.0);
insert into temperature values(8, 1929.0, -1.0);
insert into temperature values(9, 370.0, -1.0);
insert into temperature values(10, 1142.0, -1.0);

commit;
--select * from temperature;

insert into star values(1, 'HAT-P-62', '353.1', '0.414', '1.023', '1.17', '8.1');
insert into star values(2, 'HATS-32', '839.0', '0.39', '1.099', '1.097', '3.5');
insert into star values(3, 'HATS-65', '491.0', '0.233', '1.269', '1.296', '1.42');
insert into star values(4, 'EPIC 220674823', '246.1', '0.13', '0.97', '0.98', '5.0');
insert into star values(5, 'K2-266', '77.16', '-0.12', '0.69', '0.7', '8.4');
insert into star values(6, 'Kepler-40', '2700.0', '0.1', '1.48', '2.13', '2.8');
insert into star values(7, 'TOI-1266', '36.05', '-0.05', '0.45', '0.42', '7.9');
insert into star values(8, 'TOI-1789', '223.55', '0.37', '1.499', '2.172', '2.81');
insert into star values(9, 'TOI-712', '58.62', '-0.02', '0.732', '0.674', '0.83');
insert into star values(10, 'WASP-177', '178.0', '0.25', '0.876', '0.885', '9.7');

commit;
--select * from star;
