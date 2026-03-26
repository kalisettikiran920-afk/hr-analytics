/*
=============================================================
Date Range Exploration | HR Analytics Project
=============================================================

Description:
    This script analyzes the date range of employee hiring data.

    It helps answer:
        - What is the earliest hire date?
        - What is the latest hire date?
        - What is the total time span of the dataset?

Usage:
    Run during the exploratory data analysis (EDA) phase
    to understand time coverage before trend analysis.

Notes:
    This step is important for time-based analysis such as:
        - Hiring trends
        - Attrition trends
        - Monthly/Yearly aggregations
=============================================================
*/

--------------------------------------------------------------
-- 1. Find Minimum and Maximum Hire Date
--------------------------------------------------------------
SELECT 
    MIN(hire_date) AS min_hire_date,
    MAX(hire_date) AS max_hire_date
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 2. Calculate Total Date Range (in Days)
--------------------------------------------------------------
SELECT 
    DATEDIFF(DAY, MIN(hire_date), MAX(hire_date)) AS total_days
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 3. Calculate Total Date Range (in Years)
--------------------------------------------------------------
SELECT 
    DATEDIFF(YEAR, MIN(hire_date), MAX(hire_date)) AS total_years
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 4. Hiring Distribution by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS employee_count
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 5. Hiring Distribution by Year and Month
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    COUNT(*) AS employee_count
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date), MONTH(hire_date)
ORDER BY hire_year, hire_month;