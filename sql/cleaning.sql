-- cleaning.sql
-----------------------------------------------------
-- CLEANING: Fix incorrect datatype definitions
-- Project: ER Wait Time Analysis (Catalonia)
-- Author: Sachin Acharya
-----------------------------------------------------

-- Inspect data
select * from [Hospital ER_Data]
go

-- Fix numeric fields

ALTER TABLE [Hospital ER_DATA]
ALTER COLUMN [Patient_Satisfaction_Score] FLOAT;
go

Alter table [Hospital ER_DATA]
ALTER COLUMN [Patient_Waittime] INT;
go

-- Fix boolean field

ALTER TABLE [Hospital ER_DATA]
ALTER COLUMN Patient_Admission_Flag BIT;
go

ALTER TABLE [Hospital ER_Data]
ADD CONSTRAINT CHK_Patient_Admission_Flag CHECK (Patient_Admission_Flag IN (0,1));
GO

-- Fix date fields
-----------------------------------------------------

/* UPDATE [Hospital ER_Data]
SET AdmissionDateTime Datetime

SELECT [Patient_Admission_Date], AdmissionDateTime
FROM [Hospital ER_Data]
ORDER BY AdmissionDateTime;

ALTER TABLE [Hospital ER_Data]
DROP COLUMN [Patient_Admission_Date];  // executed earlier */

-- removing patients_cm column as it is not used and just a case management flag

Alter table [Hospital ER_DATA]
drop column [Patients_CM];
go

--renaming the value from none to unknown for making more meaningful

UPDATE [Hospital ER_Data]
SET Department_Referral = 'Unknown'
WHERE Department_Referral = 'None';

--inspect data 

select * from [Hospital ER_Data]
go