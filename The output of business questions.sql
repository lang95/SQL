#1 Show the total revenue generated from each state in 2015. 
        -- Informu management team know which state to focus on, where marketing target to . 
        
SELECT 
    state, SUM(Price * Quantity) as Total_Revenue
FROM
    customer c
        JOIN
    orders o ON o.customerID = c.customerID
        JOIN
    orderdetails d ON o.orderID = d.OrderID
GROUP BY c.state;




# 2. What is average payment amount for our customers? 
    -- Informu could know how much does customers pay in average.
select sum(amount)/count(*) as averagePayment from payment p;

  

# 3. What is our shipping ability for µ tag in terms of day on average?  
	-- Informu wants to know how long it take from receiving the order, to ship the order from warehouse, to arrive customer's home. 

select avg(datediff(orderDate,shippedDate)) as Time_Order_to_Shipped, avg(datediff(shippedDate,deliveryDate)) as Time_Shipped_to_Delivery from orders;


# 4. How many Sales Associates does informu has? 
	-- It's HR questions. 
    select count(*) as numofsales from employee e
    where e.Jobtitle like '%Sales Associate%';
    
    
    
    
    
#5  How long the inventory will last in terms of days? 
	-- Informu management team want to know if they need to add more inventory now. It's based on the past 12 month average sales of µ tag.  
    
    select p.productID, quantityInStock/(sum(Quantity)/365) as days from orders o 
    join orderdetails d on o.orderID=d.OrderID 
    join product p on d.ProductID=p.productid 
    where orderDate>subdate(now(),interval 1 month) 
    group by productID;