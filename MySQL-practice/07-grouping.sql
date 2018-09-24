/*
    distinct
*/
-- all kinds of job
select distinct job from emp;

-- number of different jobs
select count(distinct job) from emp;

-- show different job and deptno
select distinct deptno, job from emp;


/*
    group by
*/
-- highest sal in every position
select job,max(sal) as maxSal from emp group by job;

-- highest sal in every position ordered by sal
select job,max(sal) as maxSal from emp group by job order by maxSal;

-- avgrage sal in every department  
select deptno,avg(sal) from emp group by deptno;

-- highest sal in different dept and job
select deptno,job, max(sal) as maxSal from emp group by deptno,job;

-- highest sal in every position other than manager
select job,max(sal) as maxSal from emp where job<>'manager' group by job;


/*
    having
*/
-- average sal for different position than more than 2000
select job,avg(sal) from emp group by job having avg(sal)>2000;