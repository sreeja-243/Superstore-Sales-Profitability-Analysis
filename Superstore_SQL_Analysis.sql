-- =====================================================
-- 1. OVERALL BUSINESS PERFORMANCE
-- Business Question:
-- What are the overall sales, profit, quantity sold,
-- and average discount?
-- ====================================================
SELECT COUNT(*)
FROM sales;
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS average_discount
FROM sales;
-- =====================================================
-- 2. CATEGORY ANALYSIS
-- Business Question:
-- Which product categories generate the most sales
-- and profit, and which categories have weak margins?
-- =====================================================
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY category
ORDER BY total_profit DESC;
-- =====================================================
-- 3. SUB-CATEGORY ANALYSIS
-- Business Question:
-- Which sub-categories are profitable and which
-- sub-categories are generating losses?
-- =====================================================
SELECT
    sales.subcategory,
    SUM(sales.sales) AS total_sales,
    SUM(sales.profit) AS total_profit,
    ROUND(SUM(sales.profit) / SUM(sales.sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY sales.subcategory
ORDER BY total_profit ASC;
-- =====================================================
-- 4. DISCOUNT ANALYSIS
-- Business Question:
-- How does discount level affect profitability?
-- =====================================================
SELECT
    discount,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY discount
ORDER BY discount;
-- =====================================================
-- 5. REGION ANALYSIS
-- Business Question:
-- Which regions generate the highest sales and profit?
-- =====================================================
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY region
ORDER BY total_profit DESC;
-- =====================================================
-- 6. CUSTOMER SEGMENT ANALYSIS
-- Business Question:
-- Which customer segments generate the most sales
-- and profit?
-- =====================================================
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales
GROUP BY segment
ORDER BY total_profit DESC;
-- =====================================================
-- 7. TOP 10 PRODUCTS BY PROFIT
-- Business Question:
-- Which products contribute the most to profitability?
-- =====================================================
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
-- =====================================================
-- 8. BOTTOM 10 PRODUCTS BY PROFIT
-- Business Question:
-- Which products are contributing most to losses?
-- =====================================================
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;
-- =====================================================
-- KEY BUSINESS FINDINGS
-- =====================================================

-- 1. Technology generated the highest total profit
--    with a profit margin of approximately 17.40%.

-- 2. Furniture generated approximately $742K in sales
--    but had a very low profit margin of 2.49%.

-- 3. Tables were the largest loss-making sub-category,
--    with approximately $17.7K in losses.

-- 4. Bookcases and Supplies were also loss-making
--    sub-categories.

-- 5. Profit became negative at discount levels of 30%
--    and above.

-- 6. West was the strongest region with approximately
--    $108.4K profit and a 14.94% profit margin.

-- 7. Central had the lowest regional profit margin
--    at approximately 7.92%.

-- 8. Consumer generated the highest sales and total profit,
--    while Home Office had the highest profit margin.

-- 9. Canon imageCLASS 2200 Advanced Copier was the
--    highest-profit product.

-- 10. Cubify CubeX 3D Printer Double Head Print had
--     the largest individual product loss.