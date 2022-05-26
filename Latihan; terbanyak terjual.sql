SELECT * FROM orders;
SELECT 
    product_id, desc_product, SUM(quantity)
FROM
    orders o
        JOIN
    order_details od USING (order_id)
        JOIN
    products USING (product_id)
WHERE
    YEAR(created_at) = 2019
        AND MONTH(created_at) = 12
GROUP BY desc_product
ORDER BY SUM(quantity) DESC
LIMIT 5