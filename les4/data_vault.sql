create database les4;
use les4;

-- hub

create table h_Orders
(OrderID_rk BIGINT primary key,
OrderID int,
OrderDate datetime, 
RequiredDate datetime, 
Freight float, 
ShipAddress nvarchar(60),
ShipCity nvarchar(30),
ShipRegion nvarchar(30),
ShipPostalCode nvarchar(30),
ShipCountry nvarchar(20),
source_system nvarchar(20),
processed_dttm date
);


create table h_OrdersDetalies
(OrderdetID_rk BIGINT,
OrderID int,
ProductdetID_rk BIGINT,
ProductID int,
UnitPrice float,
Quantily int,
Discount float,
 source_system character varying(255),
    processed_dttm date,
    primary key (OrderdetID_rk, ProductdetID_rk)
   );
    
create table h_Products 
(ProductID_rk BIGINT PRIMARY KEY,
ProductID int,
SupplierID_rk BIGINT,
SupplierID int,
ProductName nvarchar(40),
QuantilyperUnit int,
UnitPrice float,
Discontinued int,
 source_system character varying(255),
    processed_dttm date
);

create table h_Suppliers
(SupplierID_rk BIGINT primary key,
SupplierID int,
CompanyName nvarchar(40),
ContactName nvarchar(40),
Address nvarchar(60),
City nvarchar(30),
Region nvarchar(30),
PostalCode nvarchar(30),
Country nvarchar(20),
Phone nvarchar(20)
);

-- links 



create table l_OrdersOrderDetalies
(
l_OrdersOrderDetalies_rk bigint primary key,
OrderID_rk bigint,
OrderdetID_rk BIGINT,
source_system character varying(255),
processed_dttm date,
FOREIGN KEY (OrderID_rk) REFERENCES h_Orders(OrderID_rk),
foreign key (OrderdetID_rk) REFERENCES h_OrdersDetalies(OrderdetID_rk)
);


create table l_ProductsOrderDetalies
(
l_ProductsOrDetalies_rk bigint primary key,
ProductID_rk BIGINT,
ProductdetID_rk BIGINT,
 source_system character varying(255),
processed_dttm date,
FOREIGN KEY (ProductID_rk) REFERENCES h_Products(ProductID_rk),
foreign	key (ProductdetID_rk) references h_OrdersDetalies(ProductdetID_rk)
);

create table l_SuppliersProducts
(l_SuppliersProducts_rk bigint primary key,

SupplierID_rk bigint,
ProductID_rk BIGINT,
 source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (SupplierID_rk) REFERENCES h_Suppliers(SupplierID_rk),
    FOREIGN KEY (ProductID_rk) REFERENCES h_Products(ProductID_rk)

);

-- satellite

create table s_Orders
( 
OrderID_rk BIGINT,
valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (OrderID_rk) REFERENCES h_Orders(OrderID_rk));
   
   
create table s_OrderDetalies
( 
OrderdetID_rk BIGINT,
valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (OrderdetID_rk) REFERENCES h_OrdersDetalies(OrderdetID_rk));
   
create table s_Products
( 
ProductID_rk BIGINT,
valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (ProductID_rk) REFERENCES h_Products(ProductID_rk));
    
create table s_Suppliers
( 
SupplierID_rk BIGINT,
valid_from_dttm date,
    valid_to_dttm date,
    source_system character varying(255),
    processed_dttm date,
    FOREIGN KEY (SupplierID_rk) REFERENCES h_Suppliers(SupplierID_rk));    





















