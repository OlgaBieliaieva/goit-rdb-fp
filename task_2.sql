USE pandemic;

CREATE TABLE regions (
id INT AUTO_INCREMENT PRIMARY KEY, 
region VARCHAR(50),
region_code VARCHAR(10), 
count_regions INT
);

INSERT INTO regions (region, region_code, count_regions)
SELECT Entity, Code, COUNT(Entity)
FROM infectious_cases
GROUP BY Entity, Code;

ALTER TABLE regions
DROP COLUMN count_regions;

CREATE TABLE infectious_stat (
region_id INT, 
current_year year,
number_yaws VARCHAR(50),
polio_cases INT,
cases_guinea_worm INT,
number_rabies VARCHAR(50),
number_malaria VARCHAR(50),
number_hiv VARCHAR(50),
number_tuberculosis VARCHAR(50),
number_smallpox VARCHAR(50),
number_cholera_cases VARCHAR(50),
FOREIGN KEY (region_id) REFERENCES regions(id)
);

INSERT INTO infectious_stat (
region_id,
current_year,
number_yaws,
polio_cases,
cases_guinea_worm,
number_rabies,
number_malaria,
number_hiv,
number_tuberculosis,
number_smallpox,
number_cholera_cases)
WITH temp_table AS (SELECT * FROM infectious_cases INNER JOIN regions ON infectious_cases.Entity = regions.region)
SELECT 
id,
Year,
Number_yaws,
polio_cases,
cases_guinea_worm,
Number_rabies,
Number_malaria,
Number_hiv,
Number_tuberculosis,
Number_smallpox,
Number_cholera_cases
FROM temp_table;

DROP TABLE infectious_cases;

SELECT *
FROM infectious_stat;







