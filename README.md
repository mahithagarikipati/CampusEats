# Campus Eats
  
## Team - ITCS 6160 - Group 8
### Members - Dhruvik Patel, Gowri Alwarsamy, Mahitha Garikipati, Sakshi Kaondal
### [Web Page Link - click here](https://github.com/mahithagarikipati/CampusEats/deployments/activity_log?environment=github-pages)
## Project Introduction
The idea of this project is to understand and enhance a test database for a campus-controlled food delivery service like craveoncampus.com. This database is enhanced to provide rating system for both restaurants and delivery drivers. The purpose for having this system is due the threat of the Corona virus the reason for having food delivery services became more important than before. 

Local restaurants are usually eager to find ways to provide food to customers without having to hire employees for delivery. Experts predict that, even if things get back to normal, people will get used to food delivery and will continue ordering their food that way. And, it’s a known fact that students love to get their food delivered through the services on campus. Although, companies like UberEats, GrubHub deliver food to students on campus, schools however feel that they should take control of this delivery, in order to ensure that students or authorized university employees are the only ones delivering food on campus for safety and health reasons. With the enhancement of this existing test database, food delivery customers will have the option to rate both the restaurant and the food delivery person. Every time a customer places an order for delivery, they will have an opportunity to rate the restaurant and the driver for that order after the food has been delivered. The ratings are made on the scale of 1 to 1 being the least and 5 being the highest. Similarly, food delivery customers will also have the option to upload picture and to add comments

## Business Rules
*	This application can be used only by the campus faculty, staff, students. Each user details like id, name, email, cell phone number etc is stored. The details of faculty like title, highest degree and their degree college is saved. For staff, position and admin status is stored and for the students, graduation year along with the major is stored to the database.

*	Some locations on the campus are the designated drop spots. For these locations, we save the location id, name, address and if provided, the latitude and longitude.

*	Delivery personnel have to be approved. The vehicle information, license number, hired date, ratings for these drivers are stored.

*	All delivery personnel are students.

*	For each transaction, $5 is charged as a flat delivery fee.

*	Each person can order one or more times

*	An individual delivery is tied to one and only one person for the order. 

*	Each order is tied to only one restaurant. This order contains details about the item ordered, quantity, special instructions, driver information, delivery date and time.

*	Each order will have an id tied to the individual restaurant.

*	Food providers or restaurants have to be approved in order to be included in the database. Each restaurant will have ID, location, schedule, and link to the website.

*	Each restaurant have one or more items in their menu

*	Each menu item is unique to the restaurant so there might be two same items in the database which may be considered as a weak entity. 

*	Users should be able to rate restaurants and drivers, plus upload a picture and add comment.

*	This database should sever as important source about nutrition and eating habits of campus community members

## EERD 
<img width="800" alt="FinalEERD" src="https://user-images.githubusercontent.com/20443793/139559246-ee2bf818-0365-4f68-8e91-8757bc66e685.PNG">

## EERD (with new tables)
## Data Dictionary
### Delivery Table
| Attributes    | Primary Key | Foreign Key | Data Type | size | null     | Description of the column                         |
|---------------|-------------|-------------|-----------|------|----------|---------------------------------------------------|
| delivery_id   | yes         |             | int       |      | not null | To identify each delivery. It is auto-incremented |
| driver_id     |             | yes         | int       |      |          | To identify the driver                            |
| vehicle_id    |             | yes         | int       |      |          | number to identify each vehicle                   |
| delivery_time |             |             | datetime  |      | not null | time when the order is delivered                  |

### Driver Table
| Attributes     | Primary Key  | Foreign Key  | Data Type | size | null     | Description of the column   |
|----------------|--------------|--------------|-----------|------|----------|-----------------------------|
| driver_id      | yes          |              | int       |      | not null | ID to identify each driver  |
| student_id     |              | yes          | int       |      | not null | ID to identify each student |
| license_number |              |              | varchar   | 75   | null     | license number of driver    |
| date_hired     |              |              | date      |      | null     | date when driver is hired   |
| rating         |              |              | float     |      | null     | driver rating               |

### Faculty table

