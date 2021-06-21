#顯示和Blake同部門的所有員工之姓名和進公司日期。
SELECT ename,hiredate, DEPTNO
FROM emp
WHERE DEPTNO = (SELECT DEPTNO FROM emp WHERE ename = 'Blake');
               
#顯示所有在Blake之後進公司的員工之姓名及進公司日期。
SELECT ename, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = 'Blake');

#顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY SAL DESC;

#顯示和姓名中包含 T 的人在相同部門工作的所有員工之員工編號和姓名。
SELECT empno,ename, deptno 
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');

#顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。

SELECT ename, deptno, job
FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE LOC = 'Dallas')
;

#顯示直屬於”King”的員工之姓名和薪資。
SELECT ename, sal,mgr
FROM emp
WHERE mgr IN (SELECT EMPNO FROM emp WHERE empno = '7839');


#顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。
SELECT deptno, ename, job
FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE DNAME = "Sales");

#顯示薪資比公司平均薪資還要高且和名字中有 T 的人在相同部門上班的所有員工之員工編號,姓名和薪資。
SELECT empno, ename, sal, deptno
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
AND deptno IN (SELECT deptno FROM emp WHERE ename LIKE ('%T%'));



#顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
# 相關子查詢
# 內部子查詢

SELECT ename, deptno, sal, comm
FROM emp e1
where
e1.deptno in (select deptno
              from emp e2
			  where e2.comm > 0)
and 
e1.sal in (select sal
           from emp e3
           where e3.ename != e1.ename);




#顯示和在Dalls工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。
# think again!!!!!!!!!!!!!!!!






#顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)







#顯示薪資比所有職稱是”Clerks”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。
SELECT ename, hiredate, sal
FROM emp
WHERE sal > All (SELECT sal
				 FROM emp
				 WHERE job = 'clerk')
order by sal DESC;


