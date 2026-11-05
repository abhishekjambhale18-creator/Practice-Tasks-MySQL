# 🏦 Bank Database – MySQL Complete Series

![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner%20to%20Advanced-blue?style=for-the-badge)

> A complete step-by-step Bank Database project in MySQL covering table design, constraints, relationships, DML, SELECT queries, SQL functions, aggregates, window functions, JOINs, subqueries, and views.

---

### 📌 Project Overview

This repository contains a full **Bank Database** built from scratch using MySQL.  
It is organized into progressive labs from basic table creation to advanced querying with joins, subqueries, and views.

---

### 🗂️ Database Tables

| Table | Description |
| --- | --- |
| `Customers` | Customer personal information |
| `Accounts` | Account details linked to customers |
| `Transactions` | Deposit / Withdraw records |
| `Branches` | Bank branch information |
| `Loans` | Loan details linked to customers |

---

### 📚 Labs Included

#### Lab 1 – Database Setup
- Create database and tables
- Basic DDL operations

**File:** `BankDatabase1.sql`

---

#### Lab 2 – Constraints
- Primary Key, Foreign Key
- Unique, Not Null, Check constraints

**File:** `BankDatabase2.sql`

---

#### Lab 3 – Relationships & EER Diagram
- Complete table relationships
- EER Diagram in MySQL Workbench

**Files:** `BankDatabase3.sql` + `BankDatabase3.png`

---

#### Lab 4 – DML Operations
- INSERT, UPDATE, DELETE
- Sample data population

**File:** `BankDatabase4.sql`

---

#### Lab 5 – SELECT Queries & Filtering
- WHERE conditions
- BETWEEN, IN, AND, OR

**File:** `BankDatabase5.sql`

---

#### Lab 6 – Advanced SELECT
- ORDER BY, DISTINCT, LIMIT, OFFSET
- LIKE, REGEXP, IS NULL
- CASE statements

**File:** `BankDatabase6.sql`

---

#### Lab 7 – SQL Functions, Aggregates & GROUP BY
- String, math, and date functions
- Aggregate functions (`SUM`, `AVG`, `MAX`, `MIN`, `COUNT`)
- `GROUP BY` and `HAVING`

**File:** `BankDatabase7.sql`

---

#### Lab 8 – Window Functions
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- `LAG()`, `LEAD()`
- `PARTITION BY` and running totals

**File:** `BankDatabase8.sql`

---

#### Lab 9 – SQL JOINs
- `INNER JOIN` between Accounts and Transactions
- `LEFT JOIN` to include accounts without transactions
- Filtered joins and `ORDER BY`

**File:** `BankDatabase9.sql`

---

#### Lab 10 – Subqueries
- Average calculation using subquery
- Filter rows above average amount/balance
- `IN` subquery for accounts with deposits
- Find account with maximum balance

**File:** `BankDatabase10.sql`

---

#### Lab 11 – SQL Views
- Create view for high balance accounts
- `CREATE OR REPLACE VIEW` with JOIN
- Query data from view with sorting

**File:** `BankDatabase11.sql`

---

### 🛠️ Skills Demonstrated

- Database & table design
- Constraints & relationships
- DML operations
- Filtering, sorting & pattern matching
- String, math & date functions
- Aggregate functions
- Window functions
- SQL JOINs (`INNER JOIN`, `LEFT JOIN`)
- Subqueries
- SQL Views (`CREATE VIEW`, `CREATE OR REPLACE VIEW`)
- EER Diagram design

---

### 📂 Project Structure

```text
Bank-Database-MySQL/
│
├── BankDatabase1.sql       # Lab 1 – Setup
├── BankDatabase2.sql       # Lab 2 – Constraints
├── BankDatabase3.sql       # Lab 3 – Relationships
├── BankDatabase3.png       # EER Diagram
├── BankDatabase4.sql       # Lab 4 – DML Operations
├── BankDatabase5.sql       # Lab 5 – SELECT Filtering
├── BankDatabase6.sql       # Lab 6 – Advanced SELECT
├── BankDatabase7.sql       # Lab 7 – Functions & Aggregates
├── BankDatabase8.sql       # Lab 8 – Window Functions
├── BankDatabase9.sql       # Lab 9 – SQL JOINs
├── BankDatabase10.sql      # Lab 10 – Subqueries
├── BankDatabase11.sql      # Lab 11 – Views
└── README.md
```

---

### 🚀 How to Run

1. Open **MySQL Workbench**
2. Run the scripts **in order** (Lab 1 → Lab 11)
3. View the EER Diagram (`BankDatabase3.png`)

---

### 🧰 Tools Used

- MySQL
- MySQL Workbench

---

### 👨‍💻 Author

**Abhishek Jambhale**  
MCA Student | Aspiring Data Analyst & Data Scientist  
📍 Pune, Maharashtra

- LinkedIn: [abhishek-jambhale](https://www.linkedin.com/in/abhishek-jambhale-4a3002442)
- Email: abhishekjambhale.18@gmail.com

---

⭐ Star this repository if you find it useful!
