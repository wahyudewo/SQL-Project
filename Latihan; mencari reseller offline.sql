SELECT * FROM orders;
SELECT 
    nama_user AS nama_pembeli,
    COUNT(1) AS jumlah_transaksi,
    SUM(total) AS total_nilai_transaksi,
    AVG(total) AS avg_nilai_transaksi,
    AVG(q) AS avg_quantity_per_transaksi
FROM
    orders
        JOIN
    users ON buyer_id = user_id
        JOIN
    (SELECT 
        order_id, SUM(quantity) q
    FROM
        order_details
    GROUP BY 1) AS od USING (order_id)
WHERE
    orders.kodepos = users.kodepos
GROUP BY user_id , nama_user
HAVING COUNT(1) >= 8 AND AVG(q) > 10
ORDER BY 3 DESC