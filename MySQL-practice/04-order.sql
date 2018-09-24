-- sal from low to high
select ename,sal from emp order by sal;

-- MANAGER，sal from low to high
select ename,sal,job from emp where job='manager' order by sal;

-- sal from low to high
select ename,sal from emp order by sal asc;

-- sal from high to  low
select ename, sal from emp order by sal desc;

-- job and sal desc
select ename, sal, job from emp order by job desc, sal desc;

-- sal from low to high not recommanded (sal is in col 6)
select * from emp order by 6;
