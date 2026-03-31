---This is just to check if the table is loaded correctly and i am able to read it.
SELECT * 
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
Limit 10;

----------------------------------------------------------------------------
---Query 1: Check the date range 
SELECT MIN(transaction_date) AS start_date 
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
---They started collecting data on 2023-01-01


---Query 2: when last did they collect data?
SELECT MAX(transaction_date) AS latest_date
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
---The data was last collected on 2023-06-30

--------------------------------------------------------------------------------
---Query 3: Check the store locations and the names of the store Located
SELECT DISTINCT store_location
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
----There are 3 store locations and they are: Lower Manhattan, Hell's Kitchen & Astoria

SELECT COUNT(DISTINCT store_id) as Number_of_stores
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
-----There are 3 stores

----------------------------------------------------------------------------------------
---Query 4: Check the products sold across all stores
SELECT DISTINCT product_category
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
---The products sold across all stores: Tea, Coffee, Drinking Chocolate, Bakery, Flavours, Loose Tea, Coddee beans, Packaged Chocolate & Branded.


SELECT DISTINCT product_detail
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
-----It gives me the distinct names that I gave


SELECT DISTINCT product_type
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


SELECT DISTINCT product_type,
                product_category AS category,
                product_detail AS product_name
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;

------------------------------------------------------------------------------------------------------

---Query 5: Select specific columns
SELECT transaction_id,
       product_category,
       unit_price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
LIMIT 20;

---------------------------------------------------------------------------------------------------

---Query 6: Using a column alias
SELECT product_category AS Category,
       unit_price AS Price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
LIMIT 20;



---Query 7: Filtering using WHERE
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category = 'Coffee';


---Query 8: Filtering using WHERE and AND
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category = 'Coffee'
AND store_location = 'Lower Manhattan';


---Query 9: Filtering using WHERE and AND
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category = 'Coffee beans'
AND unit_price > 10;


---Query 10: Filtering using WHERE and OR
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category = 'Tea'
OR store_location = 'Lower Manhattan';


---Query 11: Finding the minimum unit price
SELECT MIN(unit_price) AS Min_Price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 12: Filtering using WHERE and OR 
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category = 'Coffee'
OR product_category = 'Tea';


---Query 13: Filering using WHERE and IN
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category IN ('Coffee', 'Tea', 'Bakery');


---Query 14: Filtering using WHERE and IN
SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_category IN ('Coffee', 'Tea');


---Query 15: Sorting results
SELECT product_category,
       unit_price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
ORDER BY unit_price DESC;

-----------------------------------------------------------------------------------------------------------


---Query 16: Counting total transactions
SELECT COUNT(*)
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 17: Calculate total sales
SELECT SUM(transaction_qty* unit_price) AS Total_Sales
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 18: Calculate minimum and maximum price
SELECT MIN(unit_price) AS cheapest_item,
       MAX(unit_price) AS most_expensive_item
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 19: Total sales per category
SELECT product_category,
       SUM(transaction_qty* unit_price) AS Total_Sales
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
GROUP BY product_category
ORDER BY Total_Sales DESC;


---Query 10: Sum of total revenue (Aggregation)
SELECT sum(unit_price)
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 21: Sum of total revenue AS (Aggregation)
SELECT sum(unit_price) AS total_rev
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


---Query 22: View product type (scone) and product detail (oatmeal scone)
SELECT product_type,
       product_detail
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
WHERE product_type = "Scone" and product_detail = 'Oatmeal Scone';

------------------------------------------------------------------------------------------

SELECT MIN(unit_price) AS cheapest_price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
-----The cheapest price is 0.80

SELECT MAX(unit_price) AS expensive_price
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;
-----The expensive price is 45.00

-------------------------------------------------------------------------------------------------

----Query 24: Calculate the number of IDs.

SELECT 
COUNT(*) AS number_of_rows,
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;

------------------------------------------------------------------------------------

SELECT *
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
LIMIT 10;

SELECT transaction_id,
      transaction_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      transaction_qty*unit_price AS revenue_per_tnx
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;

-----------------------------------------------------------------------------------

SELECT COUNT(*)
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`;


SELECT 
---Dates
      transaction_date AS purchase_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      Dayofmonth(transaction_date) AS day_of_month,

      CASE
            WHEN Dayname(transaction_date) IN ('Sun', 'Sat') THEN 'Weekend'
            ELSE 'Weekday'
      END AS day_classification,
      
---------date_format(transaction_time, 'HH:MM:SS') AS purchase_time,

      CASE
            WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '07:00:00' AND '11:59:59' THEN '0.1 Morning'
            WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '12:00:00' AND '16:59:59' THEN '0.2 Afteroon'
            WHEN date_format(transaction_time, 'HH:MM:SS') >= '17:00:00' THEN '0.3 Evening'
       END AS time_buckets, 

----Counnt of IDs         
      COUNT(DISTINCT transaction_id) AS Number_of_sales,
      COUNT(DISTINCT product_id) AS Number_of_products,
      COUNT(DISTINCT store_id) AS Number_of_stores,

 ----Revenue     
      SUM(transaction_qty*unit_price) AS revenue_per_day,

 ---Categorical columns
      store_location,
      product_category,
      product_detail
FROM `workspace`.`default`.`bright_coffee_shop_analysis_case_study_1`
GROUP BY purchase_date,
         Dayname(transaction_date),
         Monthname(transaction_date),
         Dayofmonth(transaction_date),
         day_classification,
         time_buckets,
         store_location,
         product_category,
         product_detail;

