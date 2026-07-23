SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY category
HAVING SUM(profit) > 10000
ORDER BY total_profit DESC;

-- States with sales above 50000

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY state
HAVING SUM(sales) > 50000
ORDER BY total_sales DESC;

-- States with sales above 50000

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY state
HAVING SUM(sales) > 50000
ORDER BY total_sales DESC;

-- States with sales above 50000

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY state
HAVING SUM(sales) > 50000
ORDER BY total_sales DESC;

SELECT
    city,
    ROUND(SUM(profit),2) AS total_profit,

    CASE
        WHEN SUM(profit) > 5000 THEN 'High Profit'
        WHEN SUM(profit) BETWEEN 0 AND 5000 THEN 'Medium Profit'
        ELSE 'Loss'
    END AS profit_category

FROM sales
GROUP BY city
ORDER BY total_profit DESC;

SELECT
    discount,
    ROUND(AVG(profit),2) AS average_profit
FROM sales
GROUP BY discount
ORDER BY discount;

SELECT
    category,

    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage

FROM sales
GROUP BY category
ORDER BY profit_margin_percentage DESC;

SELECT
    *
FROM sales
ORDER BY sales DESC
LIMIT 10;

SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit;

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,

    RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank

FROM sales
GROUP BY category;

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales,

    DENSE_RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS state_rank

FROM sales
GROUP BY state;

SELECT *
FROM
(
    SELECT
        city,
        ROUND(SUM(sales),2) AS total_sales,

        RANK() OVER(
            ORDER BY SUM(sales) DESC
        ) AS rank_city

    FROM sales
    GROUP BY city
) AS city_rank
WHERE rank_city <= 5;

