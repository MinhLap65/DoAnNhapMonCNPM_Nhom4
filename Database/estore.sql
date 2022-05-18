create database duan
go
use duan
go
create table Categories(
	Id int not null identity(1,1) primary key,
	Name nvarchar(50) not null,
	NameVN nvarchar(MAX) not null
)
create table Products(
	Id int not null identity(1,1) primary key,
	Name nvarchar(60) not null,
	UnitPrice float not null,
	Image nvarchar(50) not null,
	ProductDate date not null,
	Available bit not null,
	CategoryId int not null,
	Quantity int not null,
	Description nvarchar(MAX) ,
	Discount float not null,
	ViewCount int not null,
	Special bit not null
)
create table Users(
	Id nvarchar(20) not null primary key,
	Password nvarchar(50) not null,
	Fullname nvarchar(50) not null,
	Telephone int not null,
	Email nvarchar(50) not null,
	Photo nvarchar(50) not null,
	Activated bit not null,
	Admin bit not null
)
create table Orders(
	Id int not null identity(1,1) primary key,
	UserId nvarchar(20) not null,
	OrderDate datetime not null,
	Telephone int not null,
	Address nvarchar(60) not null,
	Amount float not null,
	Description nvarchar(1000)
)
ALTER TABLE Orders
   ADD Status int;
create table OrderDetails(
	Id int not null identity(1,1) primary key,
	OrderId int not null,
	ProductId int not null,
	UnitPrice float not null,
	Quantity int not null,
	Discount float not null

	constraint fk_order foreign key (OrderID) references Orders(Id) on delete cascade
)
--Khoa ngoai:
 ALTER TABLE Products ADD FOREIGN KEY (CategoryId) REFERENCES Categories(Id);	
  ALTER TABLE OrderDetails ADD FOREIGN KEY (ProductId) REFERENCES Products(Id);	
	ALTER TABLE Orders ADD FOREIGN KEY (UserId) REFERENCES Users(Id);
