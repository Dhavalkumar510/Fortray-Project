SELECT
    Region,
    AVG(Price_Variance_Percent) AS Avg_Price_Variance_Percent,
    RANK() OVER (
        ORDER BY AVG(Price_Variance_Percent) DESC
    ) AS Hotspot_Rank
	
FROM Housing_Transactions
GROUP BY Region;
