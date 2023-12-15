-- Triggers

-- syntax
-- CREATE TRIGGER trigger_name    
--     (AFTER | BEFORE) (INSERT | UPDATE | DELETE)  
--          ON table_name 
		-- FOR EACH ROW    
--          BEGIN    
--         --variable declarations    
--         --trigger code    
--         END;    
-- Types



-- Before Insert: It is activated before the insertion of data into the table.


create table customer1(
id int, name varchar(50), age int, dob date);
-- Inserting data into customer1 table
truncate table customer1;
delimiter //
create trigger before_insert_trigger
before insert
on customer1
for each row
	begin
		if new.age<0 then
			set new.age = 0;
		end if;
end //
delimiter ;
INSERT INTO customer1 (id, name, age, dob) VALUES
(1, 'John Doe', 25, '1997-05-15'),
(2, 'Alice Smith', 32, '1990-11-28'),
(3, 'Bob Johnson', -30, '1992-08-07'), -- Negative age example
(4, 'Emily Brown', 28, '1994-03-10'),
(5, 'Michael Wilson', -22, '1999-09-20'); -- Another negative age example

select * from customer1;
drop trigger before_insert_trigger;
    


-- After Insert: It is activated after the insertion of data into the table.
create table customer2(
id int, name varchar(50), age int, dob date);
-- Inserting data into customer1 table

create table cust2Logs(log_id int primary key auto_increment, record_id int, log varchar(150));
delimiter //
create trigger after_insert_trigger
after insert
on customer2
for each row
	begin
		insert into cust2Logs(record_id, log) 
        values (new.id, "Record Inserted");
	end //
delimiter ;
INSERT INTO customer2 (id, name, age, dob) VALUES
(1, 'John Doe', 25, '1997-05-15'),
(2, 'Alice Smith', 32, '1990-11-28'),
(3, 'Bob Johnson', 30, '1992-08-07'), 
(4, 'Emily Brown', 28, '1994-03-10'),
(5, 'Michael Wilson', 22, '1999-09-20'); 

select * from cust2Logs;


-- Before Update: It is activated before the update of data in the table.

create table customer3(
id int, name varchar(50), salary int, dob date);
delimiter //
create trigger before_update_trigger
before update
on customer3
for each row
	begin
		if new.salary = 0 then 
        set new.salary = 50000;
        elseif new.salary > 80000 then 
        set new.salary = 65000;
        end if;
	end //
delimiter ;


-- Inserting data into customer3 table, triggering the before_update_trigger
INSERT INTO customer3 (id, name, salary, dob) VALUES
(1, 'John Doe', 5000, '1990-05-15'), -- Triggers the set salary to 50000 condition
(2, 'Alice Smith', 85000, '1985-11-28'), -- Triggers the set salary to 65000 condition
(3, 'Bob Johnson', 70000, '1992-08-07'); -- Doesn't trigger any condition

set sql_safe_updates =0;
update customer3 set salary=0 where id=1;
update customer3 set salary=95505 where id=2;


select * from customer3;






-- Before Delete: It is activated before the data is removed from the table.

create table account(id int primary key auto_increment, name varchar(50), email varchar(50));
INSERT INTO account (name, email) VALUES
('John Doe', 'john@example.com'),
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com');
create table deleted_accounts(del_id int primary key auto_increment, acc_id int, acc_name varchar(50), email varchar(50), deletedAt timestamp default now());


delimiter //
create trigger before_del_trigger
before delete
on account
for each row
begin 
	insert into deleted_accounts(acc_id, acc_name, email) 
    values (old.id, old.name, old.email);
end //
delimiter ;

delete from account where id=2;

select * from deleted_accounts;

-- After Update: It is activated after the update of the data in the table.
-- After Delete: It is activated after the deletion of data from the table.

