/*
=============================================================
Initialize Database Environment | HR Analytics Project
=============================================================

Description:
    This script initializes the database environment for the
    HR Analytics project.

    It performs the following actions:
        1. Creates the 'hr_analytics' database (if not exists)
        2. Switches context to the target database
        3. Creates the staging table 'employee_analytics'

Usage:
    Execute this script before loading data from Python.

Notes:
    - 'employee_analytics' acts as a staging/source table
    - Data will later be transformed for analysis
=============================================================
*/

--------------------------------------------------------------
-- Step 1: Create database if it does not exist
--------------------------------------------------------------
IF DB_ID('hr_analytics') IS NULL
BEGIN
    CREATE DATABASE hr_analytics;
END
GO

--------------------------------------------------------------
-- Step 2: Switch to target database
--------------------------------------------------------------
USE hr_analytics;
GO

--------------------------------------------------------------
-- Step 3: Create staging table for HR dataset
--------------------------------------------------------------
IF OBJECT_ID('dbo.employee_analytics', 'U') IS NULL
BEGIN

CREATE TABLE dbo.employee_analytics (

    employee_id INT PRIMARY KEY,     -- Unique identifier

    name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),

    hire_date DATE,                  -- Used for time-based analysis

    performance_rating INT,
    experience_years INT,

    status VARCHAR(30),              -- Active / Resigned / Terminated / Retired
    work_mode VARCHAR(30),           -- Remote / On-site 

    salary INT,

    city VARCHAR(150),
    country VARCHAR(150),

    -- Feature engineered columns (from Python)
    experience_level VARCHAR(30),
    salary_band VARCHAR(30),
    attrition INT                   -- 1 = Left, 0 = Active

);

END