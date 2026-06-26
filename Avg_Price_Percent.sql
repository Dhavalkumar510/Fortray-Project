SELECT
    Region,
    AVG(Price_Variance_Percent) AS Avg_Price_Variance_Percent
	
FROM Housing_Transactions
GROUP BY Region
ORDER BY Avg_Price_Variance_Percent DESC;
