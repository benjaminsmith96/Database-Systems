CREATE TRIGGER `after_sales_insert_update_purchases` AFTER
INSERT ON
  `sales` FOR EACH ROW
BEGIN
    SET @customer = (SELECT Customer_ID 
                     FROM sales 
                     ORDER BY Sale_ID DESC 
                     LIMIT 1);
    SET @quantity = (SELECT Quantity 
                     FROM sales 
                     ORDER BY Sale_ID DESC 
                     LIMIT 1);
    SET @quantity = @quantity + (SELECT Purchases 
                                 FROM customers 
                                 WHERE Customer_ID = @customer);
    UPDATE `customers` 
    SET `Purchases` = @quantity 
    WHERE `customers`.`Customer_ID` = @customer;
END;

CREATE TRIGGER `after_sales_insert_update_stocks` AFTER
INSERT ON
  `sales` FOR EACH ROW
BEGIN
    SET @game = (SELECT Game_ID 
                 FROM sales 
                 ORDER BY Sale_ID DESC 
                 LIMIT 1);
    SET @quantity = (SELECT Quantity 
                     FROM sales 
                     ORDER BY Sale_ID DESC 
                     LIMIT 1);
    SET @quantity = @quantity + (SELECT Stock 
                                 FROM games 
                                 WHERE Game_ID = @game);
    UPDATE `games` 
    SET `Stock` = @quantity 
    WHERE `games`.`Game_ID` = @game;
END;