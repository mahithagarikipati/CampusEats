USE campus_eats_fall2020;

DROP PROCEDURE IF EXISTS insert_into_restaurant;

DELIMITER //

CREATE PROCEDURE insert_into_restaurant
(
  location         VARCHAR(75),
  restaurant_name  VARCHAR(75),
  schedule     VARCHAR(75),
  website           VARCHAR(75)
)
BEGIN
  DECLARE location_var           VARCHAR(75);
  IF length(restaurant_name) > 75 THEN
    SIGNAL SQLSTATE '22001'
      SET MESSAGE_TEXT = "Data too long for column 'restaurant_name' at row 1", 
      MYSQL_ERRNO = 1406;
  ELSEIF length(location) > 75 THEN
    SIGNAL SQLSTATE '22001'
      SET MESSAGE_TEXT = "Data too long for column 'location' at row 1", 
      MYSQL_ERRNO = 1406;
  ELSEIF length(schedule) > 75 THEN
    SIGNAL SQLSTATE '22001'
      SET MESSAGE_TEXT = "Data too long for column 'schedule' at row 1", 
      MYSQL_ERRNO = 1406;
  END IF;

  IF location IS NULL THEN
	SET location_var = "No location specified";
  ELSE
    SET location_var = location;
  END IF;

  INSERT INTO restaurant
         (location, restaurant_name, 
          restaurant.schedule, website)
  VALUES ( location, restaurant_name, 
          schedule, website);
END//

DELIMITER ;
CALL insert_into_restaurant('Charlotte', 'chartwells', '08AM-09PM', 'chartwellscatering@uncc.edu');
CALL insert_into_restaurant('Charlotte', 'Salsaritas Fresh Cantina', '10AM-9PM', 'www.salsaritas.com');
CALL insert_into_restaurant('Charlotte', 'Crown Commons', '08AM-8:30PM', ' dineoncampus.com');
CALL insert_into_restaurant('8948 J M Keynes Dr #420, Charlotte, NC 28262', 'City Barbeque and Catering', '10:00AM -09:00PM', 'citybbq.com');
CALL insert_into_restaurant('8948 J M Keynes Dr Suite 400, Charlotte, NC 28262', 'blaze pizza', '08AM-09PM', 'blazepizza.com');
CALL insert_into_restaurant('9321 JW Clay Blvd, Charlotte, NC 28262', 'Panera Bread', '8:00 AM to 9:00 Pm', 'delivery.panerabread.com');

