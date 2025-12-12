-- Advanced_query.sql
-----------------------------------------------------
-- These query does analysis of waittime data based on gender and satisfaction
-- Project: ER Wait Time Analysis (Catalonia)
-- Author: Sachin Acharya
-----------------------------------------------------

-- Race + Gender Wait Time Matrix

SELECT
    [Patient_Race],
    [Patient_Gender],
    ROUND(AVG(CAST([Patient_Waittime] AS FLOAT)), 2) AS AvgWait
FROM [Hospital ER_Data]
GROUP BY [Patient_Race], [Patient_Gender]
ORDER BY AvgWait DESC;
go

-- 2. Wait Time vs Satisfaction

SELECT
    CASE
        WHEN [Patient_Waittime] <= 15 THEN '0-15 min'
        WHEN [Patient_Waittime] <= 30 THEN '16-30 min'
        WHEN [Patient_Waittime] <= 45 THEN '31-45 min'
        WHEN [Patient_Waittime] <= 60 THEN '46-60 min'
        ELSE '60+'
    END AS WaitTime,
    COUNT(*) AS TotalPatients,
    ROUND(AVG(CAST([Patient_Satisfaction_Score] AS FLOAT)), 2) AS AvgSatisfaction
FROM [Hospital ER_Data]
GROUP BY CASE
        WHEN [Patient_Waittime] <= 15 THEN '0-15 min'
        WHEN [Patient_Waittime] <= 30 THEN '16-30 min'
        WHEN [Patient_Waittime] <= 45 THEN '31-45 min'
        WHEN [Patient_Waittime] <= 60 THEN '46-60 min'
        ELSE '60+'
    END
ORDER BY MIN([Patient_Waittime]);
GO