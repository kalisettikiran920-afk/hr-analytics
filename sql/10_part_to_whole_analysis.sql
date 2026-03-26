/*
=============================================================
Part-to-Whole Analysis | HR Analytics Project
=============================================================

Description:
    This script analyzes how different segments contribute
    to the overall workforce.

    It helps answer:
        - What percentage of employees belong to each department?
        - How workforce is distributed across job roles?
        - What share of employees fall into each category?

Usage:
    Run during analysis phase to understand proportional
    distribution across dimensions.

Notes:
    Part-to-whole analysis is useful for understanding
    relative contribution rather than absolute values.
=============================================================
*/

--------------------------------------------------------------
-- 1. Department-wise Employee Share (%)
--------------------------------------------------------------
SELECT 
    department,
    COUNT(*) AS employee_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM dbo.employee_analytics
GROUP BY department
ORDER BY percentage_share DESC;

--------------------------------------------------------------
-- 2. Job Title-wise Employee Share (%)
--------------------------------------------------------------
SELECT 
    job_title,
    COUNT(*) AS employee_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM dbo.employee_analytics
GROUP BY job_title
ORDER BY percentage_share DESC;

--------------------------------------------------------------
-- 3. Work Mode Distribution (%)
--------------------------------------------------------------
SELECT 
    work_mode,
    COUNT(*) AS employee_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM dbo.employee_analytics
GROUP BY work_mode
ORDER BY percentage_share DESC;

--------------------------------------------------------------
-- 4. Status Distribution (%)
--------------------------------------------------------------
SELECT 
    status,
    COUNT(*) AS employee_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM dbo.employee_analytics
GROUP BY status
ORDER BY percentage_share DESC;

--------------------------------------------------------------
-- 5. Salary Band Distribution (%)
--------------------------------------------------------------
SELECT 
    salary_band,
    COUNT(*) AS employee_count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM dbo.employee_analytics
GROUP BY salary_band
ORDER BY percentage_share DESC;