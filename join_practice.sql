#顯示所有員工之姓名,所屬部門編號,部門名稱及部門所在地點。
SELECT e.ename, d.dname, d.LOC
FROM emp e
JOIN dept d ON (e.deptno = d.deptno);

#顯示所有有賺取佣金的員工之姓名,佣金金額,部門名稱及部門所在地點。
SELECT e.ename, e.comm, d.dname, d.LOC
FROM emp e
JOIN dept d ON (e.deptno = d.deptno)
WHERE e.comm IS NOT NULL;

#顯示姓名中包含有”A”的員工之姓名及部門名稱。
SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON (e.deptno = d.deptno)
WHERE e.ename LIKE '%A%';

#顯示所有在”DALLAS”工作的員工之姓名,職稱,部門編號及部門名稱
SELECT e.ename, e.job, e.deptno, d.dname 
FROM emp e
JOIN dept d ON (e.deptno = d.deptno)
WHERE d.LOC = 'DALLAS';

#顯示出表頭名為: Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名,員工編號,主管名字, 主管的員工編號。
SELECT e1.ename AS Employee, e1.empno AS 'Emp#', e2.ename AS Manager, e2.mgr AS 'Mgr#'
FROM emp e1
JOIN emp e2 ON (e1.empno = e2.mgr);

#顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名,職稱,部門名稱,薪資及薪資等級。
DESC SALGRADE;

SELECT ename, job, sal,
CASE
 WHEN sal between 700 AND 1200 THEN '1'
 WHEN sal between 1201 AND 1400 THEN '2'
 WHEN sal between 1401 AND 2000 THEN '3'
 ELSE '4'
END SAL_GRADE
FROM emp;

#顯示出表頭名為: Employee, Emp Hiredate, Manager, Mgr Hiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名,進公司日期和主管之姓名及進公司日期。
SELECT e1.ename AS Employee, e1.HIREDATE AS 'Emp Hiredate', e2.ename AS Manager, e2.hiredate AS 'Mgr Hiredate'
FROM emp e1
JOIN emp e2 ON (e1.empno = e2.mgr)
WHERE e1.HIREDATE < e2.HIREDATE;

#顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱,部門所在地點,部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
SELECT d.dname AS dname, d.LOC AS loc, COUNT(empno), ROUND(AVG(e.sal))
FROM emp e
RIGHT outer JOIN dept d ON (e.deptno = d.deptno)
GROUP BY e.deptno;