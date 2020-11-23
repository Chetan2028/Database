--UC1 --> Create database AddressBook_Service
create database AddressBook_Service;

use AddressBook_Service;

--UC2 --> Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes

create table Address_Book
(
	First_Name varchar(20),
	Last_Name varchar(20),
	Address varchar(20),
	City varchar(15),
	State varchar(15),
	Zip int,
	Phone_Number varchar(13),
	Email varchar(20)
);

--UC3 --> Ability to insert new Contacts to Address Book
Insert into Address_Book(First_Name,Last_Name,Address,City,State,Zip,Phone_Number,Email) values
('Chetan','Malagoudar','MahanteshNagar','Belgavi','Karnataka',590016,'+918951604950','bmchetan@gmail.com'),
('Abhishek','Apte','Sondur','Bellary','Karnataka',548965,'+917412589632','abhiapte@gmail.com'),
('Iranna','Magdum','Anand Nagar','Mudalgo','Karnataka',741258,'+917412365895','imagdum@gmail.com'),
('Shiva','Reddy','Ameerpet','Hyderabad','Telangana',589647,'+916547891235','sreddy@yahoo.com')


--UC4 -->Ability to edit existing contact person using their name
update Address_Book set Last_Name='Patil' where First_Name='Chetan';

--UC5 -->Ability to delete a person using person's name
Delete from Address_Book where First_Name = 'Shiva';

--UC6 --> Ability to Retrieve Person belonging to a City or State from the Address Book
Select * from Address_Book;

--UC7 --> Ability to understand the size of address book by City and State
Select COUNT(City) as City_Count from Address_Book ;
Select COUNT(State) as State_Count from Address_Book ;

--UC8 --> Ability to retrieve entries sorted alphabetically by Person’s name 
Select * from Address_Book order by First_Name Asc;

--UC9 --> Ability to identify each Address Book with name and Type. - Here the type could Family, Friends, Profession, etc
--- Alter Address Book to add name and type

Alter table  Address_Book add AddressBook_Name varchar(20) , Type varchar(20);

Update Address_Book set Type = 'Family' , AddressBook_Name = 'JainCollege' where First_Name='Chetan';
Update Address_Book set Type = 'Friend', AddressBook_Name = 'JainCollege' where Last_Name='Apte';
Update Address_Book set Type='Family' , AddressBook_Name = 'GogteCollege' where Last_Name='Magdum';


--UC10 --> Ability to get number of contact persons i.e. count by type
Select COUNT(Type) as Family_Members from Address_Book where Type = 'Family' group by Type;

Select Count(Type) as Friend from Address_Book where Type = 'Friend' group by Type;

--UC12 --> Ability to create Normalization table for Address_Book

/*----------------------CREATE NEW ADDRESS BOOK-------------------------*/
create table New_Address_Book
(
	Id int primary key identity(1,1),
	First_Name varchar(50),
	Last_Name varchar(50),
	Address varchar(50),
	City varchar(50),
	State varchar(50),
	Zip int,
	Phone_Number varchar(50),
	Email varchar(50)
);

Insert into New_Address_Book values
('Akshay','Uppar','College Road','Belgaum','Karnataka',590016,'8792981111','akshayuppr@gmail.com'),
('Ragini','Zapate','Srinagar','Hubli','Karnataka',589632,'7412589632','raginizapate@gmail.com'),
('Vicky','karagi','Ameerpet','Hyderabad','Andhra Pradesh',456987,'8523697412','vivek@gmail.com'),
('Saayesha','Tubaki','Basweshwar Nagar','Bangalore','Karnataka',560079,'6987452315','saayesha@gmail.com')

Select * from New_Address_Book

/*------------------------CREATE ADDRESS BOOK NAME-------------------------------*/

create table Address_Book_Name
(
	Id int,
	Name varchar(30),
	Foreign Key (Id) references New_Address_Book(Id)
);

select * from Address_Book_Name;

Insert into Address_Book_Name values (1,'Amazon'),(2,'Microsoft'),(3,'Google'),(4,'Google');

/*----------------------------------CREATE ADDRESS BOOK TYPE--------------------------*/
create table Address_Book_Type
(
	Id int,
	Type varchar(50),
	Foreign Key (Id) references New_Address_book(Id),
);


Select * from Address_Book_Type

Insert into Address_Book_Type values(1,'Friend'),(2,'Friend'),(3,'Family'),(4,'Family');


