-- =====================================================
-- 03. Common Table Expressions (CTE)
-- Goal Study 1: Use a CTE to create a list of customers who have made more than 10 transactions.
-- =====================================================

-- CTE creation process
WITH transaksi_per_pelanggan AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(p.payment_id) AS jumlah_transaksi
    FROM customer c
    JOIN payment p 
        ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)

--- CTE has been created.
    --- Validate the CTE: note—CTEs can only be referenced within the same query; they cannot be called in a separate query.
    --- SELECT * FROM transaksi_per_pelanggan; — returns 599 rows.
--- Next, proceed to the next use case

SELECT *
FROM transaksi_per_pelanggan
WHERE jumlah_transaksi > 10
ORDER BY jumlah_transaksi DESC; --- containing: 597 data

--- Results:
--  Out of 599 customers, 597 customers made more than 10 transactions.
-- The customer with the highest number of transactions is Eleanor Hunt with 45 transactions.