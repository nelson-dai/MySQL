-- lower case
select lower(ename) as ename from emp;

-- upper case
select upper(ename) as ename from emp;

-- show second char in name from all emp
select substr(ename,2,1) from emp;

-- check who's name's second char is a
select ename from emp where substr(ename,2,1)='A';
select ename from emp where ename like '_A%';

-- name legth
select ename,length(ename) as nameLength from emp;

-- if comm = null set it as 0
select ename, ifnull(comm,0) as comm from emp;

-- sum of all sal
select ename, (sal+comm) as totalSal from emp; --will have null value
select ename, (sal+ ifnull(comm,0)) as totalSal from emp;

-- if comm is null then set it as 100, what is Annual salary
select ename, (sal + ifnull(comm,100))*12 as yearSal from emp;

-- MANAGER:sal+10%，SALESMAN: sal+50%
SELECT 
    ename,
    sal,
    job,
    (CASE job
        WHEN 'manager' THEN sal * 1.1
        WHEN 'salesman' THEN sal * 1.5
        ELSE sal
    END) AS newSal
FROM
    emp;
    
--manager trim will get rid of white space
select ename,job from emp where job=trim('   manager   ');

--sal 1 decimal
select round(sal,1) as sal from emp;

select round(10.25,1);

-- rand()
select rand();
-- more than one random number
select rand(), sal from emp;
-- random number from 0-100
select round(rand()*100), sal from emp;

-- hired on 1981-12-03
select empno,ename,hiredate from emp where hiredate='1981-12-03';

-- use str_to_date() to see who's hired on 02-20-1981
select empno,ename,hiredate from emp where hiredate=str_to_date('02-20-1981','%m-%d-%Y');

-- dateformat same as '10-12-1980'
select date_format(hiredate,'%m-%d-%Y') as hiredate from emp;