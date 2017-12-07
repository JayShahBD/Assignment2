CREATE TABLE IF NOT EXISTS mtab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Gender STRING, Salary INT)
	COMMENT 'Employee Table'
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INPATH '/home/cloudera/Downloads/sample.csv' INTO TABLE mtab;