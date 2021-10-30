DELIMITER $$
CREATE  DEFINER=`root`@`localhost` PROCEDURE `get_order_details`(in order_id varchar(100))
BEGIN
SELECT order_id, p1.person_name as driver, p.person_name as ordered_by, location_name, location_address
FROM campus_eats_fall2020.order AS o 
INNER JOIN
   person AS p1
   ON o.driver_id = p1.person_id 
   AND o.order_id = order_id
   INNER JOIN
   person AS p
   ON o.person_id = p.person_id 
   AND o.order_id = order_id
   INNER JOIN
   location AS l
   ON o.location_id = l.location_id
   AND o.order_id = order_id;
END$$ 
DELIMITER ;
