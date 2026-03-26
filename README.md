# 📊 HR Analytics — End-to-End Data Analytics Project

> **A complete data analytics pipeline that uncovers workforce trends, attrition drivers, and compensation insights — from raw data to an interactive Power BI dashboard.**

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Business Problem Statement](#-business-problem-statement)
- [Dataset Description](#-dataset-description)
- [Tools & Technologies](#-tools--technologies)
- [Project Workflow](#-project-workflow)
- [Repository Structure](#-repository-structure)
- [Dashboard Overview](#-dashboard-overview)
- [Key Insights](#-key-insights)
- [Business Recommendations](#-business-recommendations)
- [Conclusion](#-conclusion)

---

## 🔍 Project Overview

This end-to-end HR Analytics project analyzes a large-scale workforce dataset of **2 million employees** across multiple departments, countries, and job roles. The goal is to transform raw HR data into meaningful business insights that can support better people decisions.

The project covers the full analytics workflow:
- Data cleaning and feature engineering in **Python**
- Exploratory and advanced analysis in **SQL Server**
- Interactive reporting in **Power BI**

---

## 💼 Business Problem Statement

HR teams in large organizations face a persistent challenge: high employee attrition, unclear compensation structures, and limited visibility into workforce performance. Without data-driven insights, strategic decisions around hiring, retention, and compensation rely on guesswork.

This project addresses the following business questions:

- What is the overall attrition rate, and which departments are most affected?
- How do salary bands and experience levels relate to employee attrition?
- What trends exist in hiring and workforce growth over time?
- Which employee segments are underperforming or at risk of leaving?
- How is the workforce distributed across departments, roles, and geographies?

---

## 📁 Dataset Description

**Source:** [Kaggle — HR Data MNC by Rohit Grewal](https://www.kaggle.com/datasets/rohitgrewal/hr-data-mnc)

| Column | Description |
|---|---|
| `employee_id` | Unique employee identifier |
| `name` | Full name of the employee |
| `department` | Department the employee belongs to |
| `job_title` | Role/designation of the employee |
| `hire_date` | Date the employee was hired |
| `performance_rating` | Performance score (1–5 scale) |
| `experience_years` | Total years of professional experience |
| `status` | Employment status: Active / Resigned / Terminated / Retired |
| `work_mode` | Mode of work: Remote / On-site |
| `salary` | Annual salary in INR |
| `city` | City of employment |
| `country` | Country of employment |
| `experience_level` | Engineered: Junior / Mid / Senior / Expert |
| `salary_band` | Engineered: Low / Medium / High / Very High |
| `attrition` | Engineered: 1 = Left, 0 = Active |

**Dataset Size:** ~2 million employee records

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|---|---|
| **Python (pandas)** | Data cleaning, transformation, feature engineering, and SQL Server loading |
| **SQL Server (T-SQL)** | Exploratory analysis, aggregation, window functions, KPI calculations |
| **Power BI** | Interactive dashboard and data visualization |
| **Other Tools** | *draw.io* for project workflow and data model diagrams, *chatGPT* and *Microsoft Word* for documentation, *gamma.ai* for making presentation |

---

## 🔄 Project Workflow

### Step 1 — Data Ingestion (Python)
- Loaded the raw CSV dataset using `pandas`
- Inspected data types, missing values, and duplicates
- Standardized column names to `snake_case`

### Step 2 — Data Cleaning (Python)
- Removed unnecessary columns
- Converted `hire_date` from string to datetime
- Split `location` into separate `city` and `country` columns
- Validated `employee_id` format and stripped prefixes

### Step 3 — Feature Engineering (Python)
- Created `experience_level` using `pd.cut()` on `experience_years`
  - Junior (0–2 yrs) | Mid (2–5 yrs) | Senior (5–10 yrs) | Expert (10–20 yrs)
- Created `salary_band` using `pd.qcut()` into 4 quartile-based bands
- Created `attrition` binary flag: `1` = Left, `0` = Active

### Step 4 — Data Loading (Python → SQL Server)
- Connected to SQL Server via `SQLAlchemy` + `pyodbc`
- Loaded the cleaned DataFrame into the `employee_analytics` staging table
- Used chunked loading (`chunksize=50000`) for performance

### Step 5 — SQL Exploration & Analysis
Ran 10 structured SQL scripts covering:
- Dimension exploration (departments, roles, locations, statuses)
- Date range and hiring trend analysis
- Core metrics (salary, performance, attrition)
- Ranking, segmentation, and part-to-whole analysis
- Cumulative growth and performance breakdowns

### Step 6 — Power BI Dashboard
- Connected Power BI to SQL Server
- Built interactive dashboard with slicers and dynamic KPIs
- Designed two views: **Dashboard** (charts) and **Table** (detail drill-down)

---

## 📁 Repository Structure

```
hr-analytics/
│
├── 📂 python/
│   └── hr_python_notebook.ipynb          # Full Python data pipeline
│
├── 📂 sql/
│   ├── 00_init_database.sql              # Database and table setup
│   ├── 01_dimensions_exploration.sql     # Categorical field exploration
│   ├── 02_date_range_exploration.sql     # Hire date range analysis
│   ├── 03_measures_exploration.sql       # Core KPIs and metric summary
│   ├── 04_magnitude_analysis.sql         # Employee counts and salary totals
│   ├── 05_ranking_analysis.sql           # Top/bottom employee and dept rankings
│   ├── 06_change_over_time_analysis.sql  # Yearly and monthly trends
│   ├── 07_cumulative_analysis.sql        # Running totals and cumulative growth
│   ├── 08_performance_analysis.sql       # Performance by dept, role, experience
│   ├── 09_data_segmentation.sql          # Cross-dimensional segment analysis
│   └── 10_part_to_whole_analysis.sql     # Percentage share by category
│
├── 📂 dashboard/
│   ├── hr_analytics_dashboard.png        # Dashboard view screenshot
│   └── hr_analytics_table.png           # Table view screenshot
│
├── 📂 design/
│   ├── hr_analytics_project_flow.drawio  # End-to-end project workflow diagram
│   └── Planned_data_model.drawio        # Data model / schema diagram
│
└── README.md                             # Project documentation (this file)
```

---

## 📊 Dashboard Overview

The Power BI dashboard has two views:

### Dashboard View
![HR Analytics Dashboard](dashboard/hr_analytics_dashboard.png)

**Top KPI Cards:**
| KPI | Value |
|---|---|
| Total Employees | 2.00M |
| Active Employees | 1.40M |
| Attrition Rate | 29.92% |
| Average Salary | ₹896.89K |

**Visuals included:**
- **Attrition by Department** — Horizontal bar chart showing IT leads with 180K attritions
- **Active Employees by Experience Level** — Senior level has the highest active count (477K)
- **Top 5 Countries by Active Employees** — Congo and Korea top the list (~11.5K each)
- **Monthly Attrition Trend** — Line chart across all months; relatively stable between 46K–51K
- **Attrition by Work Mode** — Donut chart showing 60% On-site vs 40% Remote attrition
- **Attrition by Experience Level** — Senior employees have the highest attrition count (204K)

### Table View
![HR Analytics Table](dashboard/hr_analytics_table.png)

- Employee-level detail table with ID, Name, Department, Job Title, Country, City, Experience Level, and Status
- Filterable by Department, Work Mode, Country, Experience Level, and Salary Band

---

## 💡 Key Insights

1. **High overall attrition** — Nearly 1 in 3 employees (29.92%) has left the organization, indicating a significant retention challenge.

2. **IT department drives the most attrition** — With 180K attritions, IT is the most affected department, followed by Sales (120K) and Operations (89K).

3. **Senior employees leave the most** — Despite being the most active segment, Senior-level employees also account for the highest attrition count (204K), suggesting mid-career talent loss.

4. **On-site attrition is higher than remote** — 59.95% of attritions come from on-site employees, while remote workers account for 40.05%.

5. **Attrition is consistent across months** — Monthly attrition ranges narrowly between 46K–51K, suggesting the issue is systemic rather than seasonal.

6. **Junior employees are underrepresented in active workforce** — Despite being the next largest group, Expert-level employees are few (112K active), suggesting promotion or retention issues at the top.

7. **Global workforce** — Employees are distributed across a large number of countries, with Congo and Korea having the highest active headcount.

---

## ✅ Business Recommendations

1. **Prioritize retention in the IT and Sales departments** — These two departments alone account for 300K attritions. Conduct stay interviews and build career development programs targeted at these teams.

2. **Address mid-to-senior attrition** — Senior employees are leaving at the highest rate. Review compensation benchmarks, growth paths, and workload for this segment.

3. **Evaluate on-site work policies** — Higher attrition among on-site employees may point to work-life balance issues. Consider hybrid work options where feasible.

4. **Investigate attrition causes systematically** — Since attrition is steady across all months, this is a structural issue. Exit survey analysis and manager effectiveness reviews are recommended.

5. **Focus on salary equity** — Use salary band analysis to identify departments where compensation may be misaligned with market expectations, especially in high-attrition segments.

6. **Develop expert talent pipeline** — With only 112K Expert-level active employees, the organization may face knowledge gaps. Internal mentorship and upskilling programs can help grow this segment.

---

## 📝 Conclusion

This HR Analytics project demonstrates how raw employee data can be transformed into actionable business intelligence using an end-to-end analytics pipeline. By combining Python for data preparation, SQL for structured analysis, and Power BI for visualization, the project delivers a clear picture of workforce health, attrition patterns, and compensation dynamics.

The insights generated can directly support HR leadership and business stakeholders in making better decisions around talent retention, compensation planning, and workforce strategy.

---

## 👤 Author

**Kiran Kalisetti**  
Data Analyst  

---

*Built with Python · SQL Server · Power BI*
# hr-analytics
End-to-end HR Analytics project using SQL, Python, and Power BI.  Includes data cleaning, analysis, KPI tracking, and interactive dashboard for attrition insights.
