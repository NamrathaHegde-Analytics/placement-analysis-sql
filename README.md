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

## Query Results

### Placement Rate by Department
<img width="570" height="422" alt="WhatsApp Image 2026-04-16 at 3 24 55 PM" src="https://github.com/user-attachments/assets/11aed535-5358-4408-9b14-33b6a89eea12" />

### Average Salary by Department
<img width="573" height="352" alt="WhatsApp Image 2026-04-16 at 3 27 55 PM" src="https://github.com/user-attachments/assets/ff9e630e-2231-4877-b9aa-6fc092c38de3" />

### On-campus vs Off-campus
<img width="359" height="237" alt="WhatsApp Image 2026-04-16 at 3 29 24 PM" src="https://github.com/user-attachments/assets/92a96147-16cb-46f3-a2ef-fb25d1ef6798" />

### Top Hiring Companies
<img width="570" height="437" alt="WhatsApp Image 2026-04-16 at 3 31 09 PM" src="https://github.com/user-attachments/assets/785e6dc8-d866-4b80-b1d4-eb91d1829f25" />

### High Performers Unplaced
<img width="577" height="307" alt="WhatsApp Image 2026-04-16 at 3 32 56 PM" src="https://github.com/user-attachments/assets/f6c79818-903e-4242-8594-c6c7e61e1312" />

## Author
Namratha Hegde - https://www.linkedin.com/in/namratha-hegde/
