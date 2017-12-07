CREATE EXTERNAL TABLE IF NOT EXISTS eptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Age INT, Gender STRING, Salary INT)
	PARTITIONED BY (Date DATE)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

INSERT INTO TABLE eptab PARTITION (Date='2017-01-03')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2017-01-03';

INSERT INTO TABLE eptab PARTITION (Date='2015-09-01')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2015-09-01';

INSERT INTO TABLE eptab PARTITION (Date='2016-12-02')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2016-12-02';
