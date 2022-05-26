SELECT * FROM orders;
SELECT 
    buyer_id, email, COUNT(bulan) jumlah_bulan, rataan
FROM
    (SELECT 
        buyer_id, MONTH(created_at) bulan, AVG(total) rataan
    FROM
        orders
    WHERE
        YEAR(created_at) = '2020'
    GROUP BY buyer_id , bulan
    ORDER BY buyer_id , bulan DESC) b
join users u on b.buyer_id = u.user_id
GROUP BY buyer_id
HAVING jumlah_bulan = 5 AND rataan > 1000000
ORDER BY rataan DESC;

SELECT 
    buyer_id, email, COUNT(bulan), AVG(amount)
FROM
    (SELECT 
        buyer_id, MONTH(created_at) bulan, SUM(total) amount
    FROM
        orders
    WHERE
        YEAR(created_at) = '2020'
    GROUP BY buyer_id , bulan
    ORDER BY buyer_id , bulan DESC) a
join users u on a.buyer_id = u.user_id
GROUP BY buyer_id
HAVING COUNT(bulan) = 5
    AND AVG(amount) > 1000000
ORDER BY COUNT(bulan) DESC , AVG(amount) DESC