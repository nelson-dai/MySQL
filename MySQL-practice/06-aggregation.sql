-- sum of sal
select sum(sal) as sumSal from emp;

-- total sal（sal+comm
select sum(sal + ifnull(comm,0)) as totalSal from emp;

select sum(comm) as totalComm from emp;

-- sal average
select avg(sal) as avgSal from emp;

-- heighest sal
select max(sal) as maxSal from emp;

-- hires latest
select max(hiredate) as lastHiredate from emp;

-- lowest sal
select min(sal) as minSal from emp;

-- hired earlest
select min(hiredate) as firstHiredate from emp;

-- total number of employees
select count(*) from emp;

-- number of employees that has comm
select count(comm) from emp;

-- number of employees that has no comm
select count(*) from emp where comm is null;

-- sum、avg、max、min、count can be used together：
select  count(*),sum(sal),avg(sal),max(sal),min(sal) from emp;


