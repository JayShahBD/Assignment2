set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

CREATE EXTERNAL TABLE IF NOT EXISTS edptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Salary INT)
	PARTITIONED BY (Gender STRING)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

INSERT OVERWRITE TABLE edptab PARTITION (Gender)
SELECT EmployeeID, FirstName, LastName, Date, Age, Salary, Gender FROM etab;