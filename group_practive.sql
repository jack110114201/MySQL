#建立查詢指令以顯示下列各題描述之資料:
#顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為 Maximum, Minimum, Sum 和 Average，請將結果顯示為四捨五入的整數。
SELECT MAX(sal) AS Maximum, MIN(sal) AS Minimum, SUM(sal) AS Sum, ROUND(AVG(sal)) AS Average
FROM emp;


#顯示每種職稱的最低、最高、總和及平均薪水。
SELECT JOB, MAX(sal) AS Maximum, MIN(sal) AS Minimum, SUM(sal) AS Sum, ROUND(AVG(sal)) AS Average
FROM emp
GROUP BY JOB;


#顯示每種職稱的人數。
SELECT COUNT(*)
FROM emp
GROUP BY JOB;


#顯示資料項命名為Number of Managers來表示擔任主管的人數。
SELECT COUNT(distinct mgr) AS 'Number of Managers' 
FROM emp;

#顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。
SELECT MAX(sal) - MIN(sal) AS DIFFERENCE
FROM emp;

#顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資少於1000的主管，並以下屬員工最低薪資作降冪排列。

SELECT mgr, MIN(sal)
FROM emp
GROUP BY mgr
HAVING mgr IS NOT NULL AND MIN(sal) >= 1000
ORDER BY MIN(sal);


#顯示在1980,1981,1982,1983年進公司的員工數量，並給該資料項一個合適的名稱。
SELECT YEAR(HIREDATE), COUNT(*) AS OLD_GUY 
FROM emp
WHERE YEAR(HIREDATE) BETWEEN 1980 AND 1983
group by YEAR(HIREDATE);

