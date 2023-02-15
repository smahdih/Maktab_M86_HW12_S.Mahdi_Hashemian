/*
     Create database
*/
CREATE DATABASE store;

/*
     Create branchs table
*/
CREATE TABLE branchs (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    creation_date DATE,
    city VARCHAR(50)
);

/*
     Create offices table
*/
CREATE TABLE offices (
	id bigint PRIMARY KEY AUTO_INCREMENT,
    branch_id bigint NOT NULL,
    name VARCHAR(50) NOT NULL,
    duties TEXT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branchs(id)
);

/*
     Create employees table
*/
CREATE TABLE employees (
     id bigint PRIMARY KEY AUTO_INCREMENT,
    office_id bigint NOT NULL,
    name VARCHAR(50) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    FOREIGN KEY (office_id) REFERENCES offices(id)
);

/*
     1-1
*/
SELECT name 
FROM employees 
WHERE salary < 1000;

/*
     1-2
*/
SELECT employees.name, offices.name 
FROM employees, offices 
WHERE employees.office_id = offices.id;

/*
     1-3
*/
SELECT offices.name, AVG(employees.salary) 
FROM offices 
JOIN employees 
WHERE employees.office_id = offices.id 
GROUP BY offices.name;

/*
     1-4
*/
SELECT offices.name 
FROM branchs, offices 
WHERE branchs.id = offices.branch_id 
AND branchs.city = 'اصفهان';

/*
     1-5
*/
SELECT branchs.name, COUNT(offices.id) 
FROM branchs, offices 
WHERE branchs.id = offices.branch_id 
GROUP BY branchs.name;

/*
     1-6
*/
SELECT employees.name, branchs.name 
FROM employees 
JOIN offices 
on employees.office_id = offices.id 
JOIN branchs 
ON offices.branch_id = branchs.id;