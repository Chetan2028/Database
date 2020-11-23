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


--UC11--
/*-----------------------------CREATE EMPLOYEE TABLE--------------------------*/
create table Employee
(
Employee_Id int identity(1,1) not null,
Emp_Name varchar(25) not null,
Start_Date date not null,
Gender varchar(10) not null,
Emp_Address varchar(100) not null,
Dept_no int not null,
Phone_Number varchar(10) not null,
PRIMARY KEY (Employee_Id),
FOREIGN KEY (Dept_no) REFERENCES Department(Dept_no)
);


/*----------------------TO INSERT THE VALUES----------------------*/
insert into Employee values
('Bill','2018-01-03','M', 'Brooklyn', 1,'692587412'),
('Terissa','2019-11-13','F', 'Manhattan', 2,'1236547890'),
('Charlie','2020-05-21','M', 'New Jersey', 3,'8523697410');

/*------------------------TO RETIREVE THE DATA-------------------------------*/
Select * from Employee

/*------------------------------CREATE DEPARTMENT TABLE---------------------------*/
create table Department
(
Dept_no int  not null,
Dept_name varchar(30) not null,
Dept_location varchar(50) not null,
PRIMARY KEY (Dept_no)
);


/*---------------------------RETIREVE THE DATA------------------------*/
select * from Department

/*---------------------------INSERT THE VALUES----------------------*/
insert into Department values
(1,'Delivery','Manhattan'),
(2,'Sales','Boston'),
(3,'HR','Illinois');

/*---------------------CREATE SALARY TABLE----------------------*/
create table Salary(
Salary_id int identity(1,1) not null,
Employee_Id int not null,
Basic_pay money not null,
Deductions money not null,
Taxable_pay money not null,
Income_tax money not null,
Net_pay money not null,
PRIMARY KEY (Salary_id),
FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);


select * from Salary


insert into Salary values
(1,15800.00, 100.00, 400.00, 300.00,15500.00),
(2,11240.00, 400.00, 500.00, 300.00,14500.00),
(3,4800.00, 400.00, 300.00, 300.00,13500.00);




--UC12 Ensure all retrieve queries done on UC4, UC5 and UC7

/*UC4 Retrieve all records for employee*/
select emp.Employee_Id, emp.Emp_Name, emp.Start_Date, emp.Gender, emp.Emp_Address, emp.Phone_Number,
dept.Dept_no, dept.Dept_name,dept.Dept_location,
sal.Salary_id, sal.Basic_pay, sal.Deductions, sal.Taxable_pay, sal.Income_tax, sal.Net_pay
from Employee emp, Department dept, Salary sal
where emp.Dept_no = dept.Dept_no and  sal.Employee_Id = emp.Employee_Id;

/* UC5 Retrieving all the records from the Salary table for Bill*/
select emp.Employee_Id, emp.Emp_Name, emp.Start_Date, emp.Gender, emp.Emp_Name, emp.Phone_Number,
sal.Salary_id, sal.Basic_pay, sal.Deductions, sal.Taxable_pay, sal.Income_tax, sal.Net_pay
from Employee emp, Salary sal
where emp.Employee_Id = sal.Employee_Id and emp.Emp_Name = 'Bill';

--UC6 Retrieving all the records 
select * from Employee emp, Department dept, Salary sal
where emp.Dept_no = dept.Dept_no and sal.Employee_Id = emp.Employee_Id and 
 emp.start_date between CAST('05-12-2018' as date) and SYSDATETIME()

/*UC7--> aggregate functions */
SELECT Sum(Net_pay) as Sum_Salary
FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id
WHERE Gender='M' GROUP BY Gender;

SELECT Avg(Net_pay) as Avg_Salary
FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id
WHERE Gender='M' GROUP BY Gender;

SELECT Min(Net_pay) as Min_Salary
FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id
WHERE Gender='M' GROUP BY Gender;

SELECT Max(Net_pay) as Max_Salary
FROM Salary INNER JOIN Employee 
ON Salary.Employee_Id=Employee.Employee_Id
WHERE Gender='M' GROUP BY Gender;

