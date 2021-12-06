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
