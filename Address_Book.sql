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
Select COUNT(City) as City from Address_Book ;
Select COUNT(State) as State from Address_Book ;

--UC8 --> Ability to retrieve entries sorted alphabetically by Person’s name 
Select * from Address_Book order by First_Name Asc;

--UC9 --> Ability to identify each Address Book with name and Type. - Here the type could Family, Friends, Profession, etc
--- Alter Address Book to add name and type

Alter table  Address_Book add Type varchar(20);

Update Address_Book set Type = 'Family' where First_Name='Chetan';
Update Address_Book set Type = 'Friend' where Last_Name='Apte';
Update Address_Book set Type='Family' where Last_Name='Magdum';


--UC10 --> Ability to get number of contact persons i.e. count by type
Select COUNT(Type) as Family_Members from Address_Book where Type = 'Family' group by Type;

Select Count(Type) as Friend from Address_Book where Type = 'Friend' group by Type;


