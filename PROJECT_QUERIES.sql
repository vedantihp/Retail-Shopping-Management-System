#1)Find the details of the customers from Thane who bought black jeans
Select * From customer natural inner join payment
Where cust_add = 'thane' and prod_id in ( select prod_id
From product
Where prod_category = 'Jeans' And prod_color = 'Black');


#2)Find the details of all the employees who work in HR
Select *
From staff, department
Where staff.dept_id = department.dept_id And dept_name = 'HR' ;

#3)Find the details of all suppliers from Khar who supply shirts. Use ON keyword
Select * 
From supplier inner join product
On supplier.sup_id = product.sup_id
where prod_category = 'shirt' and sup_add='khar';

#4)Find all the customers who spent above 2500/- Use nested queries
Select *
From customer
Where cust_id in ( select cust_id From payment
Where pay_amt > 2500 ) ;

#5)Provide the details of the admins whose names’ second last letter is ‘a’.
Select *
From admin
Where admin_name like '%a_' ;

#6)
select prod_category,count(prod_color)
from product
where prod_color='red'
group by prod_category 
having count(prod_color)>1;

#7)Find the number of customers who still use Yahoo.
Select count(cust_email) as 'No of users' From customer
Where cust_email like '%yahoo%';

#8)Find the customer who spent the maximum amount in one outing and average amount spent by each customer
Select cust_name, max(pay_amt), avg(pay_amt) as 'Average Value' 
From customer, payment
Where customer.cust_id = payment.cust_id
Group by cust_name
Order by max(pay_amt) desc;

#9)Using the ‘distinct’ keyword, find how many departments are present
Select count(distinct( dept_id ) ) 
From admin ;

#10)Find all these customers who pay by cash. Use nested queries
Select cust_name, cust_id
From customer
Where cust_id in ( select cust_id From payment
Where pay_mode = 'cash' ) ;

#11)List in ascending order the no products sold ( low -> high )
Select prod_id, prod_category, prod_type, prod_color, prod_brand, prod_size, prod_gender, Count( prod_id ) as 'Sales_Figures'
From product natural inner join payment Group by prod_id
Order by Sales_Figures ;

#12)Retrieve the total amount of sales between the 1st of Jan 2021 and 15th Jan 2022
Select sum( pay_amt ) as 'total_Value'
From payment
Where pay_date between '2021-01-01' and '2022-01-15' ;

#13)find the total profit for 2 years
select sum(pay_amt-cost_price) as profit
from payment, product
where payment.prod_id=product.prod_id and pay_date between '2021-01-01' and '2023-01-01' ;

#14)find total jeans sold
select count(prod_id)
from payment natural inner join product
where prod_category='jeans';

#15)using normal query to find sale between two dates
Select sum(pay_amt)
From payment 
Where pay_date between '2021-01-01' and '2023-01-01' ; 

#16)using functions to find sales between two dates
delimiter //
Create function monthly_sales(start_date date , end_date date) 
Returns numeric(10) 
deterministic
Begin 
Declare total numeric(10) ;
#Total is variable where the summed up value will be stored. 
Select sum(pay_amt) into total 
From payment 
Where pay_date between start_date and end_date; 
Return total; 
End //
select monthly_sales ('2021-01-01','2023-01-01');
select * from payment;

#17)dense rank:
SELECT prod_id,prod_category,prod_type,prod_color,prod_brand ,prod_gender,prod_size,cost_price,selling_price,qty,sup_id,
DENSE_RANK() OVER (ORDER BY selling_price) dens_rank  
FROM product;  

#18)percent rank:
SELECT prod_id,prod_category,prod_type,prod_color,prod_brand ,prod_gender,prod_size,cost_price,selling_price,qty,sup_id,selling_price-cost_price as profit,
PERCENT_RANK() OVER(PARTITION BY prod_category ORDER BY selling_price-cost_price)my_rank
FROM product;  

#19)auto
CREATE TABLE shirts (  
    id INT PRIMARY KEY AUTO_INCREMENT,   
    name VARCHAR(35),   
    size ENUM('small', 'medium', 'large', 'x-large')  
);  
INSERT INTO shirts(id, name, size)   
VALUES (1,'t-shirt', 'medium'),   
(2, 'casual-shirt', 3),   
(3, 'formal-shirt', 4),   
(4, 'polo-shirt', 'small');  
SELECT * FROM shirts;  
SELECT * FROM shirts ORDER BY  size DESC;  
 
#20)Prepared Statement 
PREPARE stmt1 FROM   
'SELECT staff_name,dept_id FROM staff  
WHERE dept_id = ?';  
set @dept_id=1111 ;
EXECUTE stmt1 USING @dept_id;
DEALLOCATE PREPARE stmt1;

#21)VIEW
Create view customer_info as ( 
Select cust_name, cust_mail, cust_phn 
From customer 
Where cust_id between 1100 and 1106 ); 

#Query pertaining to the view to retrieve info of all customers that use Gmail:
Select * 
From customer_info 
Where cust_mail like ‘%gmail%’ ;

#22)Grant all Privilege
CREATE USER 'william'@'localhost' IDENTIFIED BY 'will123456'; 
SELECT USER FROM MySQl.user;  
GRANT ALL PRIVILEGES ON * . * TO 'william'@'localhost' ;  
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'william'@'localhost';
REVOKE all privileges on *.* FROM 'william'@'localhost';
DROP USER 'william'@'localhost';



select prod_category,count(prod_category),sum(pay_amt),prod_type
from product natural join payment
where pay_date between '2021-01-01' and '2023-12-31'
group by prod_category,prod_type;
