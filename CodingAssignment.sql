-- CREATE--DATABASE -- 
Create Database if not exists `TravelOnTheGo` ;

-- USE--DATABASE -- 
use `TravelOnTheGo`;

-- CREATE--TABLE--PASSENGER --
create table if not exists `PASSENGER`(
`Passenger_name` varchar(50),
 `Category` varchar(7),
 `Gender` varchar(1),
 `Boarding_City` varchar(15),
 `Destination_City` varchar(15),
 `Distance` int,
 `Bus_Type` varchar(10)
);

-- CREATE--TABLE--PRICE --
create table if not exists `PRICE`(
`Bus_Type` varchar(10),
 `Distance` int,
 `Price` int

);

-- INSERT--DATA--FOR--PASSENGER--TABLE --
insert into `PASSENGER` values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into `PASSENGER` values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into `PASSENGER` values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into `PASSENGER` values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into `PASSENGER` values('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into `PASSENGER` values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into `PASSENGER` values('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into `PASSENGER` values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into `PASSENGER` values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');


-- INSERT--DATA--FOR--PRICE--TABLE --
insert into `PRICE` values('Sleeper',350,770);
insert into `PRICE` values('Sleeper',500,1100);
insert into `PRICE` values('Sleeper',600,1320);
insert into `PRICE` values('Sleeper',700,1540);
insert into `PRICE` values('Sleeper',1000,2200);
insert into `PRICE` values('Sleeper',1200,2640);
insert into `PRICE` values('Sleeper',350,434);
insert into `PRICE` values('Sitting',500,620);
insert into `PRICE` values('Sitting',500,620);
insert into `PRICE` values('Sitting',600,744);
insert into `PRICE` values('Sitting',700,868);
insert into `PRICE` values('Sitting',1000,1240);
insert into `PRICE` values('Sitting',1200,1488);
insert into `PRICE` values('Sitting',1500,1860);


-- START--SELECT--QUERIES --
SELECT `Gender`,Count(`Gender`) FROM `PASSENGER` WHERE `Distance`> 600 GROUP BY `Gender`;

SELECT max(`Price`) FROM `PRICE` WHERE `Bus_Type`='Sleeper';

SELECT * FROM `PASSENGER` WHERE `Passenger_name` LIKE 'S%';

SELECT `Passenger_name`,`Boarding_City`,`Destination_City`,`PASSENGER`.`Bus_Type`,`PRICE`.`Price` FROM `PASSENGER` INNER JOIN `PRICE` ON `PASSENGER`.`Distance`=`PRICE`.`Distance`;

SELECT `PASSENGER`.`Passenger_name` FROM `PASSENGER` INNER JOIN `PRICE` ON `PASSENGER`.`Distance`=`PRICE`.`Distance` WHERE `PASSENGER`.`Distance`=1000 AND `PRICE`.`Bus_Type`='Sleeper';

SELECT `PASSENGER`.`Passenger_name`,`PRICE`.`Price`,`Price`.`Bus_Type` FROM `PASSENGER` INNER JOIN `PRICE` ON `PASSENGER`.`Distance`=`PRICE`.`Distance` WHERE `PASSENGER`.`Passenger_name`='Pallavi';

SELECT distinct(`Distance`) FROM `PASSENGER` ORDER BY `Distance` DESC;

SELECT `Passenger_name`,`Distance`*100/SUM(`Distance`) over() FROM `PASSENGER`;

SELECT `Distance`,`Price`,   
       CASE 
          WHEN `Price`>1000 THEN 'Expensive'
          WHEN `Price`<1000 AND `Price`>500 THEN 'Average Cost'
          WHEN `Price`<500 THEN 'Cheap'
       END AS category   
FROM `Price`;
