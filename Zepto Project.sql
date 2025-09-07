drop table if exists zepto;

CREATE TABLE ZEPTO(
suk_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPerecent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weighInGms INTEGER,
OutOfStock BOOLEAN,
quantity INTEGER);

 SELECT * FROM ZEPTO;

 SELECT COUNT(*) FROM ZEPTO;

 --Null values

 SELECT * FROM zepto
 WHERE name is NULL 
 OR
 category is NULL 
 OR
 mrp is NULL 
 OR
 discountperecent is NULL 
 OR
 discountedSellingPrice is NULL 
 OR
 weighingms is NULL 
 OR
 availablequantity is NULL 
 OR
  outOfstock is NULL 
 OR
 quantity is NULL;


 --difference product categories
 SELECT DISTINCT category
 FROM zepto
 ORDER BY category;

 --product in stock vs out of stock
 SELECT OutOfStock, COUNT(suk_id)
 FROM zepto
 GROUP BY OutOfStock;

 --product names present multiple times
 SELECT name, COUNT(suk_id) as "Number of SKU"
 FROM zepto
 GROUP BY name
 HAVING count(suk_id) > 1
 ORDER BY count(suk_id) DESC;


 --data cleaning
 -- prodct with price = 0
 SELECT * FROM zepto
 WHERE mrp = 0 or discountedsellingprice = 0;

 DELETE FROM zepto
 	WHERE mrp = 0;


	 --convert paise to rupees
	 UPDATE zepto
	 SET mrp = mrp/100.0,
	 discountedsellingprice = discountedsellingprice/100.0;

	 SELECT mrp, discountedsellingprice FROM zepto

--DATA ANALYSIS--


--Q1 Find the top 10 best value product based on the discount percentage.
-- Q2 what are the Products with high MRP but Out of Stock
-- Q3 Calculate Estimated revenue for Each Category
-- Q4 Find all the products ehre Mrp is greater than 500 and Discount is less than 10%
-- Q5 Identify the top 5 categories offering the hightest average discount percentage,
--Q6 Find the price per gram for products above 100g and sort by best value.
--q7 Group the products into Categories like low, medium, Bulk.


--Q1 Find the top 10 best value product based on the discount percentage.
SELECT DISTINCT name, mrp, discountperecent
FROM zepto
ORDER BY discountperecent DESC
LIMIT 10;

--Q2 what are the Products with high MRP but Out of Stock

SELECT DISTINCT name, mrp
FROM zepto
WHERE OutOfStock = TRUE and mrp > 300
ORDER BY mrp Desc;

-- Q3 Calculate Estimated revenue for Each Category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto 
GROUP BY category
ORDER BY total_revenue;

-- Q4 Find all the products where Mrp is greater than 500 and Discount is less than 10%
SELECT DISTINCT name, mrp, discountperecent
FROM zepto
WHERE mrp>500 AND discountperecent < 10
ORDER BY mrp DESC, discountperecent DESC;

-- Q5 Identify the top 5 categories offering the hightest average discount percentage,
select category, 
AVG(dis)




 