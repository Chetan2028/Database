--UC1 -> Create a database Payroll_Service
create database Payroll_Service;

--To go to Payroll_Service database 
use Payroll_Service;

--UC2 --> Create a table Employee_Payroll
Create Table Employee_Payroll
(
	Id int primary key identity(1,1),
	Emp_Name varchar(20) not null,
	Emp_Salary money not null,
	Emp_Start_Date date not null,
);

--UC3 -->Insert Data into Employee_Payroll table . Inserting a single value
Insert into Employee_Payroll(Emp_Name,Emp_Salary,Emp_Start_Date) values('Chetan',3000000,'01-01-2021');

--Inserting multiple values
Insert into Employee_Payroll(Emp_Name,Emp_Salary,Emp_Start_Date)
values('Kalyan',2000000,'05-05-2021') , ('Prudhvi',350000,'02-02-2021'),('Shashidhar',798956,'05-10-2019'),('Apoorva',741258,'06-11-2018'),('Ramya',569812,'08-12-2022');

--UC4 --> Retirieve data from database
Select * from Employee_Payroll;

--UC5 --> Ability to retrieve data for a particular employee(Chetan)
Select * from Employee_Payroll where Emp_Name = 'Chetan';

--UC5 --> To get the employees between a particular date range
Select * from Employee_Payroll where Emp_Start_Date Between CAST('01-01-2018' as date) and SYSDATETIME();


--UC6 --> Ability to Add Gender column to Employee_Payroll table
Alter table Employee_Payroll Add Gender char(1) not null default 'M' ;

--Adding F values
update Employee_Payroll set Gender='F' where Emp_Name = 'Apoorva' or Emp_Name = 'Ramya';


--UC7 --> Ability to find sum, average, min, max and number of male and female employees
Select Sum(Emp_Salary) as Total_Salary from Employee_Payroll where Gender = 'M' group by Gender;
Select Max(Emp_Salary) as Maximum_Salary from Employee_Payroll where Gender = 'M' group by Gender;
Select Min(Emp_Salary) as Minimum_Salary from Employee_Payroll where Gender = 'M' group by Gender;
Select Avg(Emp_Salary) as Average_Salary from Employee_Payroll where Gender = 'M' group by Gender;
Select Count(Emp_Salary) As Salary_Count from Employee_Payroll where Gender = 'M' group by Gender;


Select Sum(Emp_Salary) as Total_Salary from Employee_Payroll where Gender = 'F' group by Gender;
Select Max(Emp_Salary)  as Maximum_Salary from Employee_Payroll where Gender = 'F' group by Gender;
Select Min(Emp_Salary) as Minimum_Salary from Employee_Payroll where Gender = 'F' group by Gender;
Select Avg(Emp_Salary) as Average_Salary from Employee_Payroll where Gender = 'F' group by Gender;
Select Count(Emp_Salary) As Salary_Count from Employee_Payroll where Gender = 'F' group by Gender;


--UC8 --> Ability to extend employee_payroll data to store employee information like employee phone, address
--and department - Ensure employee department is non nullable fields.
--- Add Default Value for address field.

Alter table Employee_Payroll add Emp_Phone_Number int ,  Emp_Address varchar(10) default 'Bangalore', Department varchar(15) not null default 'Developer';

--Entering values for Emp_Phone_Number , Emp_Address and Department
update Employee_Payroll set Emp_Phone_Number = 8951604950 , Emp_Address = 'Belgaum' where Id = 1;
update Employee_Payroll set Emp_Phone_Number = 7412589632 , Emp_Address = 'Chennai' , Department = 'Testing' where Id = 2;
update Employee_Payroll set Emp_Phone_Number = 8956231475 , Emp_Address = 'Hyderabad' , Department = 'Sales' where Id = 3;
update Employee_Payroll set Emp_Phone_Number = 9876543210 , Emp_Address = 'Kolar' , Department = 'Marketing' where Id = 4;
update Employee_Payroll set Emp_Phone_Number = 7412365895 , Emp_Address = 'Thane' , Department = 'Cloud' where Id = 5;
update Employee_Payroll set Emp_Phone_Number = 8523697415 , Emp_Address = 'Bangalore' , Department = 'Web Development' where Id = 6;

--UC9 -->Ability to extend employee_payroll tablet o have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay
Alter table Employee_Payroll add Basic_Pay money not null default 0 , Deductions money not null default 0 , Taxable_Pay money not null default 0 , Income_Tax money not null default 0 , Net_Pay money not null default 0;

--UC10 --> To make Employee Chetan as part of Cloud and Developing
update Employee_Payroll set Emp_Name = 'Chetan' , Gender = 'M' where Emp_Name = 'Apoorva';

