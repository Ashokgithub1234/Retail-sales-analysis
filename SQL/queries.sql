-- Retail Sales Analysis: SQL Queries
-- Author: Ashok S

-- 1. Overall business summary: total sales, profit, and margin
SELECT ROUND(SUM(Sales)) AS total_sales,
       ROUND(SUM(Profit)) AS total_profit,
       ROUND(SUM(Profit)*100.0/SUM(Sales), 1) AS margin_pct
FROM orders;

-- 2. Sales and profit by category
SELECT Category, ROUND(SUM(Sales)) AS sales, ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY Category
ORDER BY profit DESC;

-- 3. Sub-categories that lose money overall
SELECT "Sub-Category", ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY "Sub-Category"
HAVING SUM(Profit) < 0;

-- 4. Top 10 customers by total sales
SELECT "Customer Name", ROUND(SUM(Sales)) AS sales
FROM orders
GROUP BY "Customer Name"
ORDER BY sales DESC
LIMIT 10;

-- 5. Top 3 customers within each segment (window function)
SELECT * FROM (
    SELECT Segment, "Customer Name",
           ROUND(SUM(Sales)) AS sales,
           RANK() OVER (PARTITION BY Segment ORDER BY SUM(Sales) DESC) AS rnk
    FROM orders
    GROUP BY Segment, "Customer Name"
)
WHERE rnk <= 3;

-- 6. Year-over-year sales and profit
SELECT strftime('%Y', "Order Date") AS year,
       ROUND(SUM(Sales)) AS sales,
       ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY year
ORDER BY year;

-- 7. Profit by discount band
SELECT
    CASE
        WHEN Discount = 0 THEN '0%'
        WHEN Discount <= 0.1 THEN '1-10%'
        WHEN Discount <= 0.2 THEN '11-20%'
        WHEN Discount <= 0.3 THEN '21-30%'
        ELSE '30%+'
    END AS discount_band,
    ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY discount_band;

-- 8. Region performance vs a 20% margin target (JOIN)
SELECT o.Region,
       ROUND(SUM(o.Profit)*100.0/SUM(o.Sales), 1) AS actual_margin,
       t.Target_Margin
FROM orders o
JOIN targets t ON o.Region = t.Region
GROUP BY o.Region;