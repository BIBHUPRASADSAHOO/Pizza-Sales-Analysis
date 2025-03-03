use [Pizza Db]
select * from pizza_sales; 
-- Total Revenue
select SUM(total_price) as Total_revenue from pizza_sales;
-- Avg Order sales
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

-- total pizzas sold
select sum(quantity) from pizza_sales

-- Total Order
select count(distinct(order_id))as Total_Order from pizza_sales

-- Average pizaas per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

-- Daily Trend for Total Orders
/*select DATENAME(DW,order_date) as Order_day,COUNT(distinct(order_id))
as total_orders 
from pizza_sales group by DATENAME(DW,order_date)*/

-- Monthly Trend for Orders

select DATENAME(MONTH,order_date) as Month_name ,
count(distinct order_id) as total_order 
from pizza_sales group by datename(month,order_date) 

---% of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--% of Sales by Pizza Size

/*SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size */

-- Total Pizzas Sold by Pizza Category
select pizza_category,sum(quantity) as total_quantity_sold
from pizza_sales 
group by pizza_category order by total_quantity_sold desc 

-- top 5 pizzas by revenue
select top 5 pizza_name,SUM(total_price) as Total_revenue
from pizza_sales group by pizza_name order by Total_revenue Desc

-- bottom 5 pizzas by revenue
select top 5 pizza_name,SUM(total_price)as Total_revenue
from pizza_sales GROUP BY pizza_name ORDER BY Total_revenue ASC

-- Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name order by Total_pizza_sold desc

-- buttom 5 pizzas by quantity
select top 5 pizza_name,sum(quantity) as Total_pizza_sold
from pizza_sales
group by pizza_name order by Total_pizza_sold asc

-- Top 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct(order_id)) as Total_order from 
pizza_sales group by pizza_name order by Total_order desc

-- Bottom 5 pizzas by total order
select top 5 pizza_name, count(distinct(order_id)) as Total_order from 
pizza_sales group by pizza_name order by Total_order asc

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC







