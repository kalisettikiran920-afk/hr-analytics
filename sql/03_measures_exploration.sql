/*
=============================================================
Measures Exploration | HR Analytics Project
=============================================================

Description:
    This script explores key numerical measures in the dataset
    to understand distributions and overall metrics.

    It helps answer:
        - What is the total number of employees?
        - What is the average salary?
        - What is the average experience?
        - What is the average performance rating?
        - What is the attrition rate?

Usage:
    Run during EDA to understand core metrics before deeper analysis.

Notes:
    Measures represent quantitative values used for aggregation
    and KPI calculations.
=============================================================
*/

--------------------------------------------------------------
-- 1. Total Employees
--------------------------------------------------------------
SELECT 
    COUNT(employee_id) AS total_employees
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 2. Salary Metrics
--------------------------------------------------------------
SELECT 
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(CAST(salary AS BIGINT)) AS avg_salary
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 3. Experience Metrics
--------------------------------------------------------------
SELECT 
    MIN(experience_years) AS min_experience,
    MAX(experience_years) AS max_experience,
    AVG(experience_years) AS avg_experience
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 4. Performance Rating Metrics
--------------------------------------------------------------
SELECT 
    MIN(performance_rating) AS min_rating,
    MAX(performance_rating) AS max_rating,
    AVG(performance_rating) AS avg_rating
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 5. Attrition Metrics
--------------------------------------------------------------
SELECT 
    COUNT(*) AS total_employees,
    SUM(attrition) AS total_attrition,
    ROUND(100.0 * SUM(attrition) / COUNT(*), 2) AS attrition_rate_percent
FROM dbo.employee_analytics;