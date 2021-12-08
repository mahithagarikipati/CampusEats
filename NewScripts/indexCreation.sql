create index ratingVal ON rating(rating_id,food_rating,delivery_rating);
create index orderRestaurantID ON `order`(order_id,restaurant_id);