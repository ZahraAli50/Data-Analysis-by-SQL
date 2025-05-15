create database task3;
use task3;
select * from online_retail;
drop table online_retail_ii;

-- ------------------Sales and Revenue Insights-----------------------------
-- TOTAL REVENUE
select sum(Quantity * UnitPrice) as total_revenue from online_retail;

--  Top 5 Products that generated the most revenue
select Description, Quantity * UnitPrice as Revenue from online_retail
order by Revenue desc limit 5;

-- Top Selling Products by Quantity
select Description from online_retail
order by Quantity desc ;

-- average revenue per invoice
select avg(Quantity * UnitPrice) as average_revenue, InVoiceNo from online_retail
group by InVoiceNo;

-- -------------------------Customer Insights--------------------------------

-- top 10 customers by total spend
select sum(Quantity * UnitPrice)as revenue, CustomerID from online_retail
group by CustomerID 
order by revenue desc limit 10; 

-- Customers who made the most purchases and their unique CustomerIDs
select count(CustomerID) as Purchases, CustomerID from online_retail
group by CustomerID
order by Purchases desc;

-- Customers who ordered less than 5 times
select count(CustomerID) as Purchases, CustomerID from online_retail
group by CustomerID
having Purchases<5
order by Purchases desc;

-- -------------------GEOGRAPHICAL ANALYSIS-------------------------------
-- Country that generated the most revenue
select Country, sum(Quantity * UnitPrice) as Revenue from online_retail
group by Country
order by Revenue desc limit 1;

-- Unique customers per country
select count(CustomerID)as Total_Customers, Country from online_retail
group by Country;

-- Popular Products in each Country
select sum(Quantity * UnitPrice) as total_revenue, Description, Country
 from online_retail
group by Country, Description
order by Country, total_revenue desc ;
