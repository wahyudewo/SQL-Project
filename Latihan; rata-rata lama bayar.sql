SELECT * FROM orders;
SELECT 
    EXTRACT(YEAR_MONTH FROM created_at) AS tahun_bulan,
    COUNT(1) AS jumlah_transaksi,
    AVG(DATEDIFF(paid_at, created_at)) AS avg_lama_bayar,
    MIN(DATEDIFF(paid_at, created_at)) AS min_lama_dibayar,
    MAX(DATEDIFF(paid_at, created_at)) AS max_lama_dibayar
FROM
    orders
WHERE
    paid_at IS NOT NULL
GROUP BY 1
ORDER BY 1