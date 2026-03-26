/*
=============================================================
Performance Analysis | HR Analytics Project
=============================================================

Description:
    This script analyzes employee performance across different
    dimensions such as department, experience, and job role.

    It helps answer:
        - How performance varies across departments?
        - Does experience impact performance?
        - Which roles have higher performance ratings?
        - What is the distribution of performance ratings?

Usage:
    Run during analysis phase to evaluate employee productivity
    and identify high-performing segments.

Notes:
    Performance rating is assumed to be on a fixed scale (e.g., 1–5).
=============================================================
*/

--------------------------------------------------------------
-- 1. Average Performance by Department
--------------------------------------------------------------
SELECT 
    department,
    AVG(CAST(performance_rating AS FLOAT)) AS avg_performance
FROM dbo.employee_analytics
GROUP BY department
ORDER BY avg_performance DESC;

--------------------------------------------------------------
-- 2. Average Performance by Job Title
--------------------------------------------------------------
SELECT 
    job_title,
    AVG(CAST(performance_rating AS FLOAT)) AS avg_performance
FROM dbo.employee_analytics
GROUP BY job_title
ORDER BY avg_performance DESC;

--------------------------------------------------------------
-- 3. Performance by Experience Level
--------------------------------------------------------------
SELECT 
    experience_level,
    AVG(CAST(performance_rating AS FLOAT)) AS avg_performance
FROM dbo.employee_analytics
GROUP BY experience_level
ORDER BY avg_performance DESC;

--------------------------------------------------------------
-- 4. Performance Distribution
--------------------------------------------------------------
SELECT 
    performance_rating,
    COUNT(*) AS employee_count
FROM dbo.employee_analytics
GROUP BY performance_rating
ORDER BY performance_rating;

--------------------------------------------------------------
-- 5. Performance vs Attrition
--------------------------------------------------------------
SELECT 
    performance_rating,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrition_count,
    ROUND(100.0 * SUM(attrition) / COUNT(*), 2) AS attrition_rate
FROM dbo.employee_analytics
GROUP BY performance_rating
ORDER BY performance_rating;

