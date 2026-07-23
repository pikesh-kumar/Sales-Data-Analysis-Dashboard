CREATE DATABASE sales_db;

USE sales_db;

DROP TABLE sales;

CREATE TABLE sales (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,4)
);
SELECT COUNT(*) AS total_rows FROM sales;

SELECT COUNT(*) AS total_records
FROM sales;

SELECT ROUND(SUM(sales),2) AS Total_Sales
FROM sales;

SELECT ROUND(SUM(profit),2) AS Total_Profit
FROM sales;

SELECT SUM(quantity) AS Total_Quantity
FROM sales;

SELECT ROUND(AVG(sales),2) AS Average_Sales
FROM sales;

SELECT
    region,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY region
ORDER BY Total_Sales DESC;

SELECT
    region,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY region
ORDER BY Total_Profit DESC;

SELECT
    category,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY category
ORDER BY Total_Sales DESC;

SELECT
    category,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY category
ORDER BY Total_Profit DESC;

SELECT
    state,
    ROUND(SUM(sales),2) AS Total_Sales
FROM sales
GROUP BY state
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    city,
    ROUND(SUM(profit),2) AS Total_Profit
FROM sales
GROUP BY city
ORDER BY Total_Profit DESC
LIMIT 10;