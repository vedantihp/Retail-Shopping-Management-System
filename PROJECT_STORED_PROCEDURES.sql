#stored procedure
DELIMITER $$  
drop procedure if exists get_detail;
create procedure get_detail()
BEGIN  
    SELECT count(prod_id) FROM product WHERE selling_price > 2000;      
END $$ 
CALL get_detail(); 


#passing parameter
DELIMITER &&  
drop procedure if exists few_supplier;
CREATE PROCEDURE few_supplier (IN var1 INT)  
BEGIN  
    SELECT * FROM supplier LIMIT var1;   
END &&  

DELIMITER ;  
call few_supplier(5);

#passing with out parameter
DELIMITER &&  
drop procedure if exists max_qty;
CREATE PROCEDURE max_qty (OUT highestqty INT)  
BEGIN  
    SELECT MAX(qty) INTO highestqty FROM product;   
END &&  
DELIMITER ;
call max_qty(@q);
select @q;
 


#update quantity
delimiter $$
drop procedure if exists pr_buy_products;
create procedure PR_BUY_PRODUCTS()
begin declare pr_prod_id  numeric(4);
select prod_id
into pr_prod_id
from payment
where pay_id='2000';
update product
set qty = (qty - 1)
where prod_id=pr_prod_id;
end $$
call pr_buy_products();
select * from payment;
select * from product;




   

 