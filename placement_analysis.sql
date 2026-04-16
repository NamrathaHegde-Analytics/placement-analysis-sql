-- Create Database
CREATE DATABASE placement_analysis;
USE placement_analysis;

-- create tables
-- Step 1: departments first (no dependencies)
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    hod_name VARCHAR(50)
);

-- Step 2: students second (depends on departments)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    batch_year INT,
    cgpa DECIMAL(3,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Step 3: placements last (depends on students)
CREATE TABLE placements (
    placement_id INT PRIMARY KEY,
    student_id INT,
    company VARCHAR(50),
    salary_lpa DECIMAL(5,2),
    offer_date DATE,
    offer_type VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 3. INSERT DATA
INSERT INTO departments VALUES
(1, 'CSE', 'Dr. Sharma'),
(2, 'MBA', 'Dr. Kapoor'),
(3, 'ECE', 'Dr. Mehta'),
(4, 'Mechanical', 'Dr. Das'),
(5, 'Civil', 'Dr. Nair');

INSERT INTO students VALUES
(1, 'Rohit Verma', 1, 2024, 8.5),
(2, 'Priya Singh', 1, 2024, 7.9),
(3, 'Amit Kumar', 1, 2024, 9.1),
(4, 'Sneha Rao', 1, 2024, 6.8),
(5, 'Karan Mehta', 1, 2024, 8.2),
(6, 'Ananya Das', 2, 2024, 7.5),
(7, 'Rahul Joshi', 2, 2024, 8.0),
(8, 'Pooja Nair', 2, 2024, 7.2),
(9, 'Vikram Patel', 3, 2024, 8.8),
(10, 'Neha Gupta', 3, 2024, 7.6),
(11, 'Arjun Reddy', 3, 2024, 6.9),
(12, 'Divya Iyer', 4, 2024, 7.1),
(13, 'Siddharth Roy', 4, 2024, 6.5),
(14, 'Meera Pillai', 5, 2024, 7.8),
(15, 'Suresh Babu', 5, 2024, 6.2);

INSERT INTO placements VALUES
(1, 1, 'TCS', 7.50, '2024-01-15', 'On-campus'),
(2, 2, 'Infosys', 6.50, '2024-01-20', 'On-campus'),
(3, 3, 'Google', 25.00, '2024-02-01', 'Off-campus'),
(4, 4, 'Wipro', 5.50, '2024-02-10', 'On-campus'),
(5, 5, 'Amazon', 18.00, '2024-02-15', 'Off-campus'),
(6, 6, 'Deloitte', 12.00, '2024-01-25', 'On-campus'),
(7, 7, 'KPMG', 11.50, '2024-02-05', 'On-campus'),
(8, 9, 'Samsung', 9.00, '2024-02-20', 'On-campus'),
(9, 10, 'Bosch', 8.50, '2024-03-01', 'On-campus'),
(10, 14, 'L&T', 7.00, '2024-03-10', 'On-campus');

-- 4. Query 1 - Placement Rate by Department
SELECT d.department_name,
COUNT(DISTINCT s.student_id) AS total_students,
COUNT(DISTINCT p.student_id) AS total_placed,
ROUND(COUNT(DISTINCT p.student_id) * 100.0 / 
COUNT(DISTINCT s.student_id), 2) AS placement_rate
FROM departments d
LEFT JOIN students s ON d.dept_id = s.dept_id
LEFT JOIN placements p ON s.student_id = p.student_id
GROUP BY d.department_name
ORDER BY placement_rate DESC;

-- 5. Query 2 - Average Salary by Department
SELECT d.department_name,
COALESCE(ROUND(AVG(p.salary_lpa), 2), 0) AS avg_salary
FROM departments d
LEFT JOIN students s ON d.dept_id = s.dept_id
LEFT JOIN placements p ON s.student_id = p.student_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

-- 6. Query 3 - On-campus vs Off-campus
SELECT offer_type,
COUNT(placement_id) AS total_offers,
ROUND(AVG(salary_lpa), 2) AS avg_salary
FROM placements
GROUP BY offer_type;

-- 7. Query 4 - Top Hiring Companies
SELECT company,
COUNT(placement_id) AS total_hires,
ROUND(AVG(salary_lpa), 2) AS avg_salary_offered
FROM placements
GROUP BY company
ORDER BY total_hires DESC;

-- 8. Query 5 - High Performers Unplaced
SELECT s.name, s.cgpa, d.department_name
FROM students s
LEFT JOIN placements p ON s.student_id = p.student_id
LEFT JOIN departments d ON s.dept_id = d.dept_id
WHERE p.student_id IS NULL
AND s.cgpa >= 8.0
ORDER BY s.cgpa DESC;


