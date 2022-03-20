
drop database link site2;

create database link site2
 connect to system identified by "12345"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.0.184)
		 (PORT = 1623))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
