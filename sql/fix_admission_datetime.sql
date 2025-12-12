
--Fix for admission date time data due to wrong query

UPDATE d
SET d.AdmissionDateTime =
    TRY_CONVERT(DATETIME, s.[Patient_Admission_Date], 105)
FROM [Hospital ER_Data] AS d
JOIN HospitalER_Staging AS s
    ON d.[Patient_Id] = s.[Patient_Id];

GO

select * from [Hospital ER_Data]
go
