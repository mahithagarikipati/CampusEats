DROP PROCEDURE IF EXISTS restaurants;
DELIMITER //
/* procedure to list different restaurants that a person has ordered food from
*/
CREATE PROCEDURE restaurants (IN person_no INT)
BEGIN
	SELECT restaurant_name
	FROM campus_eats_fall2020.order AS o
	INNER JOIN restaurant AS r
	ON o.restaurant_id = r.restaurant_id
	WHERE person_id = person_no;

END // 

CALL restaurants (1)