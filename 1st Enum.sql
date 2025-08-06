
-- Step 1: Create a custom domain for email if not already created
CREATE DOMAIN email_address_domain AS varchar
CHECK (VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- Step 2: Create the ENUM type
CREATE TYPE studentTable_status AS ENUM ('pass', 'fail', 'grace');

-- Step 3: Create the student table
CREATE TABLE studentTable (
    id serial PRIMARY KEY,
    name varchar,
    mob varchar,
    age int,
    college_id int,
    email email_address_domain,
    status student_status  -- you can define it here directly or add it later with ALTER
);

-- Step 4: Insert data
INSERT INTO studentTable (name, mob, age, college_id, email)
VALUES ('stud1', '123123', 23, 1, 'stud@gmail.com');

-- Step 5: (If status column not added in table creation, use this)
ALTER TABLE studentTable ADD COLUMN status studentTable_status;

-- Step 6: Update the status
UPDATE studentTable SET status = 'pass';

-- Step 7: View data
SELECT * FROM studentTable;
