/*
=============================================================
Cumulative Analysis | HR Analytics Project
=============================================================

Description:
    This script analyzes cumulative trends over time to understand
    workforce growth and changes.

    It helps answer:
        - How has the workforce grown over time?
        - What is the cumulative number of hires?
        - How do trends accumulate year by year?

Usage:
    Run during analysis phase to evaluate long-term growth patterns.

Notes:
    Uses window functions to calculate running totals.
=============================================================
*/

--------------------------------------------------------------
-- 1. Cumulative Hiring by Year
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS yearly_hires,
    SUM(COUNT(*)) OVER (ORDER BY YEAR(hire_date)) AS cumulative_hires
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 2. Cumulative Hiring by Year and Month
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    COUNT(*) AS monthly_hires,
    SUM(COUNT(*)) OVER (
        ORDER BY YEAR(hire_date), MONTH(hire_date)
    ) AS cumulative_hires
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date), MONTH(hire_date)
ORDER BY hire_year, hire_month;

--------------------------------------------------------------
-- 3. Cumulative Attrition Count
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    SUM(attrition) AS yearly_attrition,
    SUM(SUM(attrition)) OVER (ORDER BY YEAR(hire_date)) AS cumulative_attrition
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

--------------------------------------------------------------
-- 4. Cumulative Salary (Total Compensation Growth)
--------------------------------------------------------------
SELECT 
    YEAR(hire_date) AS hire_year,
    SUM(CAST(salary AS BIGINT)) AS yearly_salary,
    SUM(SUM(CAST(salary AS BIGINT))) OVER (ORDER BY YEAR(hire_date)) AS cumulative_salary
FROM dbo.employee_analytics
GROUP BY YEAR(hire_date)
ORDER BY hire_year;