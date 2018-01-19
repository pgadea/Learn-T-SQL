

--The basic unit of a database to store data is the table

--Tables are made up of rows and columns

--Each column has a name, datatype, and a row size

--The name column_name provides the name of the column in each table

--The data type determines what type of data the column can hold

--The size determines the max length of the column in each table

USE TSQL
GO

--Create a simple table

CREATE TABLE Bridges
(BridgeID int identity (1,1) Not null Primary Key,--<< Note the identity (1,1).  This auto increments the primary key BridgeID. Cannot be blank
BridgeName varchar (50) Null, --<<Note Null.  This states that the column can contain omitted data
BridgeCity varchar (50) Null,
BridgeCountry varchar (50) Null)

select * from Bridges

--Inserting values in the newly created table.  Note multiple rows added simultaneously using the comma after each row

insert into Bridges 
Values    
('Sydney Harbour Bridge', 'Sydney', 'Australia'),
('Ponte Vecchio', 'Florence', 'Italy'),
('Brooklyn Bridge', 'New York City', 'United States'),
('Gateshead Millennium Bridge', 'Gateshead', 'England'),
('Tsing Ma Bridge', 'Hong Kong', 'China'),
('Pearl Bridge', 'Kobe-Naruto', 'Japan'),
('Hangzhou Bay Bridge', 'Zhejiang', 'China'),
('Nanpu Bridge', 'Shanghai', 'China'),
('Tower Bridge', 'London', 'England'),
('Pont du Gard Aqueduct', 'Gard', 'France'),
('Royal Gorge Bridge', 'Canon City','United States'),
('Lupu Bridge','Shanghai',' China'),
('Millau Viaduct', 'Tran Valley', 'France'),
('Vasco da Gama Bridge', 'Lisbon', 'Portugal'),
('Khaju Bridge', 'Isfahan', 'Iran'),
('The Wind and Rain Bridge', 'Sanjian County','China'),
('Sunniberg Bridge', 'Klosters', 'Switzerland'),
('Stari Most', 'Mostar', 'Bosnia and Herzegovina'),
('Széchenyi Chain Bridge', 'Budapest', 'Hungary'),
('New Brunswick Hartland Bridge', 'New Brunswick', 'Canada'),
('The Confederation Bridge', 'Prince Edward Island', 'Canada'),
('The Helix Bridge' ,'Marina Bay', 'Singapore')

select * from Bridges
