CREATE DATABASE Employee_Details;
USE Employee_Details;

CREATE TABLE Profile_Table (
ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
Jb_Title VARCHAR(255) UNIQUE
);

CREATE TABLE Department_Table (
ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
Department_Name VARCHAR(255) UNIQUE
);

CREATE TABLE Employee_Table (
Employee_ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
First_Name VARCHAR(255),
Middle_Name VARCHAR(255),
Last_Name VARCHAR(255),
Gender VARCHAR(10),
Government_ID INT UNIQUE,
Mobile_Number VARCHAR(10) UNIQUE CHECK (Mobile_Number REGEXP '^[0-9]{10}$'),
Personal_Email VARCHAR(255) UNIQUE,
State VARCHAR(255),
Pin_Code VARCHAR(6) CHECK (Pin_Code REGEXP '^[0-9]{6}$'),
Date_of_Hire DATETIME,
Title_ID INT,
Department_ID INT,
FOREIGN KEY (Title_ID) REFERENCES Profile_Table(ID),
FOREIGN KEY (Department_ID) REFERENCES Department_Table(ID)
);

CREATE TABLE Salary_Table (
Employee_ID INT,
Fixed_Salary INT,
Variable_Salary INT,
Total_Salary INT AS (Fixed_Salary + Variable_Salary),
FOREIGN KEY (Employee_ID) REFERENCES Employee_Table(Employee_ID)
);

CREATE TABLE Leave_Table (
Leave_ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
Employee_ID INT,
Leave_Type ENUM('Casual Leave', 'Sick Leave', 'General Leave'),
Start_Date DATETIME,
End_Date DATETIME,
Status ENUM('Approved', 'Pending', 'Rejected'),
FOREIGN KEY (Employee_ID) REFERENCES Employee_Table(Employee_ID)
);

CREATE TABLE Performance_Table(
Performance_ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
Employee_ID INT,
Review_Date DATETIME,
Review_Score INT,
Comments VARCHAR(255),
FOREIGN KEY (Employee_ID) REFERENCES Employee_Table(Employee_ID)
);

CREATE TABLE Benefits_Table (
Benefit_ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
Employee_ID INT,
Benefit_Type ENUM('Yes', 'No'),
Coverage_Details ENUM('Yes', 'No'),
FOREIGN KEY (Employee_ID) REFERENCES Employee_Table(Employee_ID)
);

ALTER TABLE Employee_Table
ADD Employee_Type ENUM('Full Time', 'Freelancer', 'Trainee', 'Third Party');
