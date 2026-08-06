CREATE DATABASE restaurant_sales_db;

/* Create pi graph of items that make up sales
Create line graph of total revenue over the months
Create bar graph of item and revenue it has made
Find most popular item and month with most sales
Calculate total revenue and most popular payment method */

/* Product Sales PI Graph */
USE restaurant_sales_db;

CREATE VIEW product_sales AS
SELECT
    Product,
    SUM(Quantity) AS total_sold
FROM sales_table
GROUP BY Product;


/* Monthly Revenue Line Graph */
USE restaurant_sales_db;

CREATE VIEW revenue_by_month AS 
SELECT
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS month,
    SUM(Quantity*Price) AS monthly_revenue
FROM sales_table
GROUP BY month;


/* Revenue by Item Bar Graph */
USE restaurant_sales_db;

CREATE VIEW revenue_by_item AS 
SELECT
    Product,
    SUM(Quantity*Price) AS product_revenue
FROM sales_table
GROUP BY Product;


/* Most Popular Item */
USE restaurant_sales_db;

CREATE VIEW most_popular AS 
SELECT
    Product,
    SUM(Quantity) AS popularity
FROM sales_table
GROUP BY Product
ORDER BY popularity DESC
LIMIT 1;


/* Total Revenue */
USE restaurant_sales_db;

CREATE VIEW tot_revenue AS 
SELECT
    SUM(Quantity*Price) AS revenue
FROM sales_table;


/* Revenue by Payment Method */
USE restaurant_sales_db;

CREATE VIEW payment_method AS 
SELECT
    `Payment Method`,
    SUM(Quantity*Price) AS method_revenue
FROM sales_table
GROUP BY `Payment Method`;