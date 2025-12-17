-- =====================================================
-- 03. Common Table Expressions (CTE)
-- Goal Study 2: Use a CTE to retrieve a list of films with the highest number of rentals.
-- =====================================================

-- CTE creation process

WITH jumlah_rental_per_film AS (
    SELECT 
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS total_rental
    FROM film f
    JOIN inventory i 
        ON f.film_id = i.film_id
    JOIN rental r 
        ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title
)

--- CTE has been created.
    --- Validate the CTE: note—CTEs can only be referenced within the same query; they cannot be called in a separate query.
    --- SELECT * FROM transaksi_per_pelanggan; — returns 599 rows.
--- Next, proceed to the next use case

SELECT *
FROM jumlah_rental_per_film
WHERE total_rental = (
    SELECT MAX(total_rental) FROM jumlah_rental_per_film
)
ORDER BY title; --- Contains 1 record, with the film Bucket Brotherhood having a total of 34 rentals.

--- Results:
-- Out of 958 rented films, Bucket Brotherhood is the most popular film for rental.