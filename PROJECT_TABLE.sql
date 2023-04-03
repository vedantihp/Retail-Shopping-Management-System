create database PROJECT;
use project;

create table Department(
dept_id	NUMERIC(4) PRIMARY KEY,
dept_name  VARCHAR(15) NOT NULL);
desc Department ;

create table Admin(
admin_id		NUMERIC(4) PRIMARY KEY,
admin_name 		VARCHAR(15) NOT NULL,
admin_phn		NUMERIC(10) NOT NULL,
dept_id	        NUMERIC(4),
foreign key (dept_id) references department(dept_id));
desc Admin ; 

create table Supplier(
sup_id		NUMERIC(4) PRIMARY KEY,
sup_name	VARCHAR(15) NOT NULL,
sup_phone	NUMERIC(10)  NOT NULL,
sup_add		VARCHAR(25) NOT NULL);
desc supplier ;


create table Product(
prod_id 	    NUMERIC(4) PRIMARY KEY,
prod_category	VARCHAR(15) NOT NULL,
prod_type	    VARCHAR(25) NOT NULL,
prod_color	    VARCHAR(25) NOT NULL,
prod_brand      VARCHAR(25) NOT NULL,
prod_gender     VARCHAR(10) NOT NULL,
prod_size       varchar(4) NOT NULL,
cost_price      NUMERIC(8) NOT NULL,
selling_price   NUMERIC(8) NOT NULL,
qty             NUMERIC(50) NOT NULL,
sup_id          NUMERIC(4) NOT NULL,
foreign key (sup_id) references Supplier (sup_id));
desc product;

create table  Customer(
cust_id		NUMERIC(4) PRIMARY KEY,
cust_name	VARCHAR(15)  NOT NULL,
cust_phone	NUMERIC(10)  NOT NULL,
cust_email  varchar(20),
cust_add	VARCHAR(25)  NOT NULL);
desc Customer ;

create table Payment(
pay_id   NUMERIC(4) PRIMARY KEY, 
pay_mode VARCHAR(10) NOT NULL,
pay_amt NUMERIC(10) NOT NULL,
pay_date date NOT NULL,
cust_id		NUMERIC(4), 
prod_id     NUMERIC(4),
foreign key(cust_id) references customer(cust_id),
foreign key(prod_id) references product(prod_id));
desc Payment ; 

create table Staff(
staff_id   NUMERIC(4) PRIMARY KEY, 
staff_name VARCHAR(15) NOT NULL,
staff_phn  NUMERIC(10) Not Null,
dept_id	   NUMERIC(4)  Not Null,
foreign key (dept_id) references department(dept_id));
desc Staff ; 

