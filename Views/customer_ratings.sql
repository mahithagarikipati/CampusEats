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