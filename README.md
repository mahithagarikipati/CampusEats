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
