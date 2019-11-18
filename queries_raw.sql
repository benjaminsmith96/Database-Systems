#Games that cost more than the average game price.
SELECT *
FROM games 
WHERE Game_ID IN (SELECT Game_ID
                  FROM games 
                  WHERE Price > (SELECT AVG(Price) 
								 FROM games));

#Customers that have bought 5, 10 or 15 games (to provide a loyalty reward).
SELECT customers.Customer_ID, COUNT(sales.Sale_ID)+sales.Quantity-1 AS Number_Of_Purchases 
FROM (sales INNER JOIN customers ON sales.Customer_ID=customers.Customer_ID) 
GROUP BY Customer_ID 
HAVING Number_Of_Purchases = 5 
	OR Number_Of_Purchases = 10 
	OR Number_Of_Purchases = 15;

#Games that have sold more than the average game.
SET @avg_units_sold = (SELECT AVG(a.rcount) FROM (SELECT COUNT(Sale_ID)+Quantity-1 as rcount FROM sales) a LIMIT 1);
SELECT games.Game_ID, COUNT(sales.Sale_ID)+sales.Quantity-1 AS Units_Sold 
FROM (sales INNER JOIN games ON sales.Game_ID=games.Game_ID) 
GROUP BY Game_ID 
HAVING Units_Sold > @avg_units_sold;