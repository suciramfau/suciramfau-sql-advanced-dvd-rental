📊 SQL Advanced – DVD Rental Business Case
Project Overview

This project demonstrates the application of advanced SQL techniques to analyze customer behavior, film performance, and pricing strategy using the DVD Rental database.
The analysis is framed as a fictional company case study to reflect real-world business decision making.

Business Objectives

Identify high-value customers who contribute the most revenue

Analyze film performance based on rental frequency and pricing

Segment customers and films to support marketing & pricing strategies

Demonstrate real-world usage of SQL on large-scale databases

Dataset

Dataset: DVD Rental

Total tables: 17

Key tables used:

customer (599 customers)

payment (14,596 transactions)

film (1,000 films)

rental, inventory, film_actor

SQL Techniques & Use Cases
1️⃣ Subquery

Use case:
Identify customers whose average transaction value is higher than the overall average.

Business value:
Helps identify customers with higher spending behavior for loyalty targeting.

2️⃣ Window Functions

Functions used: RANK(), DENSE_RANK(), ROW_NUMBER()

Use cases:

Rank films based on rental price

Rank customers based on total spending

Order films chronologically by release year

Business value:
Enables ranking, comparison, and prioritization without collapsing data granularity.

3️⃣ Common Table Expressions (CTE)

Use cases:

Identify customers with more than 10 transactions

Find the most rented film across the entire catalog

Business value:
Improves query readability and simplifies complex analytical logic.

4️⃣ CASE WHEN (Data Classification)

Use cases:

Film pricing classification:

Premium (rental_rate > $4)

Regular ($2–$4)

Budget (< $2)

Customer value segmentation:

High Value Customer (> $100)

Medium Value Customer ($50–$100)

Low Value Customer (< $50)

Business value:
Transforms raw data into actionable business segments.

Key Insights

High & Medium Value Customers represent the majority of revenue

A small group of customers contributes disproportionately high transactions

Premium-priced films show strong rental performance

Certain films (e.g., Bucket Brotherhood) dominate rental frequency

Business Recommendations

Implement loyalty programs for top-spending customers

Focus marketing efforts on premium and best-selling films

Apply bundling strategies (popular film + new release)

Use customer segmentation for pricing and retention strategy

Tools & Technologies

SQL (PostgreSQL / MySQL)

Excel (light visualization for business presentation)

Repository Content

/queries → SQL scripts for each advanced SQL concept

/screenshots → Selected query results for validation