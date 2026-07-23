CREATE VIEW sales_summary AS

SELECT
    category,
    sub_category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    SUM(quantity) AS total_quantity

FROM sales

GROUP BY
    category,
    sub_category;
    
    SELECT *
FROM sales_summary;

CREATE VIEW region_performance AS

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    SUM(quantity) AS total_quantity

FROM sales

GROUP BY region;

SELECT *
FROM region_performance
ORDER BY total_sales DESC;

CREATE VIEW category_profit_analysis AS

SELECT
    category,

    ROUND(SUM(sales),2) AS total_sales,

    ROUND(SUM(profit),2) AS total_profit,

    ROUND(
        SUM(profit)/SUM(sales)*100,
        2
    ) AS profit_margin

FROM sales

GROUP BY category;

SELECT *
FROM category_profit_analysis;

CREATE VIEW loss_products AS

SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_loss

FROM sales

GROUP BY sub_category

HAVING SUM(profit) < 0;

SELECT *
FROM loss_products;

CREATE VIEW dashboard_kpi AS

SELECT

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit,

SUM(quantity) AS total_quantity,

COUNT(*) AS total_orders

FROM sales;

SELECT *
FROM dashboard_kpi;
