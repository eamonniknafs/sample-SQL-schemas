CREATE DATABASE IF NOT EXISTS AirportBase;
USE AirportBase;

DROP TABLE IF EXISTS Expert_On;
DROP TABLE IF EXISTS Test_Event;

DROP TABLE IF EXISTS Airplanes;
DROP TABLE IF EXISTS Models;
DROP TABLE IF EXISTS Technicians;
DROP TABLE IF EXISTS Controllers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Tests;

CREATE TABLE Models (
    model_number VARCHAR(20),
    capacity INT,
    weight INT,
    CONSTRAINT pk_model_number PRIMARY KEY (model_number)
);

CREATE TABLE Airplanes (
    reg_number VARCHAR(5),
    model_number VARCHAR(20),
    CONSTRAINT fk_model_number FOREIGN KEY (model_number) REFERENCES Models(model_number),
    CONSTRAINT pk_reg_number PRIMARY KEY (reg_number)
);

CREATE TABLE Employees (
    ssn VARCHAR(9),
    name VARCHAR(30),
    address VARCHAR(80),
    phone VARCHAR(11),
    CONSTRAINT pk_ssn PRIMARY KEY (ssn)
);

CREATE TABLE Technicians (
    ssn VARCHAR(9),
    salary INT,
    CONSTRAINT fk_technician_ssn FOREIGN KEY (ssn) REFERENCES Employees(ssn)
);

CREATE TABLE Controllers (
    ssn VARCHAR(9),
    last_exam DATE,
    CONSTRAINT fk_controller_ssn FOREIGN KEY (ssn) REFERENCES Employees(ssn)
);

CREATE TABLE Expert_On (
    ssn VARCHAR(9),
    reg_number VARCHAR(5),
    CONSTRAINT fk_expert_ssn FOREIGN KEY (ssn) REFERENCES Technicians(ssn),
    CONSTRAINT fk_expert_reg_number FOREIGN KEY (reg_number) REFERENCES Airplanes(reg_number)
);

CREATE TABLE Tests (
    test_number INT,
    name VARCHAR(30),
    max_score INT,
    CONSTRAINT pk_test_number PRIMARY KEY (test_number)
);

CREATE TABLE Test_Event (
    test_number INT,
    reg_number VARCHAR(5),
    ssn VARCHAR(9),
    date DATE,
    number_hours INT,
    score INT,
    CONSTRAINT fk_event_test_number FOREIGN KEY (test_number) REFERENCES Tests(test_number),
    CONSTRAINT fk_event_reg_number FOREIGN KEY (reg_number) REFERENCES Airplanes(reg_number),
    CONSTRAINT fk_event_ssn FOREIGN KEY (ssn) REFERENCES Technicians(ssn)
);