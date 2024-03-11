CREATE DATABASE PayXpert
ALTER DATABASE EMPLOYEEMANAGEMENT MODIFY NAME = PayXpert
CREATE TABLE Employee(
EmployeeId int identity(1,1) primary key,
FirstName varchar(20),
LastName varchar(20),
DateOfBirth date,
Gender varchar(20),
Email varchar(20),
PhoneNumber varchar(20),
Address varchar(20),
Position varchar(20),
JoiningDate date,
TerminationDate date)
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, Address, Position, JoiningDate)
VALUES ('John', 'Doe', '1990-01-01', 'Male', 'john@exam.com', '+1234567890', '123 Main St', 'Manager', '2023-01-01'),
       ('Jane', 'Smith', '1995-07-15', 'Female', 'jane@exam.com', '+9876543210', '456 Elm St', 'Developer', '2022-06-15'),
       ('Michael', 'Lee', '1985-12-24', 'Male', 'michael@exam.com', '+0123456789', '789 Oak Ave', 'Sales', '2021-05-24'),
       ('Sarah', 'Garcia', '2000-03-06', 'Female', 'sarah@exam.com', '+3210987654', '1011 Pine Blvd', 'Marketing', '2024-02-06'),
       ('David', 'Young', '1992-09-11', 'Male', 'davidg@exam.com', '+5432109876', '1234 Maple St', 'Engineer', '2023-10-11')

Drop table employee

CREATE TABLE Payroll(
PayrollId int identity(1,1) primary key,
EmployeeId int,
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId) on delete cascade,
PayPeriodStartDate date,
PayPeriodEndDate date,
BasicSalary decimal(10,2),
OvertimePay decimal(10,2),
Deductions decimal(10,2),
NetSalary decimal(10,2))


INSERT INTO Payroll (EmployeeId, PayPeriodStartDate, PayPeriodEndDate, BasicSalary, OvertimePay, Deductions)
VALUES (1, '2024-02-01', '2024-02-29', 5000.00, 100.00, 200.00),
       (2, '2024-02-01', '2024-02-29', 4500.00, 150.00, 150.00),
       (3, '2024-02-01', '2024-02-29', 6000.00, 50.00, 300.00),
       (4, '2024-02-01', '2024-02-29', 4800.00, 75.00, 250.00),
       (5, '2024-02-01', '2024-02-29', 5500.00, 125.00, 175.00);

select * from PayRoll

CREATE TABLE Tax(
 TaxID int identity(1,1) primary key,
 EmployeeID int,
 FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId) on delete cascade,
 TaxYear int,
 TaxableIncome decimal(10,2),
 TaxAmount decimal(10,2))

 INSERT INTO Tax (EmployeeID, TaxYear, TaxableIncome, TaxAmount)
VALUES (1, 2023, 50000.00, 2500.00),
       (2, 2023, 40000.00, 2000.00),
       (3, 2023, 65000.00, 3250.00),
       (4, 2023, 42000.00, 2100.00),
       (5, 2023, 58000.00, 2900.00)

CREATE TABLE FinancialRecord(
RecordID int identity(1,1) primary key,
EmployeeId int,
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId) on delete cascade,
RecordDate date,
Description varchar(20),
Amount decimal(10,2),
RecordType varchar(20))

INSERT INTO FinancialRecord (EmployeeId, RecordDate, Description, Amount, RecordType)
VALUES (1, '2024-03-05', 'Salary Payment', 5000.00, 'Income'),
       (2, '2024-03-04', 'Office Supplies', 100.00, 'Expense'),
       (3, '2024-03-03', 'Client Payment', 2000.00, 'Income'),
       (4, '2024-03-02', 'Business Travel', 500.00, 'Expense'),
       (5, '2024-03-01', 'Loan Payment', 1000.00, 'Expense')


UPDATE PAYROLL SET NETSALARY = (BASICSALARY + OVERTIMEPAY - DEDUCTIONS)