| Attributes     | Primary Key | Foreign Key | Data Type | size | null     | Description of the column      |
|----------------|-------------|-------------|-----------|------|----------|--------------------------------|
| faculty_id     | yes         |             | int       |      | Not null | ID to identify faculty         |
| person_id      |             | yes         | int       |      | Not null | ID to identify each person     |
| title          |             |             | varchar   | 75   | null     | faculty title                  |
| degree_college |             |             | varchar   | 75   | null     | faculty degree awarded college |
| highest_degree |             |             | varchar   | 75   | null     | faculty highest degree         |

### Location table
| Attributes       | Primary Key | Foreign Key | Data Type | size | null     | Description of the column   |
|------------------|-------------|-------------|-----------|------|----------|-----------------------------|
| location_id      | yes         |             | int       |      | not null | id to identify the location |
| location_name    |             |             | varchar   | 75   | not null | name of the location        |
| location_address |             |             | varchar   | 75   | not null | address of the location     |
| latitude         |             |             | varchar   | 75   | not null | location latitude           |
| longitude        |             |             | varchar   | 75   | not null | location longitude          |
| drop_off_point   |             |             | varchar   | 75   | not null | drop off point              |

### Order table
| Attributes      | Primary Key | Foreign Key | Data Type | size | null      | Description of the column                        |
|-----------------|-------------|-------------|-----------|------|-----------|--------------------------------------------------|
| order_id        | yes         |             | int       |      | not null  | id to identify the order (auto-increment)
| person_id       |             | yes         | int       |      | not null  | id to identify the person                        |
| delivery_id     |             | yes         | int       |      | not null  | id to identify the delivery                      |
| location_id     |             | yes         | int       |      | not null  | id to identify the location                      |
| driver_id       |             | yes         | int       |      | not null  | id to identify the driver                        |
| restaurant_id   |             | yes         | int       |      | not null  | id to identify the restaurant                    |
| total_price     |             |             | float     |      | not null  | total order price                                |
| delivery_charge |             |             | float     |      | null      | delivery charge for the order                    |

### Person table
| Attributes   | Primary Key | Foreign Key | Data Type | size | null     | Description of the column              |
|--------------|-------------|-------------|-----------|------|----------|----------------------------------------|
| person_id    | yes         |             | int       |      | not null | id to identify person Auto-incremented |
| person_name  |             |             | varchar   | 300  | null     | Name of the person                     |
| person_email |             |             | varchar   | 150  | null     | Email of the person                    |
| cell         |             |             | bigint    |      | null     | Cell phone number                      |

### Restaurant table
| Attributes      | Primary Key | Foreign Key | Data Type | size | null     | Description of the column                    |
|-----------------|-------------|-------------|-----------|------|----------|----------------------------------------------|
| restaurant_id   | yes         |             | int       |      | not null | id to identify the restaurant Auto-increment |
| location        |             |             | varchar   | 75   | null     | restaurant location                          |
| restaurant_name |             |             | varchar   | 75   | null     | name of the restaurant                       |
| schedule        |             |             | varchar   | 75   | null     | restaurant schedule                          |
| website         |             |             | varchar   | 75   | null     | website link for the restaurant              |

### Staff table
| Attributes | Primary Key | Foreign Key | Data Type | size | null     | Description of the column                 |
|------------|-------------|-------------|-----------|------|----------|-------------------------------------------|
| staff_id   | yes         |             | int       |      | not null | id to identify the staff auto-incremented |
| person_id  |             | yes         | int       |      | null     | id to identify the person                 |
| position   |             |             | varchar   | 75   | null     | position of the staff                     |
| is_admin   |             |             | varchar   | 1    | null     | check admin staff(y/n)  defaulted to n    |

### Student table
| Attributes      | Primary Key | Foreign Key | Data Type | size | null     | Description of the column                 |
|-----------------|-------------|-------------|-----------|------|----------|-------------------------------------------|
| student_id      | yes         |             | int       |      | not null | id to identify the student auto-increment |
| person_id       |             | yes         | int       |      | not null | id to identify each person                |
| graduation_year |             |             | int       |      | null     | student graduation year                   |
| major           |             |             | varchar   | 75   | null     | student major                             |
| type            |             |             | varchar   | 75   | null     | check if graduate or under graduate       |

