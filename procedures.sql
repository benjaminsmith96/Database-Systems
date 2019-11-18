DELIMITER $$
CREATE PROCEDURE CountSalesByGameID(
 IN gameID INT,
 OUT unitsSold INT)
BEGIN
 SELECT count(Quantity)
 INTO unitsSold
 FROM sales
 WHERE Game_ID = gameID;
END$$
DELIMITER ;