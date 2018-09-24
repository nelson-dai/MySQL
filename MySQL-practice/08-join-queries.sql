-- show employee's info and department name
-- select e.ename, d.dname from dept d, emp e; //the wrong way: shows all the posibale combination

-- sql92
select e.ename,d.dname from emp e,dept d where e.DEPTNO=d.DEPTNO;
-- sql99
select e.ename,d.dname from emp e join dept d on e.deptno=d.deptno;


-- show employee's name sal and sal level  
select e.ENAME,e.sal,s.grade from emp e join salgrade s on e.sal between s.losal and s.HISAL;

-- show empolyee'name and his/her leader
select a.ename as leader,b.ENAME from emp a join emp b on a.EMPNO=b.MGR;

-- show emp's name and department name, must show all departments
select e.ename,d.dname from emp e right join dept d on e.deptno=d.deptno;

select e.ename,d.dname from dept d left join emp e on e.deptno=d.deptno;

-- show empolyee'name and his/her leader must show all employees 
select a.ename as leader,b.ENAME from emp a right join emp b on a.EMPNO=b.MGR;

/*
    When joining more than two tables

    step one: join two tables
    select e.ename, d,dname from emp e join dept d on e DEPTNO=d.DEPTNO
    step two: use the joined table as a new table
*/

--show empolyee's name, sal level, department name
SELECT 
    e.ename, e.sal, d.dname,s.GRADE
FROM
    emp e
        JOIN
    dept d ON e.DEPTNO = d.DEPTNO
        JOIN
    salgrade s ON e.sal BETWEEN s.LOSAL AND s.HISAL;
