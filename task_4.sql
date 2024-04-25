USE pandemic;

SELECT current_year, 
MAKEDATE(current_year, 1) AS stat_date, 
CURDATE() AS date_now, 
TIMESTAMPDIFF(YEAR, MAKEDATE(current_year, 1), CURDATE()) AS difference_years
FROM infectious_stat;
