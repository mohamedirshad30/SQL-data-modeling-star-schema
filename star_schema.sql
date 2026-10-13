create schema star_schema;
use star_schema;
create table dim_customer(
customer_key int primary key,
customer_id varchar(50) unique,
customer_name varchar(100),
gender varchar(20),
age_group varchar(20),
city varchar(50),
state varchar(50),
customer_segment varchar(50));
select * from dim_customer;

create table dim_product(
product_key int primary key ,
product_id varchar(50) unique,
product_name varchar(100),
brand varchar(100),
category varchar(100),
sub_categeory varchar(100),
unit varchar(20),
list_price decimal(10,2),
is_active boolean);
select * from dim_product;

create table dim_date(
date_key int primary key,
full_date date unique,
day_of_week varchar(20),
day tinyint,
week_of_year tinyint,
month tinyint,
quarter tinyint,
year smallint,
is_weekend boolean,
is_holiday boolean);
select * from dim_date;

create table dim_store(
store_key int primary key,
store_id varchar(50) unique,
store_name varchar(100),
store_type varchar(50),
city varchar(50),
state varchar(50),
region varchar(50),
country varchar(50),
opening_date date,
is_active boolean);
select * from dim_store;

create table fact_order_item (
order_item_key bigint primary key ,
customer_key int,
product_key int,
date_key int,
store_key int,
order_id bigint,
quantity int,
unit_price decimal(10,2),
discount_amount decimal(10,2),
tax_amount decimal(10,2),
shipping_amount decimal(10,2),
total_amount decimal(10,2),
foreign key (customer_key) references dim_customer(customer_key),
foreign key (product_key) references dim_product(product_key),
foreign key (date_key) references dim_date(date_key),
foreign key (store_key) references dim_store(store_key));

insert into dim_customer 
value
(1, 'code1','irshad','male','20','chennai','tamil nadu','regular'),
(2, 'code2','ram','male','25','chennai','tamil nadu','premium'),
(3, 'code3','sana','female','30','dindigul','tamil nadu','regular'),
(4, 'code4','riza','female','22','madurai','tamil nadu','premium');
select * from dim_customer;

insert into dim_product
value
(1,'1001','shirt','otto','clothing','menswear', 'pic','550.00',true),
(2,'1002','watch','titan','accessories','wrist watch','pic',3500.00,true),
(3,'1003','bag','wildcraft','accessories','travel bag', 'piece', 1000.00, TRUE),
(4,'1004','shoes','adidas','footwear','sports shoes','pic',4000.00,true);
select * from dim_product;

INSERT INTO dim_date
VALUES
(20261001, '2026-10-01', 'Thursday', 1, 40, 10, 4, 2026, FALSE, FALSE),
(20261002, '2026-10-02', 'Friday', 2, 40, 10, 4, 2026, FALSE, FALSE),
(20261003, '2026-10-03', 'Saturday', 3, 40, 10, 4, 2026, TRUE, FALSE),
(20261004, '2026-10-04', 'Sunday', 4, 40, 10, 4, 2026, TRUE, FALSE);
select * from dim_date;
 

INSERT INTO dim_store
VALUES
(1,'S001','Chennai Central','Retail','Chennai','Tamil Nadu','South','India','2020-01-15',TRUE),
(2,'S002','Madurai Mall','Retail','Madurai','Tamil Nadu','South','India','2021-03-10',TRUE),
(3,'S003','Dindigul Store','Outlet','Dindigul','Tamil Nadu','South','India','2022-05-20',TRUE),
(4,'S004','Coimbatore Hub','Retail','Coimbatore','Tamil Nadu','South','India','2019-11-05',TRUE);
select * from dim_store;

INSERT INTO fact_order_item
VALUES
(1,1,1,20261001,1,5001,2,550.00,50.00,99.00,40.00,1189.00),
(2,2,2,20261002,2,5002,1,3500.00,100.00,612.00,50.00,4062.00),
(3,3,3,20261003,3,5003,2,1000.00,0.00,360.00,75.00,2435.00),
(4,4,4,20261004,4,5004,1,4000.00,200.00,684.00,60.00,4544.00);
select * from fact_order_item;
