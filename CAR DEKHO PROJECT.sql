-- Create a new schema and use it --
-- CREATE SCHEMA cars; --
USE cars;

-- Read all data from 'car dekho' table --
SELECT * FROM `car dekho`;

-- Total cars: Count all records --
SELECT COUNT(*) AS total_cars FROM `car dekho`;

-- Count cars available in 2023 --
SELECT COUNT(*) AS cars_in_2023 FROM `car dekho` WHERE year = 2023;

-- Count cars available in 2020, 2021, 2022 using GROUP BY --
SELECT year, COUNT(*) AS total_cars 
FROM `car dekho` 
WHERE year IN (2020, 2021, 2022) 
GROUP BY year;

-- Count cars by fuel type and year --
SELECT year, fuel, COUNT(*) AS total_cars 
FROM `car dekho` 
GROUP BY year, fuel 
ORDER BY year, fuel;

-- Years with more than 100 cars --
SELECT year, COUNT(*) AS total_cars 
FROM `car dekho` 
GROUP BY year 
HAVING COUNT(*) > 100;

-- Years with less than 50 cars --
SELECT year, COUNT(*) AS total_cars 
FROM `car dekho` 
GROUP BY year 
HAVING COUNT(*) < 50;

-- Count all cars between 2015 and 2023 --
SELECT COUNT(*) AS total_cars 
FROM `car dekho` 
WHERE year BETWEEN 2015 AND 2023;

-- List all cars between 2015 and 2023 --
SELECT * 
FROM `car dekho` 
WHERE year BETWEEN 2015 AND 2023;

-- Total cars by year and fuel type (optimized for multiple conditions) --
SELECT year, 
       SUM(CASE WHEN fuel = 'Diesel' THEN 1 ELSE 0 END) AS diesel_cars,
       SUM(CASE WHEN fuel = 'Petrol' THEN 1 ELSE 0 END) AS petrol_cars,
       SUM(CASE WHEN fuel = 'CNG' THEN 1 ELSE 0 END) AS cng_cars
FROM `car dekho`
GROUP BY year;

-- Average, minimum, and maximum selling_price of cars by year --
SELECT year, 
       AVG(selling_price) AS avg_selling_price, 
       MIN(selling_price) AS min_selling_price, 
       MAX(selling_price) AS max_selling_price 
FROM `car dekho`
GROUP BY year;

-- Most popular fuel type by year --
SELECT year, fuel, COUNT(*) AS total_cars 
FROM `car dekho`
GROUP BY year, fuel 
HAVING COUNT(*) = (SELECT MAX(c) 
                   FROM (SELECT COUNT(*) AS c 
                         FROM `car dekho` 
                         GROUP BY year, fuel) AS subquery);

-- Count cars with advanced filtering (e.g., selling_price range, mileage) --
SELECT COUNT(*) AS total_cars 
FROM `car dekho`
WHERE selling_price BETWEEN 500000 AND 1500000 
  AND year BETWEEN 2015 AND 2023;

-- Total cars grouped by transmission type and year --
SELECT year, transmission, COUNT(*) AS total_cars
FROM `car dekho`
GROUP BY year, transmission;

-- Find the top 3 years with the highest number of cars --
SELECT year, COUNT(*) AS total_cars
FROM `car dekho`
GROUP BY year
ORDER BY total_cars DESC
LIMIT 3;

-- Detailed breakdown of cars with selling_price segmentation --
SELECT year, 
       COUNT(CASE WHEN selling_price < 500000 THEN 1 END) AS low_price_segment,
       COUNT(CASE WHEN selling_price BETWEEN 500000 AND 1000000 THEN 1 END) AS mid_price_segment,
       COUNT(CASE WHEN selling_price > 1000000 THEN 1 END) AS high_price_segment
FROM `car dekho`
GROUP BY year;
