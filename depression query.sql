USE REAL2
GO

-----------------------
--EXPLORING DATASETS
-----------------------
SELECT *
FROM [adult-depression-lghc-indicator-24]
GO

EXEC sp_help '[adult-depression-lghc-indicator-24]' ;
GO

-----------------------
---CLEANING DATA
-----------------------
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'adult-depression-lghc-indicator-24';

SELECT TOP 5 *
FROM [adult-depression-lghc-indicator-24];

-------------------
--DATA EXPLORATION 
--------------------
---Trends across different year 
SELECT 
    Year,
    Frequency
FROM [adult-depression-lghc-indicator-24]
WHERE Strata = 'sex' 
ORDER BY Year;

SELECT 
    Year,
    Frequency,
	Strata_Name
FROM [adult-depression-lghc-indicator-24]
WHERE Strata = 'Education' 
ORDER BY Year;

SELECT 
    Year,
    Frequency,
	Strata_Name
FROM [adult-depression-lghc-indicator-24]
WHERE Strata = 'Age' 
ORDER BY Year;

SELECT 
    Year,
    Frequency,
	Strata_Name
FROM [adult-depression-lghc-indicator-24]
WHERE Strata = 'Income' 
ORDER BY Year;

SELECT 
    Year,
    Frequency,
	Strata_Name
FROM [adult-depression-lghc-indicator-24]
WHERE Strata = 'Race-Ethnicity' 
ORDER BY Year;



---------------------------------------
----STRATA WITH HIGHEST PERCENTILE VALUE 
----------------------------------------

SELECT 
    [Year],
    AVG([Percent]) AS AVG_PERCENT
FROM [adult-depression-lghc-indicator-24]
WHERE [Strata] = 'Age'
GROUP BY [Year]
ORDER BY [Year];

SELECT 
    [Year],
    AVG([Percent]) AS AVG_PERCENT
FROM [adult-depression-lghc-indicator-24]
WHERE [Strata] = 'Education'
GROUP BY [Year]
ORDER BY [Year];

SELECT 
    [Year],
    AVG([Percent]) AS AVG_PERCENT
FROM [adult-depression-lghc-indicator-24]
WHERE [Strata] = 'Income'
GROUP BY [Year]
ORDER BY [Year];

SELECT 
    [Year],
    AVG([Percent]) AS AVG_PERCENT
FROM [adult-depression-lghc-indicator-24]
WHERE [Strata] = 'Race-Ethnicity'
GROUP BY [Year]
ORDER BY [Year];

SELECT 
    [Year],
    [Strata],
    AVG([Percent]) AS AVG_Percentile
FROM [adult-depression-lghc-indicator-24]
WHERE [Year] = 2015
GROUP BY [Year], [Strata]
ORDER BY AVG_Percentile DESC;

SELECT 
    Strata,
    MAX([Percent]) AS Highest_Percent
FROM [adult-depression-lghc-indicator-24]
GROUP BY Strata
ORDER BY Highest_Percent DESC;

--------------------------
--LOWEST 95% CL
---------------------------

SELECT 
    LOWER_95_CL AS Lowest_CL,
    Strata,
    Year
FROM [adult-depression-lghc-indicator-24]
WHERE LOWER_95_CL = (
    SELECT MIN(LOWER_95_CL)
    FROM [adult-depression-lghc-indicator-24]
);

-----------------------
--UPPER 95% CL
------------------------
SELECT 
    LOWER_95_CL AS Highest_CL,
    Strata,
    Year
FROM [adult-depression-lghc-indicator-24]
WHERE LOWER_95_CL = (
    SELECT MAX(LOWER_95_CL)
    FROM [adult-depression-lghc-indicator-24]
);
------------------------------------
--YEAR WITH HIGHEST UPPER CL
------------------------------------
SELECT 
    Year,
    AVG(Upper_95_CL) AS AVG_UPPER,
    SUM(Upper_95_CL) AS SUM_UPPER
FROM [adult-depression-lghc-indicator-24]
GROUP BY Year
ORDER BY SUM_UPPER DESC;

--------------------------
--PERCENT VALUE OVER TIME
---------------------------
SELECT 
    Year,
    AVG([Percent]) AS Avg_Percent
FROM [adult-depression-lghc-indicator-24]
GROUP BY Year
ORDER BY Year;


---------------------------------------------
--STRATA WITH CONSISTENTLY LOW OR HIGH FREQUENCY
------------------------------------------------
SELECT 
    Strata,
    AVG(Frequency) AS Avg_Frequency,
    STDEV(Frequency) AS StdDev_Frequency
FROM [adult-depression-lghc-indicator-24]
GROUP BY Strata
ORDER BY Avg_Frequency DESC;   -- highest to lowest
---HIGH 
SELECT 
    Strata,
    AVG(Frequency) AS Avg_Frequency,
    STDEV(Frequency) AS StdDev_Frequency
FROM [adult-depression-lghc-indicator-24]
GROUP BY Strata
HAVING AVG(Frequency) > (
       SELECT AVG(Frequency) FROM [adult-depression-lghc-indicator-24]
     )
   AND STDEV(Frequency) < (
       SELECT STDEV(Frequency) FROM [adult-depression-lghc-indicator-24]
     )
ORDER BY Avg_Frequency DESC;

--LOW

SELECT 
    Strata,
    AVG(Frequency) AS Avg_Frequency,
    STDEV(Frequency) AS StdDev_Frequency
FROM [adult-depression-lghc-indicator-24]
GROUP BY Strata
HAVING AVG(Frequency) < (
       SELECT AVG(Frequency) FROM [adult-depression-lghc-indicator-24]
     )
   AND STDEV(Frequency) < (
       SELECT STDEV(Frequency) FROM [adult-depression-lghc-indicator-24]
     )
ORDER BY Avg_Frequency ASC;




