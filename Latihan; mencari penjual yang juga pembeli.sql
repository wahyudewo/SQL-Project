SELECT * FROM orders;
SELECT DISTINCT
    nama_user AS nama_pengguna,
    jumlah_transaksi_beli,
    jumlah_transaksi_jual
FROM users
	JOIN
		(SELECT buyer_id, COUNT(1) jumlah_transaksi_beli FROM orders GROUP BY 1) AS buyer 
		ON buyer_id = user_id
	JOIN
		(SELECT seller_id, COUNT(1) jumlah_transaksi_jual FROM orders GROUP BY 1) AS seller
		ON seller_id = user_id
WHERE
    jumlah_transaksi_beli >= 7
ORDER BY 1