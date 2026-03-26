/*
=============================================================
Dimension Exploration | HR Analytics Project
=============================================================

Description:
    This script explores key categorical (dimension) fields
    in the HR dataset to understand structure and unique values.

    It helps answer:
        - What departments exist?
        - What job roles are present?
        - What locations are covered?
        - What work modes and statuses exist?

Usage:
    Run this script during the exploratory data analysis (EDA) phase.

Notes:
    Dimension exploration is important before aggregation
    and KPI analysis.
=============================================================
*/

--------------------------------------------------------------
-- 1. Explore Departments
--------------------------------------------------------------
SELECT DISTINCT 
    department
FROM dbo.employee_analytics
ORDER BY department;

--------------------------------------------------------------
-- 2. Explore Job Titles
--------------------------------------------------------------
SELECT DISTINCT 
    job_title
FROM dbo.employee_analytics
ORDER BY job_title;

-- or

SELECT
    department,
    STRING_AGG(job_title, ',') AS jobs
FROM (
    SELECT DISTINCT
        department,
        job_title
    FROM dbo.employee_analytics
)t
GROUP BY department

--------------------------------------------------------------
-- 3. Explore Locations (City & Country)
--------------------------------------------------------------
SELECT DISTINCT 
    city, 
    country
FROM dbo.employee_analytics
ORDER BY country, city;

--------------------------------------------------------------
-- 4. Explore Work Modes
--------------------------------------------------------------
SELECT DISTINCT 
    work_mode
FROM dbo.employee_analytics
ORDER BY work_mode;

--------------------------------------------------------------
-- 5. Explore Employee Status
--------------------------------------------------------------
SELECT DISTINCT 
    status
FROM dbo.employee_analytics
ORDER BY status;

--------------------------------------------------------------
-- 6. Explore Experience Levels (Engineered Feature)
--------------------------------------------------------------
SELECT DISTINCT 
    experience_level
FROM dbo.employee_analytics
ORDER BY experience_level;

--------------------------------------------------------------
-- 7. Explore Salary Bands (Engineered Feature)
--------------------------------------------------------------
SELECT DISTINCT 
    salary_band
FROM dbo.employee_analytics
ORDER BY salary_band;