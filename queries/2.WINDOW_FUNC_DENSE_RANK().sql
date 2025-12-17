-- =====================================================
-- 02. DENSE RANK ()
-- Goal: Use the DENSE_RANK() function to rank customers based on the total number of transactions they have made.
-- =====================================================


select * from payment; --- result: 14.596 transactions

select * from customer; --- result: 599 customers

--- customer rangking based on total transactions
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_amount, --- total transactions
    DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rank_total_transaksi
FROM customer c
JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rank_total_transaksi, c.first_name;

-- Results:
--- The highest transaction value in held by Eleanor Hunt at 211.55
--- The lowest transaction value is held by Bryan Wyman at 27.93