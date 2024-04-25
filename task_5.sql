USE pandemic;

DROP FUNCTION IF EXISTS CalculateDateDiff;

DELIMITER //

CREATE FUNCTION CalculateDateDiff (target_year YEAR)
RETURNS INT
NO SQL
BEGIN
DECLARE result INT;
SET result = TIMESTAMPDIFF(YEAR, MAKEDATE(target_year, 1), CURDATE());
RETURN result;
END //

DELIMITER ;

SELECT current_year, 
CalculateDateDiff(current_year)
FROM infectious_stat;