--CREATE DATABASE Company;
--USE Company;

CREATE TABLE employees(
employee_id nvarchar(20) NOT NULL,
first_name nvarchar(20) NULL,
last_name nvarchar(20) NULL,
email nvarchar(20) NULL,
phone_number nvarchar(20) NULL,
salary int NULL,
job_id int NOT NULL,
department_id int NOT NULL,
manager_id nvarchar(20) NULL)

CREATE TABLE departments(
department_id int NOT NULL,
department_name nvarchar(20) NULL)

CREATE TABLE jobs(
job_id int NOT NULL,
job_title nvarchar(20) NULL,
min_salary int NULL,
max_salary int NULL)

ALTER TABLE employees ADD PRIMARY KEY (employee_id);
ALTER TABLE departments ADD PRIMARY KEY (department_id);
ALTER TABLE jobs ADD PRIMARY KEY (job_id);

ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);

INSERT INTO departments (department_id, department_name) VALUES (101, 'Department_A');
INSERT INTO departments (department_id, department_name) VALUES (102, 'Department_B');

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES (1, 'Executive', 2500, 3000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES (2, 'Executive Assistant', 2000, 2500);

INSERT INTO employees (employee_id, first_name , last_name, email, phone_number, salary, job_id, department_id, manager_id) VALUES ('E1001', 'Ayşe' , 'Ayaz', 'aa@mail.net', '1011', 3000, 1, 101, NULL);
INSERT INTO employees (employee_id, first_name , last_name, email, phone_number, salary, job_id, department_id, manager_id) VALUES ('E1002', 'Burak' , 'Bilir', 'bb@mail.net', '2022', 2750, 1, 102, NULL);
INSERT INTO employees (employee_id, first_name , last_name, email, phone_number, salary, job_id, department_id, manager_id) VALUES ('E1003', 'Canan' , 'Canan', 'cc@mail.net', '3033', 2500, 2, 101, 'E1001');
INSERT INTO employees (employee_id, first_name , last_name, email, phone_number, salary, job_id, department_id, manager_id) VALUES ('E1004', 'Delil' , 'Doğru', 'dd@mail.net', '4044', 2250, 2, 102, 'E1002');


-- Fetch the all data from the Jobs table.
SELECT * FROM jobs

--Fetch department_id datas from Departments table with using DISTINCT command.
SELECT DISTINCT department_id FROM departments

-- Fetch the employees and departments data who works in Department_A.
SELECT * FROM departments, employees WHERE department_name = 'Department_A' AND employees.department_id = departments.department_id

--Fetch first_name, last_name, and salary data that employee who works as a "Executive "
SELECT first_name, last_name, salary FROM employees, jobs WHERE job_title = 'Executive' AND employees.job_id = jobs.job_id

--Fetch first_name, last_name, and salary data that employee who works as a "Executive " and works in "Department_A"
SELECT first_name, last_name FROM employees, departments, jobs WHERE (department_name = 'Department_A' AND job_title = 'Executive') 
AND (employees.department_id = departments.department_id AND employees.job_id = jobs.job_id)

--Fetch first_name, last_name and salary data that who works in "Department_A" sort datas ascending by salary.
SELECT first_name, last_name, salary FROM employees, departments 
WHERE department_name = 'Department_A' AND employees.department_id = departments.department_id ORDER BY salary ASC

