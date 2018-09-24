-- check who earns highest sal in each dept
select e.ename,t.maxSal  from emp e
join
(select deptno, max(sal) as maxSal from emp group by deptno) t
on
e.deptno = t.deptno
where e.sal=t.maxSal;

-- who's sal is higher than avg sal in their dept 
select e.ename,e.sal,t.deptno,t.avgSal from emp e
join
(select  deptno, avg(sal) as avgSal from emp group by deptno) t
on
e.deptno=t.deptno
where e.sal>t.avgSal;

-- avg salary level in each dept
select t.deptno,t.avgSal,s.GRADE from  salgrade s
join
(select  deptno, avg(sal) as avgSal from emp group by deptno) t
on 
t.avgSal between s.LOSAL and s.HISAL;

-- get highest sal without using "max"
select ename, sal from emp order by sal desc limit 0,1;

--  show which dept has highest avg sal deptno
-- first way：
select  deptno, avg(sal) as avgSal from emp group by deptno
having avgSal=
(select max(t.avgSal) from 
(select  deptno, avg(sal) as avgSal from emp group by deptno) t);
-- second way：
select deptno,avg(sal) as avgSal from emp group by deptno order by avgSal desc limit 0,1;

-- which dept has highest sal avg deptname
select d.dname,d.deptno  from dept d
join
(select deptno,avg(sal) as avgSal from emp group by deptno order by avgSal desc limit 0,1) t
on
d.deptno=t.deptno;

-- deptname of lowest sal avg
select d.dname from dept d
join
(
	select t.deptno,min(t.GRADE) as minGrade from 
		(
		select s.grade,t.deptno  from salgrade s
		join
		(select  deptno, avg(sal) as avgSal from emp group by deptno) t
		on
		t.avgSal between s.losal and s.hisal
		) t
) t1
on d.deptno=t1.deptno;

--name of manager that has higher sal than highest sal of non-manager worker 
SELECT 
    e.ename
FROM
    emp e
        JOIN
    (SELECT DISTINCT
        (mgr) AS mgr
    FROM
        emp
    WHERE
        mgr IS NOT NULL) t ON e.empno = t.mgr
WHERE
    e.sal > (SELECT 
            MAX(sal) AS maxSal
        FROM
            emp
        WHERE
            empno NOT IN (SELECT DISTINCT
                    (mgr)
                FROM
                    emp
                WHERE
                    mgr IS NOT NULL));


-- how many emp in each sal level
select t.grade, count(t.empno) as totalEmp  from 
(select e.empno,s.GRADE from emp e
join 
salgrade s
on
e.sal between s.LOSAL and s.HISAL) t
group by t.grade;

-- empno amd name of emp that was hired before their manager
select a.empno, a.ENAME from emp a
join
emp b
on a.mgr=b.EMPNO
where
a.HIREDATE < b.HIREDATE;

-- deptname taht has at least 5 emps
select d.dname from dept d
join
(select e.DEPTNO, count(e.EMPNO) from emp e group by e.DEPTNO having count(e.EMPNO) >= 5) t
on
d.deptno=t.deptno;

-- job that lowest sal is higher than 1500 and how many emp
select job, min(sal) as minSal, count(*) as totalEmp from emp group by job having min(sal) > 1500;

-- all sales name
select e.ename from emp e
where e.deptno=(
select deptno from dept where DNAME='sales');

-- 求部门名称中带“S”字符的部门员工的工资合计、部门人数
--total sal and number of emp in the dept that has "s" in the deptname
select d.dname, count(e.empno) as totalEmp, sum(e.sal) as totalSal from emp e
right join 
dept d
on e.deptno=d.DEPTNO
where d.DNAME like '%s%'
group by d.dname;

