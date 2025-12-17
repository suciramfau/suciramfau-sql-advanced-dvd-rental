-- =====================================================
-- 01. SUBQUERY ANALYSIS
-- Goal: Identify customers with average transaction
--       above overall average
-- =====================================================


-- Check Table Payment
select * from payment; -- result: 14.596 transaction
select avg (amount) from payment;-- avg. transaction: 4.2006056453822965

-- Check Table Customer
select * from customer; --- result: 599 customers

-- Check Data Customer with transaction over than average
SELECT 
    c.first_name, 
    c.last_name, 
    ROUND(AVG(p.amount), 2) AS avg_per_customer,
    (SELECT ROUND(AVG(amount), 2) FROM payment) AS avg_overall
FROM customer c
JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
HAVING AVG(p.amount) > (SELECT AVG(amount) FROM payment)
ORDER BY avg_per_customer DESC;  --- result: 295 customer
