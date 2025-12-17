-- =====================================================
-- 04. CASE WHEN
-- Goal Study 1: Using CASE WHEN for Data Classification
-- =====================================================

--- Film categorization based on rental_rate:
    --- If rental_rate is greater than 4    : "Premium" category
    --- If rental_rate is between 2 and 4   : "Regular" category
    --- If rental_rate is less than 2       : "Budget" category
---------------------------

SELECT 
    title,
    rental_rate,
    CASE 
        WHEN rental_rate > 4 THEN 'Premium'
        WHEN rental_rate BETWEEN 2 AND 4 THEN 'Regular'
        WHEN rental_rate < 2 THEN 'Budget'
    END AS kategori
FROM film
ORDER BY kategori, title; 

--- check distribution category
SELECT 
    CASE 
        WHEN rental_rate > 4 THEN 'Premium'
        WHEN rental_rate BETWEEN 2 AND 4 THEN 'Regular'
        WHEN rental_rate < 2 THEN 'Budget'
    END AS kategori,
    COUNT(*) AS jumlah_film
FROM film
GROUP BY kategori
ORDER BY jumlah_film DESC;

--- Conclusion:
-- The distribution of rental_rate categories across all groups can be considered relatively even.