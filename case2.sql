CREATE DATABASE kms_db;

--product category had the highest sales
SELECT 
    [Product_Category], 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;

--The Top 3 and Bottom 3 regions in terms of sales

-- Top 3 Regions by Sales
SELECT TOP 3 
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC;

-- Bottom 3 Regions by Sales

SELECT TOP 3 
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
GROUP BY 
    Region
ORDER BY 
    Total_Sales ASC;


---The total sales of appliances in Ontario?
SELECT 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
WHERE 
    [Product_Sub_Category] = 'Appliances'
    AND Province = 'Ontario';

--4. Advise for increase the revenue from the bottom 10 customers
SELECT TOP 10 
    [Customer_Name], 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales ASC;


--The most shipping cost using which shipping method
SELECT 
    [Ship_Mode], 
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    [ KMS_Orders]
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

--The most valuable customers, and what products or services do they typically purchase
SELECT TOP 10 
    [Customer_Name], 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(*) AS Number_of_Orders
FROM 
    [ KMS_Orders]
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;

--Which small business customer had the highest sales
SELECT TOP 1 
    [Customer_Name], 
    SUM(Sales) AS Total_Sales
FROM 
    [ KMS_Orders]
WHERE 
    [Customer_Segment] = 'Small Business'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Sales DESC;

--The Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1 
    [Customer_Name], 
    COUNT(DISTINCT [Order_ID]) AS Total_Orders
FROM 
    [ KMS_Orders]
WHERE 
    [Customer_Segment] = 'Corporate'
    AND [Order_Date] BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Orders DESC;

--The consumer customer was the most profitable one
SELECT TOP 1 
    [Customer_Name], 
    SUM(Profit) AS Total_Profit
FROM 
    [ KMS_Orders]
WHERE 
    [Customer_Segment] = 'Consumer'
GROUP BY 
    [Customer_Name]
ORDER BY 
    Total_Profit DESC;

--The customer returned items, and what segment do they belong to
SELECT TOP 10 *
FROM [ KMS_Orders]
WHERE Profit < 0 OR Sales = 0;

--




select * from [ KMS_Orders];
