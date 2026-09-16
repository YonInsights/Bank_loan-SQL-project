# 🏦 Bank Loan Analytics & Credit Risk (SQL Project)
### Relational Database Analysis, Portfolio Performance & Risk Modeling

[![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=postgresql&logoColor=white)](#technologies-used)
[![Database](https://img.shields.io/badge/RDBMS-SQL%20Server%20%7C%20MySQL%20%7C%20PostgreSQL-orange?style=for-the-badge)](#technologies-used)
[![Scale](https://img.shields.io/badge/Dataset-38%2C577%20Rows-green?style=for-the-badge)](#dataset-overview)

---

## 📌 Project Overview
This project delivers an end-to-end SQL analytics pipeline evaluating retail banking loan performance, borrower risk profiles, and capital recovery. Using a dataset of **38,577 loan records across 24 attributes**, the queries derive executive-level Key Performance Indicators (KPIs), track Month-to-Date (MTD) vs. Prior-Month-to-Date (PMTD) growth, and categorize credit risk exposure into Good vs. Bad loans.

---

## 🎯 Business Problem Statement
Financial institutions must monitor lending portfolio health to prevent capital erosion and optimize interest yields. Key business questions addressed:
1. **Portfolio Health:** What percentage of disbursed capital is performing vs. non-performing (charged-off/default)?
2. **Temporal Trends:** How are loan applications and funded amounts trending month-over-month?
3. **Risk Stratification:** What borrower attributes (Debt-to-Income ratio, employment tenure, home ownership, loan purpose) correlate with higher charge-off rates?
4. **Geographic Distribution:** Which states exhibit the highest default risks and capital utilization?

---

## 📊 Dataset Overview
* **Scale:** 38,577 rows × 24 columns.
* **Key Dimensions:** `id`, `loan_amount`, `funded_amount`, `total_payment`, `issue_date`, `int_rate`, `dti` (Debt-to-Income), `loan_status`, `grade`, `sub_grade`, `emp_length`, `home_ownership`, `purpose`, `address_state`.

---

## 🛠️ Technologies Used
* **SQL Dialect:** T-SQL (Microsoft SQL Server) / ANSI SQL (MySQL, PostgreSQL compatible).
* **Techniques:** Aggregations (`COUNT`, `SUM`, `AVG`), Date Functions (`MONTH`, `YEAR`, Date Parting), Window Functions, Conditional Logic (`CASE WHEN`), Grouping & Ordering.

---

## 📈 Key Metric Formulations & Findings

### 1. Overall Portfolio Performance KPIs
* **Total Loan Applications:** 38,577
* **Total Funded Capital:** \$435.75M+
* **Total Cash Recovered:** \$473.07M+
* **Average Interest Rate:** Evaluated continuously across issuance months.
* **Average Debt-to-Income (DTI):** Monitored to assess consumer leverage ratios.

### 2. Good Loan vs. Bad Loan Segmentation
The portfolio is classified based on `loan_status`:
* **Good Loans:** Includes `Fully Paid` and `Current`.
  * Queries compute Good Loan Application %, Total Good Funded Amount, and Total Cash Received.
* **Bad Loans (Non-Performing):** Includes `Charged Off`.
  * Tracks default frequency, capital write-offs, and net loss margins.

### 3. Dimensional Risk Analysis
The SQL scripts decompose risk across:
* **Monthly Issuance Trends:** Tracks seasonal spikes in borrowing.
* **Regional Breakdown (`address_state`):** Identifies geographic lending density and state-by-state default variance.
* **Loan Term Evaluation:** 36-month vs. 60-month performance comparison.
* **Loan Purpose:** Debt consolidation, credit card payoff, small business, home improvement.

---

## 🗂️ Project Structure

```
Bank_loan-SQL-project/
├── Bank_loan.sql      # Production SQL script containing all KPI and analytical queries
└── README.md          # Comprehensive project documentation
```

---

## 🚀 How to Run the Queries

1. **Database Setup:**
   * Create a database in your preferred RDBMS (SQL Server, MySQL, or PostgreSQL):
     ```sql
     CREATE DATABASE BankLoanDB;
     ```
2. **Import Data:**
   * Import the financial loan records into a table named `Bank_loan_data`.
3. **Execute Analysis:**
   * Open and execute `Bank_loan.sql` sequentially to generate the KPI summary tables and dimensional reports.

---

## 👨‍💻 Author

**Yonatan Abrham**  
*Highway Design Engineer & Applied Data Scientist*  
* Founder & Developer of [Infradigital CAD](https://www.infradigitalcad.com/)
* LinkedIn: [linkedin.com/in/yonatan-abrham1](https://www.linkedin.com/in/yonatan-abrham1/)
* GitHub: [github.com/YonInsights](https://github.com/YonInsights)
* Email: [email2yonatan@gmail.com](mailto:email2yonatan@gmail.com)
