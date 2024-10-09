
--  Project Bike Store Data Analysis -- Dashboard For Ececutive Team -- using SQL, EXCEL and TABLEAU  

USE Bike_Store;

SELECT TOP 50*
FROM production.products;

/*Extracting Data As Table for Analysis And Dashboard From Database for Executive Team
After Query Data As Table Data Will be Imported to Excel and Tableau  */

SELECT
		ord.order_id,
		CONCAT(cus.first_name,' ',cus.last_name) AS Customer_Name,
		cus.city,
		cus.state,
		ord.order_date,
		SUM(ite.quantity) AS Quantity,
		SUM(ite.Quantity * ite.list_price) AS Revenue,
		pro.product_name,
		bra.brand_name,
		cat.category_name,
		sto.store_name,
		CONCAT(sta.first_name,' ',sta.last_name) AS Sales_Rep
FROM sales.orders  AS ord
	JOIN sales.customers  AS cus
	ON ord.customer_id = cus.customer_id
	JOIN sales.order_items AS ite
	ON ord.order_id = ite.order_id
	JOIN production.products AS pro
	ON pro.product_id = ite.product_id
	JOIN production.categories AS cat
	ON cat.category_id = pro.category_id
	JOIN sales.stores sto
	ON ord.store_id = sto.store_id
	JOIN sales.staffs AS sta
	ON ord.staff_id = sta.staff_id
	JOIN production.brands bra
	ON bra.brand_id = pro.brand_id
GROUP BY 
		ord.order_id,
		CONCAT(cus.first_name,' ',cus.last_name),
		cus.city,
		cus.state,
		ord.order_date,
		pro.product_name,
		bra.brand_name,
		cat.category_name,
		sto.store_name,
		CONCAT(sta.first_name,' ',sta.last_name);
		
--------------------------------------------------------------------------------------------