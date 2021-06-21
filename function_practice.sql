#建立查詢指令以顯示下列各題描述之資料:
#顯示系統目前的日期並將表頭命名為”系統日期”。
SELECT CURDATE() AS "系統日期";


#顯示所有員工之員工編號,姓名,薪資及將薪資增加15%並且以整數表示，並將表頭命名為”New Salary”。
SELECT empno, ename, sal, truncate(sal*1.15,0) AS "New Salary"
FROM emp;


#接續第二題，增加一個資料項表頭命名為Increase (將New Salary 減掉 salary 的值)。
SELECT empno, ename, sal, truncate(sal*1.15,0) AS "New Salary", truncate(sal*1.15,0)-sal AS Increase
FROM emp;


#顯示員工的姓名,進公司日期,檢討薪資的日期(指在進公司工作六個月後的第一個星期一)，將該欄命名為REVIEW，
#並自訂日期格式為：Sunday, the Seventh of September。(星期幾， 幾月幾日)。
SELECT ename, hiredate,
CASE
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Monday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 7 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Tuesday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 6 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Wednesday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 5 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Thursday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 4 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Friday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 3 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Saturday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 2 day),'%W, the %D of %M')
   WHEN dayname(adddate(hiredate, interval 6 month)) = 'Sunday' THEN Date_format(adddate(adddate(hiredate, interval 6 month), interval 1 day),'%W, the %D of %M')
   ELSE 'error'
END REVIEW 
FROM emp;

SELECT adddate(curdate(), interval 6 month);

#顯示每位員工的姓名，資料項(MONTHS_WORKED):計算到今天為止工作了幾個月(將月數四捨五入到整數)
SELECT ename, (TIMESTAMPDIFF(MONTH,DATE(hiredate),curdate())) AS 'MONTHS_WORKED'
FROM emp;

#顯示如下格式：<員工姓名> earns <薪水> monthly but wants <3倍的薪水>.並將表頭顯示為Dream Salaries。
SELECT CONCAT(ename,' ', 'earns', ' ', sal, ' ', 'monthly but wants', ' ',sal*3) AS 'Dream Salaries'
FROM emp;

#顯示所有員工之姓名和薪資，設定薪資長度為15個字元並且在左邊加上$符號，將表頭命名為SALARY。
select ename,lpad(concat('$',sal),15,' ') SALARY 
from emp;


#顯示員工之姓名,進公司日期，資料項(DAY):顯示員工被雇用的那天為星期幾，並以星期一作為一週的起始日,依星期排序。
SELECT ename, hiredate, WEEKDAY(DATE(hiredate))+1 AS DAY
FROM emp
ORDER BY DAY;

#顯示員工的姓名和名為COMM的欄位:顯示佣金額，如果該員工沒有賺取佣金則顯示"No Commission."
SELECT ename,
CASE 
   WHEN comm IS NOT NULL THEN comm
   ELSE 'No Commission'
END comm
FROM emp;

#顯示資料項命名為 EMPLOYEE_AND_THEIR_SALARIES 的資料來顯示所有員工之名字和薪資，且用星號來表示他們的薪資，每一個星號表示100元，並以薪資由高到低來顯示。
SELECT CONCAT(ename, REPEAT('*',(sal/100))) as EMPLOYEE_AND_THEIR_SALARIES
FROM emp
ORDER BY sal DESC;



