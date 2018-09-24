-- show who's sal is higher than avg sal
SELECT 
    ename, sal
FROM
    emp
WHERE
    sal > (SELECT 
            AVG(sal) AS avgSal
        FROM
            emp);
            
-- calculate avg sal for each job and show avg sal and sal level 
SELECT 
    s.GRADE, t.job, t.avgSal
FROM
    salgrade s
        JOIN
    (SELECT 
        job, AVG(sal) AS avgSal
    FROM
        emp
    GROUP BY job) t ON t.avgSal BETWEEN s.losal AND s.hisal;
    
-- show who's job is manager or salesman
select ename,job from emp where job='manager' or job='salesman';
select ename,job from emp where job in ('manager','salesman');
-- using union
select ename,job from emp where job='manager'
	union
select ename,job from emp where job='salesman';

-- first 5 emp's info
select * from emp limit 0,5;

-- 5 highest sal emp
select * from emp order by sal desc limit 0,5;

-- find woh's sal is 3rd to 9th highest
select * from emp order by sal desc limit 2,7;