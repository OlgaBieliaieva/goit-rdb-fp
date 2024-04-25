USE pandemic;

SELECT region_id, AVG(number_rabies) AS average, MIN(number_rabies) AS minimum, MAX(number_rabies) AS maximum, SUM(number_rabies) AS total
FROM infectious_stat
WHERE number_rabies != ''
GROUP BY region_id
ORDER BY average DESC
LIMIT 10;