### Vehicle table
| Attributes    | Primary Key | Foreign Key | Data Type | size | null     | Description of the column    |
|---------------|-------------|-------------|-----------|------|----------|------------------------------|
| vehicle_id    | yes         |             | int       |      | not null | id to identify vehicle       |
| vehicle_plate |             |             | varchar   | 75   | null     | vehicle license plate number |
| model         |             |             | varchar   | 75   | null     | model of the vehicle         |
| make          |             |             | varchar   | 75   | null     | make of the vehicle          |

### person_join View
This view contains the details of students whose major is in computer science.
Below is the script for this view:

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `campus_eats_fall2020`.`person_join` AS
    SELECT 
        `campus_eats_fall2020`.`person`.`person_id` AS `person_id`,
        `campus_eats_fall2020`.`person`.`person_name` AS `person_name`,
        `campus_eats_fall2020`.`person`.`person_email` AS `person_email`,
        `campus_eats_fall2020`.`student`.`student_id` AS `student_id`,
        `campus_eats_fall2020`.`student`.`graduation_year` AS `graduation_year`
    FROM
        (`campus_eats_fall2020`.`person`
        JOIN `campus_eats_fall2020`.`student` ON ((`campus_eats_fall2020`.`student`.`person_id` = `campus_eats_fall2020`.`person`.`person_id`)))
    WHERE
        (`campus_eats_fall2020`.`student`.`major` = 'Computer Science');
        
### person_student View
This view contains the details of students who graduated in the year 2019
Below is the script for this view:

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `campus_eats_fall2020`.`person_student` AS
    SELECT 
        `a`.`person_id` AS `person_id`,
        `a`.`person_name` AS `person_name`,
        `a`.`person_email` AS `person_email`,
        `a`.`cell` AS `cell`
    FROM
        `campus_eats_fall2020`.`person` `a`
    WHERE
        `a`.`person_id` IN (SELECT 
                `campus_eats_fall2020`.`student`.`person_id`
            FROM
                `campus_eats_fall2020`.`student`
            WHERE
                (`campus_eats_fall2020`.`student`.`graduation_year` = 2019));
                
