-- =====================================================
-- 04. CASE WHEN
-- Goal Study 2: Use CASE WHEN to categorize data based on specific conditions.
-- =====================================================

--- Create a query to segment customers based on their total transaction value:
    -- Customers with total transactions above $100 are classified as “High Value Customer.”
    -- Customers with total transactions between $50 and $100 are classified as “Medium Value Customer.”
    -- Customers with total transactions below $50 are classified as “Low Value Customer.”
-----------------

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_transaksi,
    CASE
        WHEN SUM(p.amount) > 100 THEN 'High Value Customer'
        WHEN SUM(p.amount) BETWEEN 50 AND 100 THEN 'Medium Value Customer'
        WHEN SUM(p.amount) < 50 THEN 'Low Value Customer'
    END AS kategori
FROM customer c
JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_transaksi DESC;

--- check distribusinya
WITH total_per_customer AS (
  SELECT 
      c.customer_id,
      SUM(p.amount) AS total_transaksi
  FROM customer c
  JOIN payment p ON p.customer_id = c.customer_id
  GROUP BY c.customer_id
),
kategori AS (
  SELECT 
      CASE
        WHEN total_transaksi > 100 THEN 'High Value Customer'
        WHEN total_transaksi BETWEEN 50 AND 100 THEN 'Medium Value Customer'
        ELSE 'Low Value Customer'
      END AS kategori
  FROM total_per_customer
)
SELECT 
    kategori,
    COUNT(*) AS jumlah_pelanggan
FROM kategori
GROUP BY kategori
ORDER BY 
  CASE kategori
    WHEN 'High Value Customer' THEN 1
    WHEN 'Medium Value Customer' THEN 2
    ELSE 3
  END;

-- Conclusion:
    -- Nearly all customers have total transaction values above $50.
    -- This is reflected by the dominance of High Value Customer and Medium Value Customer categories.
    -- Only a small number of customers make transactions below $50.
