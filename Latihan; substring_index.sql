SELECT * FROM orders;
SELECT 
    SUBSTRING_INDEX(email, '@', - 1) domain, COUNT(seller_id) seller
FROM
    orders
        JOIN
    users ON seller_id = user_id
    group by domain