### add_person procedure call
This procedure call inserts the values in person table depending on the person_type. Based on this person_type, values are further inserted into faculty, staff or student table.

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_person`(in person_name varchar(300), in email varchar(150), cellno bigint (15), person_type varchar(10))
BEGIN
insert into person (person_name, person_email, cell) values(person_name, email, cellno);
if(person_type = 'student') then
insert into student (person_id, graduation_year, major, type) values 
((select person_id from person where cell = cellno), 2019, 'Computer Science', 'Graduate');
elseif(person_type = 'faculty') then
insert into faculty (person_id, title, degree_college, highest_degree) values 
((select person_id from person where cell = cellno), 'Assistant Professor', 'UCLA', 'PhD');
elseif(person_type = 'staff') then
insert into student (person_id, position, is_admin) values 
((select person_id from person where cell = cellno), 'Bus Driver', 'N');
end if;
END;

## Additional Changes
### Updated ERD
![FinalERD](https://user-images.githubusercontent.com/20443793/141714435-b7676805-fd12-4ada-9ae1-b0092949df15.png)

### Adding Items table
| Attributes               | Primary Key | Foreign Key | Data Type | size | null     | Description of the column     |
|--------------------------|-------------|-------------|-----------|------|----------|-------------------------------|
| item_id                  | yes         |             | int       |      | not null | id to identify each menu item |
| item_name                |             |             | varchar   | 45   | null     | Name of the item              |
| item_desc                |             |             | varchar   | 45   | null     | item description              |
| item_price               |             |             | float     |      | null     | cost of the item              |
| restaurant_restaurant_id |             | yes         | int       |      | not null | id to identify the restaurant |

### Query
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `item_desc` varchar(45) DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `restaurant_restaurant_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`restaurant_restaurant_id`),
  KEY `fk_Items_restaurant1_idx` (`restaurant_restaurant_id`),
  CONSTRAINT `fk_Items_restaurant1` FOREIGN KEY (`restaurant_restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

### Updated order table
| Attributes      | Primary Key | Foreign Key | Data Type | size | null      | Description of the column                        |
|-----------------|-------------|-------------|-----------|------|-----------|--------------------------------------------------|
| order_id        | yes         |             | int       |      | not null  | id to identify the order (auto-increment)
| person_id       |             | yes         | int       |      | not null  | id to identify the person                        |
| delivery_id     |             | yes         | int       |      | not null  | id to identify the delivery                      |
| location_id     |             | yes         | int       |      | not null  | id to identify the location                      |
| driver_id       |             | yes         | int       |      | not null  | id to identify the driver                        |
| restaurant_id   |             | yes         | int       |      | not null  | id to identify the restaurant                    |
| total_price     |             |             | float     |      | not null  | total order price                                |
| delivery_charge |             |             | float     |      | null      | delivery charge for the order                    |
| order_date      |             |             | date      |      | not null  | date when order created                          |
| order_time      |             |             | timestamp |      | not null  | time when order got created                      |

### Adding order_items table
| Attributes               | Primary Key | Foreign Key | Data Type | size | null     | Description of the column     |
|--------------------------|-------------|-------------|-----------|------|----------|-------------------------------|
| order_item_id            | yes         |             | int       |      | not null | id to identify orderItems     |
| item_id                  |             | yes         | int       |      | not null | item id ordered               |
| order_id                 |             | yes         | int       |      | not null | id of the order               |

### Query

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_OrderItems_item_id` (`item_id` ),
   KEY  `fk_OrderItems_order_id` (`order_id`),
   CONSTRAINT `fk_OrderItems_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `fk_OrderItems_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

### Adding Rating table
| Attributes      | Primary Key | Foreign Key | Data Type | size | null     | Description of the column         |
|-----------------|-------------|-------------|-----------|------|----------|-----------------------------------|
| Rating_id       | yes         |             | int       |      | not null | id to identify rating of an order |
| order_id        |             | yes         | int       |      | null     | id of the order                   |
| food_rating     |             |             | int       |      | null     | rating given for food 1-5         |
| delivery_rating |             |             | int       |      | null     | delivery rating 1-5               |
| image           |             |             | longblob  |      | null     | upload an image of the order      |
| image_path      |             |             | varchar   | 45   | null     | image path saved                  |
| comments        |             |             | varchar   | 100  | null     | describe the comments             |

### Query
CREATE TABLE `rating` (
  `rating_id` int NOT NULL auto_increment,
  `order_id` int default NULL,
  `food_rating` int default NULL,
  `delivery_rating` int DEFAULT NULL,
  `image` LONGBLOB default NULL,
  `image_path` varchar(45) default Null,
  `comments` varchar(100) default NULL,
  PRIMARY KEY (`rating_id`),
  KEY `fk_rating_order_idx` (`order_id`),
  CONSTRAINT `fk_rating_order_idx` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

### Procedure to add new restaurants in and near UNC charlotte - insert_into_restaurant

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

## Load Data
The database is loaded with data for all tables. The insert script can be found (here) [https://github.com/mahithagarikipati/CampusEats/blob/main/InsertScripts/insertScript.sql]
## SQL queries for Information
### Retreive maximum, minimum, average food and delivery ratings for all orders of a restaurant given restaurant id
A procedure call `max_min_avg_restaurant_rating` with in parameter having restaurant_id

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `max_min_avg_restaurant_rating`(in restaurantId int)
BEGIN
SELECT max( IFNULL(rate.food_rating,0)) AS maxFoodRate,
min( IFNULL(rate.food_rating,0)) AS minFoodRate,
avg( IFNULL(rate.food_rating,0)) AS avgFoodRate,
(select 
max( IFNULL(rate.delivery_rating,0)) 
FROM rating rate,
`order` ord,
restaurant res
WHERE rate.order_id = ord.order_id
AND ord.restaurant_id = res.restaurant_id
AND ord.restaurant_id = restaurantId
AND rate.delivery_rating >=0 ) AS maxDeliveryRate ,
(select 
min( IFNULL(rate.delivery_rating,0)) 
FROM rating rate,
`order` ord,
restaurant res
WHERE rate.order_id = ord.order_id
AND ord.restaurant_id = res.restaurant_id
AND ord.restaurant_id = restaurantId
AND rate.delivery_rating >=0 ) AS minDeliveryRate,
(select 
avg( IFNULL(rate.delivery_rating,0))
FROM rating rate,
`order` ord,
restaurant res
WHERE rate.order_id = ord.order_id
AND ord.restaurant_id = res.restaurant_id
AND ord.restaurant_id = restaurantId
AND rate.delivery_rating >=0 ) AS avgDeliveryRate 
FROM rating rate,
`order` ord,
restaurant res
WHERE rate.order_id = ord.order_id
AND ord.restaurant_id = res.restaurant_id
AND ord.restaurant_id = restaurantId
AND rate.food_rating >=0 ;                   
END$$
DELIMITER ;
### Index is created on order and rating table

call max_min_avg_restaurant_rating(1);

The above procedure call takes 0.016 sec to execute - this procedure calculates the max, min and avg ratings of all orders in a restaurant.

<img width="881" alt="Capture" src="https://user-images.githubusercontent.com/20443793/145080134-bbf0d0e3-72ab-4f08-bd95-4961b88de3ee.PNG">

Index orderID is created on order table on the order_id and restaurant_id column 

create index orderRestaurantID  ON `order`(order_id,restaurant_id);

Index ratingId is created on rating table on the rating_id, food_rating, delivery_rating column 

create index ratingVal ON rating(rating_id,food_rating,delivery_rating);

This look up index reduced the procedure call time to 0.00 sec.

![image](https://user-images.githubusercontent.com/20443793/145080341-c043c6d8-b0bf-404b-b1c4-8689f55bc7c5.png)

It provides query optimization on the search query which contains restaurant id.

Also, the min, max, avg operations are performed on food_rating and  delivery_rating which are indexed as well which will optimize the query.

### display a count of the orders made by a customer for a specified date range when given a customer id
In order to get the count of orders for a specific range for a given customer a view is created

CREATE OR REPLACE
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `campus_eats_fall2020`.`total_orders_each_customer` AS
    SELECT 
        `p`.`person_id` AS `Person ID`,
        COUNT(DISTINCT(`o`.`order_id`)) AS `Total Orders`,
        delivery_time AS delivery_date
    FROM
        ((`campus_eats_fall2020`.`order` `o`
        JOIN `campus_eats_fall2020`.`person` `p` ON ((`o`.`person_id` = `p`.`person_id`)))
        JOIN `campus_eats_fall2020`.`delivery` `d` ON ((`o`.`delivery_id` = `d`.`delivery_id`)))
    WHERE
        (DATE_FORMAT(`d`.`delivery_time`, '%Y/%m/%d') BETWEEN '1980/01/1' AND '2020/01/01')
    GROUP BY `o`.`person_id`;


### display total price of the orders by each customer (distinct) for a specified date range

In order to get a total price of orders for each customer, a view has been created

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `campus_eats_fall2020`.`total_price_each_customer` AS
    SELECT 
        `p`.`person_id` AS `Person ID`,
        ROUND(SUM(`o`.`total_price`), 2) AS `Total Price`
    FROM
        ((`campus_eats_fall2020`.`order` `o`
        JOIN `campus_eats_fall2020`.`person` `p` ON ((`o`.`person_id` = `p`.`person_id`)))
        JOIN `campus_eats_fall2020`.`delivery` `d` ON ((`o`.`delivery_id` = `d`.`delivery_id`)))
    WHERE
        (DATE_FORMAT(`d`.`delivery_time`, '%Y/%m/%d') BETWEEN '1980/01/1' AND '2020/01/01')
    GROUP BY `o`.`person_id`
  
 To call the view  execute the following statement
 
 select * from total_price_each_customer;
 
### display a particular customer’s rating for a restaurant

A view is created to display all the ratings of a customer on an average for each restaurant


CREATE OR REPLACE
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `campus_eats_fall2020`.`customer_ratings` AS
    SELECT 
        `p`.`person_id` AS `Person ID`,
        ROUND(avg(r.food_rating),2) as `Food Rating`,
        o.restaurant_id As restaurantID
        FROM
        ((`campus_eats_fall2020`.`order` `o`
        JOIN `campus_eats_fall2020`.`person` `p` ON ((`o`.`person_id` = `p`.`person_id`)))
        JOIN `campus_eats_fall2020`.`rating` `r` ON ((`o`.`order_id` = `r`.`order_id`)))
    GROUP BY `p`.`person_id`;

To execute the view

select * from customer_ratings;


