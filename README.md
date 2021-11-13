# Campus Eats
  
## Team - ITCS 6160 - Group 8
### Members - Dhruvik Patel, Gowri Alwarsamy, Mahitha Garikipati, Sakshi Kaondal
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

### Adding order_items table
| Attributes               | Primary Key | Foreign Key | Data Type | size | null     | Description of the column     |
|--------------------------|-------------|-------------|-----------|------|----------|-------------------------------|
| order_item_id            | yes         |             | int       |      | not null | id to identify orderItems     |
| item_id                  |             | yes         | int       |      | not null | item id ordered               |
| order_id                 |             | yes         | int       |      | not null | id of the order               |

### Query

