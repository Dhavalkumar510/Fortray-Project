CREATE VIEW Regional_Price_Trends AS
SELECT
    Region,
    Transaction_Date,
    Sold_Price,
	
    AVG(Sold_Price) OVER (
        PARTITION BY Region
        ORDER BY Transaction_Date
        ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
    ) AS Rolling_30Day_Avg
	
FROM Housing_Transactions_Master;