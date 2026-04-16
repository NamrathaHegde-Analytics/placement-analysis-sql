# Placement Analysis using SQL

Analysed university placement data across 5 departments to identify placement rates, salary trends, and unplaced high-performers using SQL.

## Database Schema
- **departments** — dept_id, department_name, hod_name
- **students** — student_id, name, dept_id, batch_year, cgpa
- **placements** — placement_id, student_id, company, salary_lpa, offer_date, offer_type

## Business Questions Answered

1. Which department has the best placement rate?
2. Which department commands the highest average salary?
3. How do On-campus vs Off-campus offers compare?
4. Which companies hired the most students?
5. Which high-performing students (CGPA 8+) are still unplaced?

## Key Findings
- CSE leads with 100% placement rate and 12.5 LPA average salary
- Off-campus offers pay 2.5x more than on-campus (21.5 vs 8.5 LPA)
- Mechanical department has 0 placements — needs immediate attention

## Tools Used
- MySQL
- MySQL Workbench

## Author
Namratha Hegde - https://www.linkedin.com/in/namratha-hegde/
