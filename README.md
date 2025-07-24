# 🧠 SQL Projects Portfolio

 This repository includes hands-on SQL projects focusing on real-world data cleaning, exploratory data analysis (EDA), and insights generation using structured query techniques.

Each project demonstrates practical SQL skills such as:
- Data wrangling and standardization
- Aggregations, filtering, and joins
- Window functions and CTEs
- Business insights from raw datasets

---

##  Projects Included

### 1.  Data Cleaning Project (Raw Layoffs Dataset)

**File:** `Data Cleaning.sql`  
**Summary:**  
This project involved cleaning a raw dataset on global layoffs. The goal was to prepare the data for analysis by:
- Handling null values and standardizing text fields
- Converting date formats
- Removing duplicates
- Creating new cleaned columns and tables for downstream use

>  **Status:** Completed and cleaned data exported for use in EDA.

---

### 2.  Exploratory Data Analysis (EDA) on Layoffs

**File:** `EDA PROJECT.sql`  
**Summary:**  
Performed deep analysis on the cleaned layoffs dataset to extract insights on:
- Most affected industries and companies
- Yearly and monthly trends
- Cumulative layoffs over time
- Top 5 companies by layoffs each year

Used:
- `GROUP BY`, `SUM()`, `ORDER BY`
- `SUBSTRING()` and `YEAR()` for time analysis
- Window functions (`DENSE_RANK`, `SUM() OVER`)
- Common Table Expressions (CTEs)

>  **Status:** Completed with powerful trends and breakdowns

---

## How to Run

1. Clone this repo or download project files.
2. Open files in your SQL editor (e.g., MySQL Workbench).
3. Ensure the dataset (`raw_layoffs01`) is available in your database.
4. Run queries in sequence or by section.

---





