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