/*
=============================================================
Change Over Time Analysis | HR Analytics Project
=============================================================

Description:
    This script analyzes how key HR metrics change over time
    based on employee hire dates.

    It helps answer:
        - How hiring trends have evolved over time?
        - Are employee counts increasing or decreasing?
        - How attrition changes over time?
        - What are monthly/yearly workforce trends?

Usage:
    Run during analysis phase to identify trends and patterns
    over time.

Notes:
    Time-based analysis is critical for understanding business
    growth, hiring patterns, and workforce changes.
=============================================================
*/

--------------------------------------------------------------
-- 1. Hiring Trend by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS total_hires
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 2. Hiring Trend by Year and Month
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    COUNT(*) AS total_hires
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date), MONTH(hire_date)
ORDER BY hire_year, hire_month;

--------------------------------------------------------------
-- 3. Monthly Attrition Trend
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS year,
    MONTH(hire_date) AS month,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrition_count,
    ROUND(100.0 * SUM(attrition) / COUNT(*), 2) AS attrition_rate
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date), MONTH(hire_date)
ORDER BY year, month;

--------------------------------------------------------------
-- 4. Cumulative Hiring Trend (Growth Over Time)
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS yearly_hires,
    SUM(COUNT(*)) OVER (ORDER BY YEAR(hire_date)) AS cumulative_hires
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 5. Average Salary Trend by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    AVG(salary) AS avg_salary
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 6. Average Experience Trend by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    AVG(experience_years) AS avg_experience
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 7. Average Performance Rating Trend by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    AVG(performance_rating) AS avg_performance
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;