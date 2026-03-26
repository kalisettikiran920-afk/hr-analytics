/*
=============================================================
Ranking Analysis | HR Analytics Project
=============================================================

Description:
    This script ranks employees, departments, and roles based on
    key business metrics such as salary, experience, and performance.

    It helps answer:
        - Which employees earn the highest salaries?
        - Which departments have the highest average salary?
        - Which roles have top performance ratings?
        - Who are the top performers in the organization?

Usage:
    Run during analysis phase to identify top/bottom performers
    and high-value segments.

Notes:
    Ranking functions like RANK(), DENSE_RANK(), and ROW_NUMBER()
    are used for ordering and comparison.
=============================================================
*/

--------------------------------------------------------------
-- 1. Top 10 Highest Paid Employees
--------------------------------------------------------------
SELECT TOP 10
    employee_id,
    name,
    department,
    job_title,
    salary
FROM dbo.employee_analytics
ORDER BY salary DESC;

--------------------------------------------------------------
-- 2. Rank Employees by Salary
--------------------------------------------------------------
SELECT
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 3. Top 10 Employees by Experience
--------------------------------------------------------------
SELECT TOP 10
    employee_id,
    name,
    experience_years
FROM dbo.employee_analytics
ORDER BY experience_years DESC;

--------------------------------------------------------------
-- 4. Rank Employees by Performance Rating
--------------------------------------------------------------
SELECT
    employee_id,
    name,
    performance_rating,
    DENSE_RANK() OVER (ORDER BY performance_rating DESC) AS performance_rank
FROM dbo.employee_analytics;

--------------------------------------------------------------
-- 5. Department Ranking by Average Salary
--------------------------------------------------------------
SELECT
    department,
    AVG(salary) AS avg_salary,
    RANK() OVER (ORDER BY AVG(salary) DESC) AS dept_salary_rank
FROM dbo.employee_analytics
GROUP BY department;

--------------------------------------------------------------
-- 6. Job Title Ranking by Average Performance
--------------------------------------------------------------
SELECT
    job_title,
    AVG(performance_rating) AS avg_performance,
    RANK() OVER (ORDER BY AVG(performance_rating) DESC) AS job_performance_rank
FROM dbo.employee_analytics
GROUP BY job_title;

--------------------------------------------------------------
-- 7. Top Departments by Attrition Count
--------------------------------------------------------------
SELECT
    department,
    SUM(attrition) AS attrition_count,
    RANK() OVER (ORDER BY SUM(attrition) DESC) AS attrition_rank
FROM dbo.employee_analytics
GROUP BY department;