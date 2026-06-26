CREATE VIEW Regional_Price_Trends_Optimized AS

SELECT
    t1.Region,
    t1.Transaction_Date,
    t1.Daily_Avg_Price,

    (
        SELECT AVG(t2.Daily_Avg_Price)
        FROM Daily_Regional_Summary t2
        WHERE t2.Region = t1.Region
        AND julianday(t2.Transaction_Date)
            BETWEEN julianday(t1.Transaction_Date) - 29
            AND julianday(t1.Transaction_Date)
    ) AS Rolling_30Day_Avg

FROM Daily_Regional_Summary t1;

