-------------------------------------------------------
-- KPI analysis.sql
-- KPI Metrics for ER Wait Time Project
-------------------------------------------------------

-- Overall patient statistics

SELECT
    COUNT(*)                               AS TotalPatients,
    Round(AVG(CAST([Patient_Waittime] AS FLOAT)),2) AS AvgWaitMinutes,
    MIN([Patient_Waittime])                AS MinWaitMinutes,
    MAX([Patient_Waittime])                AS MaxWaitMinutes,
    Round(AVG(CAST([Patient_Age] AS FLOAT)),2)      AS AvgAge,
    Round(AVG(CAST([Patient_Satisfaction_Score] AS FLOAT)),2) AS AvgSatisfaction
FROM [Hospital ER_DATA];
GO


