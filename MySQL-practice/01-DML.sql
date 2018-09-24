/*
	DML: insert, delete and update
*/

create table emp(
    id int,
    name varchar(100),
    sex char(6),
    birthday date,
    salary float(10,2)
);

/*
	desc emp; -show emp table' information
    usually use 0&1 to show sex
*/

-- add data
insert into emp (id,name,sex,birthday,salary) values (1,'andy','male','1995-05-15',10000);
insert into emp values (2,'paul','male','1996-06-15',15000);
insert into emp values (3,'lucy','female','1998-07-11',8000);


-- when adding more than one data
insert into emp (id,name,sex,birthday,salary) values
(4,'james','male','1985-08-10',50000),
(5,'marry','female','1987-06-15',30000),
(6,'carter','male','1995-05-18',10000);


/*modify*/
-- when modity value for a attribute from all in the table
update emp set salary=3000;
-- when modify specific one
update emp set salary=8000 where name='james';
-- modify more than one attribute
update emp set sex='male',salary=10000 where id=5;
-- modify attribute's type
alter table emp modify job varchar(30);
--change attribute name 
alter table emp change job work varchar(20);
--rename table
rename table emp to employee;
--switch to gbk
alter table emp character set gbk;


--show table information
show create table employee;


/*add attribute*/
alter table employee add address varchar(100);


/*deleting*/
delete from employee where name='lucy';
--delete attribute
alter table employee drop address;
-- delete all data from table
delete from employee;
--delete table
drop table employee;
--delete all data and replace table
truncate table employee;

