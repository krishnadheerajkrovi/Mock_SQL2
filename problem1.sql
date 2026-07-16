"""
1. We need to report the customer ids from the Customer table that bought all the products in the Product table.
2. So we first check the distinct products bought by each customer
3. We filter out the customers who dont have the count same as number of unique products
"""

with cte as 
(select customer_id , count(distinct product_key) 'num' 
    from Customer 
    group by customer_id
    having num = (select count(*) from Product)
)
select cte.customer_id from cte;