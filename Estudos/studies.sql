create table employees (
employee_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_pay DECIMAL(5,2),
hire_date DATE
);



alter table employees
add phone_number VARCHAR(15)

select * from employees

alter table employees
add phone_number VARCHAR(15)

alter table employees
RENAME COLUMN phone_number TO email;
	
alter table employees
MODIFY COLUMN email VARCHAR(15);

SELECT VERSION();
