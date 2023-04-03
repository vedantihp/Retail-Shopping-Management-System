insert into department 
values(1111,'Sales'),
(2222,'Marketing'),
(3333,'HR'),
(4444,'Finance'),
(5555,'Logistics');
select * from department;

insert into Admin 
values (1,'Aakash',9009590095,1111),
(2,'Anil',9550595505,3333),
(3,'Abhay',9660696606,2222),
(4,'Seema',9785295287,4444),
(5,'Sanjay',9632552369,1111),
(6,'Soham',9102545429,5555),
(7,'Raj',9632112365,5555),
(8,'Rahul',8080512236,4444),
(9,'Hiral',9827382738,2222),
(10,'Naimish',9827736336,3333);
select * from admin;

INSERT INTO supplier 
VALUES('1212', 'rajesh', '9009590095', 'jogeshwari'),
('1313', 'jay', '9550595505', 'khar'),
('1414', 'mahesh', '9660696606', 'dombivali'),
('1515', 'nitin', '9785295287', 'kandivali'),
('1616', 'mohan', '9632552369', 'khar'),
('1717', 'vaibhav', '9102545429', 'dahisar'),
('1818', 'juhi', '9632112365', 'borivali'),
('1919', 'shruti', '8080512236', 'andheri'),
('2121', 'shweta', '9827382738', 'jogeshwari'),
('3131', 'pankti', '9827736336', 'andheri');
select * from supplier;
    
INSERT INTO product (prod_id, prod_category, prod_type, prod_color, prod_brand, prod_gender, prod_size, cost_price, selling_price, qty, sup_id) 
VALUES('1000', 'Jeans', 'Skinny', 'Blue', 'pepe', 'Male', 'xs', '1499', '1999', '20', '1212'),
('1001', 'Jeans', 'Skinny', 'Blue', 'levis', 'Male', 'xl', '2299', '2999', '15', '1212'),
('1002', 'Jeans', 'MomJeans', 'Black', 'sixth element', 'Female', 's', '1799', '2999', '10', '1212'),
('1003', 'Jeans', 'boyfriend', 'Blue', 'LeeCooper', 'Female', 'm', '1899', '2599', '10', '1212'),
('1004', 'Jeans', 'bell bottom', 'Blue', 'zara', 'Male', 'xs', '2299', '2999', '15', '1212'),
('1005', 'Jeans', 'straight', 'Black', 'h&m', 'Female', 'm', '1999', '2599', '20', '1212'),
('1006', 'Jeans', 'high rise', 'Blue', 'durfy', 'Female', 'l', '2099', '3599', '25', '1818'),
('1007', 'Tops', 'Casual', 'Blue', 'Ajile', 'Female', 'xs', '1499', '2599', '25', '1919'),
('1008', 'Tops', 'Formal', 'Red', 'H&M', 'Female', 'xs', '1599', '2599', '30', '2121'),
('1009', 'Tops', 'Occasional', 'Pink', 'GlobalDesi', 'Female', 'l', '1699', '2599', '10', '3131'),
('1010', 'Tops', 'Party Wear', 'Yellow', 'HnM', 'Female', 's', '1799', '2599', '5', '1414'),
('1011', 'Tops', 'Evening', 'Red', 'LeeCooper', 'Female', 'xl', '1899', '2599', '25', '1717'),
('1012', 'Tshirt', 'Casual', 'White', 'Zara', 'Female', 'xs', '999', '1599', '30', '1818'),
('1013', 'Tshirt', 'V-neck', 'Purple', 'H&M', 'Male', 'm', '1499', '1999', '20', '1919'),
('1014', 'Tshirt', 'collar-neck', 'LimeYellow', 'Tommy Hilfiger', 'Female', 'l', '2599', '3599', '15', '2121'),
('1015', 'Tshirt', 'half-sleeve', 'Blue', 'Zara', 'Female', 'xs', '2699', '3599', '20', '3131'),
('1016', 'Tshirt', 'full-sleeve', 'Brown', 'Raymond', 'Male', 'xs', '2799', '3599', '25', '2121'),
('1017', 'Shirt', 'half-sleeve', 'Red', 'Tommy Hilfiger', 'Female', 's', '2899', '3599', '30', '3131'),
('1018', 'Shirt', 'Formal', 'White', 'Raymond', 'Male', 'xl', '2399', '2999', '10', '1414'),
('1019', 'Shirt', 'full-sleeve', 'Orange', 'PeterEngland', 'Female', 'm', '2199', '2999', '5', '1515'),
('1020', 'Shirt', 'Oversized', 'Red', 'Raymond', 'Male', 'xs', '2299', '3599', '10', '1616');
select * from product;

insert into customer 
values ('1101', 'Mohini', '9009590095', 'mohini1@gmail.com', 'Mulund'),
('1102', 'Radhika', '9550595505', 'radhika2@gmail.com', 'Borivali'),
('1103', 'Payal', '9660696606', 'payal3@gmail.com', 'kandivali'),
('1104', 'Pallavi', '9785295287', 'pallavi4@gmail.com', 'thane'),
('1105', 'Kamal', '9632552369', 'kamal5@yahoo.com', 'andheri'),
('1106', 'Kashyap', '9102545429', 'kashyap6@yahoo.com', 'dahisar'),
('1107', 'Jyoti', '9632112365', 'jyoti6@yahoo.com', 'worli'),
('1108', 'Jayesh', '8080512236', 'jayesh8@gmail.com', 'ghatkopar'),
('1109', 'Sandeep', '9827382738', 'sandeep9@hotmil.com', 'andheri'),
('1110', 'Apoorva', '9827736336', 'apoorva10@gmail.com', 'santacruz');
select * from customer;
    
INSERT INTO payment 
VALUES('2000', 'card', '1999', '2022-08-07', '1101', '1000'),
('2001', 'cash', '2999', '2022-09-09', '1101', '1001'),
('2003', 'cash', '2999', '2021-04-20', '1104', '1002'),
('2004', 'card', '2599', '2023-03-26', '1105', '1003'),
('2005', 'card', '2599', '2021-01-01', '1107', '1007'),
('2006', 'cash', '2599', '2022-01-15', '1109', '1008'),
('2007', 'cash', '2599', '2022-08-16', '1102', '1009'),
('2008', 'card', '3599', '2021-02-10', '1102', '1017'),
('2009', 'cash', '2999', '2021-04-14', '1103', '1018'),
('2010', 'card', '2999', '2023-01-16', '1103', '1019'),
('2011', 'cash', '3599', '2021-11-25', '1108', '1001');
select * from payment;

insert into staff 
values (101,'Kenneth',9009590095,2222),
(202,'Devin',9550595505,4444),
(303,'Heer',9660696606,5555),
(404,'Tanish',9785295287,1111),
(505,'Aryan',9632552369,3333),
(606,'Vaibhav',9102545429,2222),
(707,'Akhil',9632112365,3333),
(808,'Rushil',8080512236,1111),
(909,'Samiksha',9827382738,5555),
(110,'Gayathri',9827736336,4444);
select * from staff;