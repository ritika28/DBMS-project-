SELECT orders.order_id, customers.customer_id, customers.customer_name, orders.total_amount
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.total_amount>1000;

SELECT p.product_name, sum(od.qty) AS total_quantity_sold
FROM orders_details od
JOIN products p ON p.product_id = od.product_id
GROUP BY p.product_id;

Select Order_ID, p.Product_Name, Qty
From Orders_Details as o
Inner Join Products as p
On o.product_id=p.product_id
Where Qty> (Select Avg(Qty) From Orders_Details);

SELECT Order_ID, COUNT(DISTINCT Product_ID) AS Distinctive_Products
FROM Orders_Details
GROUP BY Order_ID;

SELECT EXTRACT(MONTH FROM Order_Date) AS Month, 
SUM(Qty) AS Total_Products_Sold 
FROM Orders 
JOIN Orders_Details 
ON Orders.Order_ID = Orders_Details.Order_ID 
WHERE EXTRACT(YEAR FROM Order_Date) = 2023 
GROUP BY EXTRACT(MONTH FROM Order_Date) ORDER BY Month;


SELECT EXTRACT(MONTH FROM Order_Date) AS Month,
SUM(Qty) AS Total_Products_Sold
FROM Orders JOIN Orders_Details ON Orders.Order_ID = Orders_Details.Order_ID
WHERE EXTRACT(YEAR FROM Order_Date) = 2023
GROUP BY EXTRACT(MONTH FROM Order_Date)
HAVING SUM(Qty) > 2;


SELECT order_id, total_amount, 
 CASE 
  WHEN total_amount > 1000 
  THEN 'High Value' 
  ELSE 'Low Value' 
 END AS Value 
FROM Orders;


SELECT order_id, total_amount, order_value
FROM (
SELECT order_id,
total_amount,
CASE
 WHEN total_amount > 1000 THEN 'High Value'
 WHEN total_amount = 1000 THEN 'Medium Value'
 ELSE 'Low Value'
END AS order_value
FROM Orders) as sub
WHERE order_value = 'High Value';