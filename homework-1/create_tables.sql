-- SQL-команды для создания таблиц
CREATE TABLE employees
(
    employee_id int PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	title varchar(50),
	birth_date date,
	notes text
);

CREATE TABLE customers
(
	customer_id char(5) UNIQUE,
	company_name varchar(50),
	contact_name varchar(50)	
)

CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id char(5) REFERENCES customers(customer_id) NOT NULL,
	employee_id int REFERENCES employees(employee_id) UNIQUE,
	order_date date,
	ship_city char(30)
)
