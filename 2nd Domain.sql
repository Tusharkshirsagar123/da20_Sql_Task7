-- 1. Domain for positive salary
CREATE DOMAIN salary_type AS numeric(10)
CHECK (VALUE >= 0);

-- 2. Domain for employee code: e.g., 'EMP123'
CREATE DOMAIN emp_code_type AS text
CHECK (VALUE ~ '^[A-Z]{3}[0-9]{3}$');

-- 3. Domain for gender with limited values
CREATE DOMAIN gender_type AS text
CHECK (VALUE IN ('male', 'female', 'others'));

---Create Table
CREATE TABLE employee_details1 (
    emp_id SERIAL PRIMARY KEY,
    emp_code emp_code_type UNIQUE,
    emp_name TEXT NOT NULL,
    gender gender_type,
    salary salary_type
);
----------

 INSERT INTO employee_details1 (emp_code, emp_name, gender, salary) 
VALUES 
('EMP101', 'Nisha Patel', 'female', 58000.00),
('EMP102', 'Siddharth Rao', 'male', 62000.50),
('EMP103', 'Pooja Nair', 'female', 49000.00);

------------
-- Create domain for bonus
CREATE DOMAIN bonus_type AS numeric
CHECK (VALUE >= 0 AND VALUE <= 100000);

-- Add new column using the domain with default value
ALTER TABLE employee_details1
ADD COLUMN bonus bonus_type DEFAULT 0;

SELECT * FROM employee_details1;


