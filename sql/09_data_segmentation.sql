/*
=============================================================
Data Segmentation Analysis | HR Analytics Project
=============================================================

Description:
    This script segments employees into meaningful groups based on
    business dimensions such as department, experience level,
    salary band, and attrition.

    It helps answer:
        - How employees are distributed across segments?
        - Which segments have higher attrition?
        - How salary and experience vary across groups?
        - Which employee groups require attention?

Usage:
    Run during analysis phase to identify patterns across
    different employee segments.

Notes:
    Segmentation is critical for targeted decision-making
    and strategic planning.
=============================================================
*/

--------------------------------------------------------------
-- 1. Employee Distribution by Department and Experience Level
--------------------------------------------------------------
SELECT 
    department,
    experience_level,
    COUNT(*) AS employee_count
FROM dbo.employee_analytics
GROUP BY department, experience_level
ORDER BY department, employee_count DESC;

--------------------------------------------------------------
-- 2. Attrition by Department and Salary Band
--------------------------------------------------------------
SELECT 
    department,
    salary_band,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrition_count,
    ROUND(100.0 * SUM(attrition) / COUNT(*), 2) AS attrition_rate
FROM dbo.employee_analytics
GROUP BY department, salary_band
ORDER BY attrition_rate DESC;

--------------------------------------------------------------
-- 3. Average Salary by Experience Level and Job Title
--------------------------------------------------------------
SELECT 
    experience_level,
    job_title,
    AVG(CAST(salary AS BIGINT)) AS avg_salary
FROM dbo.employee_analytics
GROUP BY experience_level, job_title
ORDER BY avg_salary DESC;

--------------------------------------------------------------
-- 4. Performance by Department and Experience Level
--------------------------------------------------------------
SELECT 
    department,
    experience_level,
    AVG(CAST(performance_rating AS FLOAT)) AS avg_performance
FROM dbo.employee_analytics
GROUP BY department, experience_level
ORDER BY avg_performance DESC;

--------------------------------------------------------------
-- 5. Attrition by Work Mode and Department
--------------------------------------------------------------
SELECT 
    work_mode,
    department,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrition_count,
    ROUND(100.0 * SUM(attrition) / COUNT(*), 2) AS attrition_rate
FROM dbo.employee_analytics
GROUP BY work_mode, department
ORDER BY attrition_rate DESC;