DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_drivers_with_rating`(in rating int(1))
BEGIN
SELECT person_name as student_name, rating, cell as student_contact, graduation_year, major, s.type as college_type
FROM campus_eats_fall2020.driver AS d
INNER JOIN person AS p1   
	INNER JOIN student AS s
	ON s.student_id = d.student_id
	AND s.person_id = p1.person_id
    AND d.rating = rating;
END$$ 
DELIMITER ;