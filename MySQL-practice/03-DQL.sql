/*
    DQL: Inquire data
    select ... from "table name" where -> group by -> having -> order by;   
*/

select ENAME from emp;

select empno,ename from emp;

-- see all data in emp
select * from emp;

-- check empon, ename and Annual salary 
-- use "as" to give it a name
select empno, ename, sal*12 as yearsal from emp;
select empno, ename, sal*12  yearsal from emp;
select empno, ename, sal*12 as '年薪' from emp;

-- check who earns 5000
select empno,ename from emp where sal=5000;

-- check who is manager
select empno,ename from emp where job='manager';

-- check who's salary is not 5000
-- better use <>
select empno,ename from emp where sal <> 5000;
select empno,ename from emp where sal != 5000;

-- check who's salary is from 1600 to 3000
select empno,ename from emp where sal>=1600 and sal<=3000;
select empno,ename from emp where sal between 1600 and 3000;

-- check who's doesn't have comm
select empno,ename,comm from emp where comm is null;

-- MANAGER and earn more than 2500
select empno,ename,job,sal from emp where job='manager' and sal>2500;

-- SALESMAN or MANAGER
select empno, ename ,job from emp where job='salesman' or job='manager';

-- salary>1800 and deptpno is 20 or 30
select empno,ename,sal,deptno from emp where sal>1800 and (deptno=20 or deptno=30);

-- SALESMAN or MANAGER
select empno, ename from emp where job in ('salesman','manager');

-- check who's salary is not 1600 nor 3000
select empno, ename from emp where job not in (1600,3000);

-- name starts with m
select ename from emp where ename like 'm%';

-- name ends with n
select ename from emp where ename like '%n';

-- name has o
select ename from emp where ename like '%o%';

-- second char is a in name
select ename from emp where ename like '_A%';