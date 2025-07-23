# Data Cleaning Project – Layoffs Data

This project is a hands-on data cleaning exercise where I took a messy raw dataset and transformed it into a clean, analysis-ready format using **SQL (MySQL Workbench)**.

## Project Objective

To clean and prepare raw layoff data by removing duplicates, standardizing entries, handling null values, and dropping unnecessary information — a crucial first step in any data analytics workflow.

---

## What I Did

1. **Removed Duplicates**

   * Used `CTE` (Common Table Expressions) and `ROW_NUMBER()` to identify and remove duplicate rows based on multiple columns like `company`, `industry`, `date`, etc.

2. **Standardized Text Data**

   * Applied `TRIM()` function to remove leading/trailing spaces.
   * Used `DISTINCT` and `UPDATE` statements to fix inconsistent formatting (e.g., industry names like "Crypto " to "Crypto").

3. **Handled Null & Blank Values**

   * Filtered out rows with null or blank fields using `JOIN` and `WHERE` clauses.
   * Ensured critical columns (like company name, industry, etc.) had complete data.

4. **Dropped Unnecessary Data**

   * Removed unwanted columns and rows using `ALTER TABLE` and `DROP` commands to simplify the dataset for analysis.

---

## Tools Used

* **SQL (MySQL Workbench)**
* Git & GitHub for version control

---

## Files

* `raw_layoffs.sql` – Contains the original messy data
* `README.md` – You’re reading it :)

---

## Key Takeaway

This project helped me understand how essential it is to clean and prepare data before moving into analysis or visualization. Every insight depends on clean data!

---

## What's Next?

Now that the data is cleaned, the next step would be:

* Exploratory Data Analysis (EDA)

---

