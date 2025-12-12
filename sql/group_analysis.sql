-- group_analysis.sql
-----------------------------------------------------
-- Here we will analyze the wait time data by categorizing them in different groups.
-- Project: ER Wait Time Analysis (Catalonia)
-- Author: Sachin Acharya
-----------------------------------------------------

-- 1) Department-wise visit & wait analysis

SELECT
    [Department_Referral] AS Department,
    count(*) as TotalPatientVisits,
    Round(avg(cast([Patient_Waittime] as float)),2) as AvgWaittime
FROM [Hospital ER_DATA]
GROUP BY [Department_Referral]
order by TotalPatientVisits desc;
go

-- 2) Hour-of-day visit & wait analysis

select 
    FORMAT(AdmissionDateTime, 'HH:00') as HoursOfDay,
    Count(*) as TotalPatientVisits,
    round(avg(cast([Patient_Waittime] as float)),2) as AvgWaittime
from [Hospital ER_Data]
Group by FORMAT(AdmissionDateTime, 'HH:00')
order by HoursOfDay;
go

-- 3) Age-group visit & wait analysis

SELECT
    CASE
        WHEN [Patient_Age] < 18 THEN '0-17'
        WHEN [Patient_Age] BETWEEN 18 AND 34 THEN '18-34'
        WHEN [Patient_Age] BETWEEN 35 AND 49 THEN '35-49'
        WHEN [Patient_Age] BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS AgeGroup,
    COUNT(*) AS TotalPatients,
    ROUND(AVG(CAST([Patient_Waittime] AS FLOAT)), 2) AS AvgWaitMinutes
FROM [Hospital ER_Data]
GROUP BY CASE
        WHEN [Patient_Age] < 18 THEN '0-17'
        WHEN [Patient_Age] BETWEEN 18 AND 34 THEN '18-34'
        WHEN [Patient_Age] BETWEEN 35 AND 49 THEN '35-49'
        WHEN [Patient_Age] BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END
ORDER BY MIN([Patient_Age]);
go

--Gender and waittime analysis

SELECT
    [Patient_Gender] AS Gender,
    COUNT(*) AS TotalPatients,
    ROUND(AVG(CAST([Patient_Waittime] AS FLOAT)), 2) AS AvgWaitMinutes
FROM [Hospital ER_DATA]
GROUP BY [Patient_Gender];
go

-- waitime comparison with race-only

SELECT
    [Patient_Race] AS Race,
    COUNT(*) AS TotalPatients,
    ROUND(AVG(CAST([Patient_Waittime] AS FLOAT)), 2) AS AvgWaitMinutes
FROM [Hospital ER_DATA]
GROUP BY [Patient_Race]
ORDER BY AvgWaitMinutes DESC;
GO


-- Waittime vs Admission Rate

SELECT
    Patient_Admission_Flag,
    COUNT(*) AS TotalPatients,
    ROUND(AVG(CAST([Patient_Waittime] AS FLOAT)), 2) AS AvgWaitMinutes
FROM [Hospital ER_Data]
GROUP BY Patient_Admission_Flag;
go

