CREATE EXTERNAL TABLE IF NOT EXISTS etab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Gender STRING, Salary INT)
	COMMENT 'Employee External Table'
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

LOCATION '/home/cloudera/Downloads/sample.csv';
