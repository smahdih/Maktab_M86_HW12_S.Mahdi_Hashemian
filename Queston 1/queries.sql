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