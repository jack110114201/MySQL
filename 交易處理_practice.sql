START TRANSACTION ; #交易開始
INSERT INTO tx VALUES(null,NOW());  # 因為ID欄位設遞增，所以給NULL值

SELECT * FROM tx; #檢視資料

INSERT INTO tx VALUES(null,NOW());
 
SELECT * FROM tx; 
 
INSERT INTO tx VALUES(null,NOW());
 
SELECT * FROM tx;
 
ROLLBACK;  #復原 

SELECT * FROM tx;
--------------------------------------------------------
# 外顯示交易/確認
START TRANSACTION ; #交易開始
INSERT INTO tx VALUES(null,NOW());  # 因為ID欄位設遞增，所以給NULL值

SELECT * FROM tx; #檢視資料

INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx; 
INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx;
COMMIT; #確認建置新增的資料

SELECT * FROM tx;
-----------------------------------------------------------
# 隱含式交易/復原
SET AUTOCOMMIT = 0; #關閉自動確認  #其他地方的連線部會看到關閉中，所建置的資料

INSERT INTO tx VALUES(null,NOW());  # 因為ID欄位設遞增，所以給NULL值

SELECT * FROM tx; #檢視資料

INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx; 
INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx;
ROLLBACK;  #復原 

SELECT * FROM tx;

SET AUTOCOMMIT = 1 ;
------------------------------------------------------------
# 隱含式交易/確認
SET AUTOCOMMIT = 0; #關閉自動確認  #其他地方的連線不會看到關閉中，所建置的資料，直到輸入COMMIT 

INSERT INTO tx VALUES(null,NOW());  # 因為ID欄位設遞增，所以給NULL值

SELECT * FROM tx; #檢視資料

INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx; 
INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx;
#COMMIT;  #確認 

SELECT * FROM tx;

SET AUTOCOMMIT = 1 ;
------------------------------------------------------------------------------------
#交易儲存點

START TRANSACTION ; #交易開始

INSERT INTO tx VALUES(null,NOW());  # 因為ID欄位設遞增，所以給NULL值
SELECT * FROM tx; #檢視資料
SAVEPOINT tx1; #建立儲存點

INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx; 
SAVEPOINT tx2;
 
INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx;
SAVEPOINT tx3;

INSERT INTO tx VALUES(null,NOW());
SELECT * FROM tx;

ROLLBACK to tx3;  #復原至儲存點存儲時的資料
ROLLBACK to tx2;
ROLLBACK to tx1;

SELECT * FROM tx;

 
 