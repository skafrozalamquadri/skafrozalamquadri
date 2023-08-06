-- create new schema--
create schema cars;
 use cars;
-- READ DATA FROM car dekho --
select * from `car dekho`;
-- Total cars: To gat a count of total records --
select count(*) from `car dekho`;
-- The manager asked the employee How many cars will be available in 2023? --
select count(*) from `car dekho` where year = 2023;
-- The manager asked the employee How many cars is available in 2020,2021,2022 --
select count(*) from `car dekho` where year = 2020; #74
select count(*) from `car dekho` where year = 2021; #7
select count(*) from `car dekho` where year = 2022; #7
-- Above question using group by --
select count(*) from `car dekho` where year in(2020,2021,2022) group by year;
-- Clint asked me to print the total of all cars by year. I don't see all details --
select year, count(*) from `car dekho` group by year;
-- Clint asked to car dealer agent How many car was there in 2020 --
select count(*) from `car dekho` where year = 2020 and fuel = 'Diesel' ; #20
-- Clint requested a car dealer agent How many petrol cars was there in 2020 --
select count(*) from `car dekho` where year = 2020 and fuel = 'petrol' ; #51
-- The manager told the employee to give a print of all the fuel cars (petrol, diesel and CNG) come by all year --
select year, count(*) from `car dekho` where fuel = 'Diesel' group by year ;
select year, count(*) from `car dekho` where fuel = 'petrol' group by year ;
select year, count(*) from `car dekho` where fuel = 'CNG' group by year ;
-- Manager said there were more than 100 cars in a given year, which year had more than 100 cars ? --
select year, count(*) from `car dekho` group by year having count(*)>100;
-- Manager said there were less than 50 cars in a given year, which year had more than 50 cars ? --
select year, count(*) from `car dekho` group by year having count(*)<50;
-- Manager said to the employee to count all cars between 2015 and 2023 --
select count(*) from `car dekho` where year between 2015 and 2023;
-- Manager said to the employee ALL car details between 2015 and 2023 we need a complete list  --
select * from `car dekho` where year between 2015 and 2023;


















