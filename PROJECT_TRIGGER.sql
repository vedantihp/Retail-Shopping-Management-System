create database trig;
use trig;

create table Message(
text varchar(100),
created_at date );

create table Department_news(
dept_id	NUMERIC(4) PRIMARY KEY,
dept_name  VARCHAR(15) NOT NULL,
updated_at DATE);

create table cust_history(
cust_id		NUMERIC(4) PRIMARY KEY,
cust_name	VARCHAR(15)  NOT NULL,
cust_phone	NUMERIC(10)  NOT NULL,
cust_email  varchar(20),
cust_add	VARCHAR(25)  NOT NULL,
deleted_at  DATE);


#BEFORE INSERT VALUE 
Delimiter //
CREATE TRIGGER before_insert_supplier
BEFORE INSERT ON supplier
FOR EACH ROW
BEGIN
    IF new.sup_id = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Total Supplier-ID cannot be less than or equal to 0';
    END IF;
END//

INSERT INTO supplier VALUES('0', 'rajes', '9009790095', 'jogeshwari');
 
INSERT INTO supplier VALUES('15', 'rajes', '9009790095', 'jogeshwari');
 
 
 
#AFTER INSERT VALUE
Delimiter //
CREATE TRIGGER after_insert_customer
AFTER INSERT ON customer
FOR EACH ROW
BEGIN
    INSERT INTO message (text, created_at)
    VALUES ('A new customer has been added', current_date());
END//


insert into customer values ('1122', 'Mohani', '9025590095', 'mohani1@gmail.com', 'Mulund');

select * from message;

#BEFORE UPDATE VALUE 
Delimiter //
CREATE TRIGGER before_update_product
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    # Check if the cost price is less than the selling price
    IF NEW.cost_price > NEW.selling_price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The selling price cannot be less than the cost price';
    END IF;
END//

update product
set selling_price=299 
where  cost_price=1499;

update product
set selling_price=2399 
where cost_price=1499;



#AFTER UPDATE VALUE
Delimiter //
CREATE TRIGGER after_update_department
AFTER UPDATE ON department
FOR EACH ROW
BEGIN
    INSERT INTO department_news(dept_id , dept_name , updated_at)
    values(OLD.dept_id , OLD.dept_name , NOW());
END//


update department 
set dept_name='sale'
where dept_name='sales'

select * from Department
select * from Department_news



#BEFORE DELETE VALUE 
Delimiter //
CREATE TRIGGER before_delete_staff
BEFORE DELETE ON staff
FOR EACH ROW
BEGIN
    DECLARE staff_count INT;
    SELECT COUNT(*) INTO staff_count FROM staff WHERE dept_id = OLD.dept_id;
    
    IF (staff_count <= 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete the last staff member in a department';
    END IF;
END//


delete from staff
where staff_id=202;


delete from staff 
where staff_id=808;

delete from staff 
where staff_id=110;


#AFTER DELETE VALUE 
Delimiter //
CREATE TRIGGER after_delete_customer
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO cust_history (cust_id, cust_name, cust_phone,cust_email, cust_add,deleted_at)
    VALUES (OLD.cust_id, OLD.cust_name, OLD.cust_phone , OLD.cust_email,OLD.cust_add , NOW());
END//


DELETE FROM customer where cust_email = 'kamal5@yahoo.com';

select * from cust_history;