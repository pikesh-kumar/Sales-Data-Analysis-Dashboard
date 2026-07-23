DELIMITER $$

CREATE PROCEDURE GetTotalSales()
BEGIN

    SELECT
        ROUND(SUM(sales),2) AS total_sales
    FROM sales;

END $$

DELIMITER ;

CALL GetTotalSales();

DELIMITER $$

CREATE PROCEDURE GetTotalProfit()
BEGIN

    SELECT
        ROUND(SUM(profit),2) AS total_profit
    FROM sales;

END $$

DELIMITER ;

CALL GetTotalProfit();

DELIMITER $$

CREATE PROCEDURE SalesByRegion()
BEGIN

    SELECT
        region,
        ROUND(SUM(sales),2) AS total_sales
    FROM sales
    GROUP BY region
    ORDER BY total_sales DESC;

END $$

DELIMITER ;

CALL SalesByRegion();

DELIMITER $$

CREATE PROCEDURE ProfitByCategory()
BEGIN

    SELECT
        category,
        ROUND(SUM(profit),2) AS total_profit
    FROM sales
    GROUP BY category
    ORDER BY total_profit DESC;

END $$

DELIMITER ;

CALL ProfitByCategory();

DELIMITER $$

CREATE PROCEDURE GetStateSales(IN state_name VARCHAR(100))
BEGIN

    SELECT
        state,
        ROUND(SUM(sales),2) AS total_sales
    FROM sales
    WHERE state = state_name
    GROUP BY state;

END $$

DELIMITER ;

CALL GetStateSales('California');

