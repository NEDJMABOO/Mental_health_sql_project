select *
from portfolioproject.dbo.[Student Mental health]

--#drop_column
--ALTER TABLE portfolioproject.dbo.[Student Mental health]
--DROP COLUMN Timestamp;

--#update
UPDATE portfolioproject.dbo.[Student Mental health]
SET [Your current year of Study] = LOWER([Your current year of Study]);

select *
from portfolioproject.dbo.[Student Mental health]

-- Count for Female
SELECT COUNT(*) AS FemaleCount
FROM portfolioproject.dbo.[Student Mental health]
WHERE [Choose your gender] = 'Female';

-- Count for Male
SELECT COUNT(*) AS MaleCount
FROM portfolioproject.dbo.[Student Mental health]
WHERE [Choose your gender] = 'Male';

--Query for Average Age
SELECT CAST(AVG(CAST(Age AS FLOAT)) AS INT) AS AverageAge
FROM portfolioproject.dbo.[Student Mental health];

--Grouped Queries by Course and Year of Study
SELECT 
    [What is your course?] AS Course,
    COUNT(*) AS TotalStudents
FROM [portfolioproject].[dbo].[Student Mental health]
GROUP BY [What is your course?]
ORDER BY TotalStudents DESC;


SELECT 
    [Your current year of Study] AS YearOfStudy,
    COUNT(*) AS TotalStudents
FROM [portfolioproject].[dbo].[Student Mental health]
GROUP BY [Your current year of Study]
ORDER BY YearOfStudy;


--Queries for Mental Health Statistics
SELECT 
    COUNT(CASE WHEN [Do you have Depression?] = 'Yes' THEN 1 END) AS TotalWithDepression,
    COUNT(CASE WHEN [Do you have Anxiety?] = 'Yes' THEN 1 END) AS TotalWithAnxiety,
    COUNT(CASE WHEN [Do you have Panic attack?] = 'Yes' THEN 1 END) AS TotalWithPanicAttack,
    COUNT(CASE WHEN [Did you seek any specialist for a treatment?] = 'Yes' THEN 1 END) AS TotalSoughtTreatment
FROM [portfolioproject].[dbo].[Student Mental health];

SELECT 
    COUNT(CASE WHEN [Do you have Depression?] = 'Yes' THEN 1 END) AS TotalWithDepression,
    COUNT(CASE WHEN [Do you have Anxiety?] = 'Yes' THEN 1 END) AS TotalWithAnxiety,
    COUNT(CASE WHEN [Do you have Panic attack?] = 'Yes' THEN 1 END) AS TotalWithPanicAttack,
    COUNT(CASE WHEN [Did you seek any specialist for a treatment?] = 'Yes' THEN 1 END) AS TotalSoughtTreatment,
    COUNT(*) AS TotalStudents,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Depression?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithDepression,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Anxiety?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithAnxiety,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Panic attack?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithPanicAttack,
    ROUND(CAST(COUNT(CASE WHEN [Did you seek any specialist for a treatment?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentSoughtTreatment
FROM [portfolioproject].[dbo].[Student Mental health];

--Query for Mental Health Statistics Ordered by Gender:

SELECT 
    [Choose your gender] AS Gender,
    COUNT(CASE WHEN [Do you have Depression?] = 'Yes' THEN 1 END) AS TotalWithDepression,
    COUNT(CASE WHEN [Do you have Anxiety?] = 'Yes' THEN 1 END) AS TotalWithAnxiety,
    COUNT(CASE WHEN [Do you have Panic attack?] = 'Yes' THEN 1 END) AS TotalWithPanicAttack,
    COUNT(CASE WHEN [Did you seek any specialist for a treatment?] = 'Yes' THEN 1 END) AS TotalSoughtTreatment,
    COUNT(*) AS TotalStudents,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Depression?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithDepression,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Anxiety?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithAnxiety,
    ROUND(CAST(COUNT(CASE WHEN [Do you have Panic attack?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentWithPanicAttack,
    ROUND(CAST(COUNT(CASE WHEN [Did you seek any specialist for a treatment?] = 'Yes' THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS PercentSoughtTreatment
FROM [portfolioproject].[dbo].[Student Mental health]
GROUP BY [Choose your gender]
ORDER BY [Choose your gender];
