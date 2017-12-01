# Create an external table - non partitioned.
CREATE EXTERNAL TABLE IF NOT EXISTS etab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Gender STRING, Salary INT)
	COMMENT 'Employee External Table'
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

# Load the sample data into the table
LOAD DATA LOCAL INPATH '/home/cloudera/Downloads/sample.csv' INTO TABLE etab;

# Create an internal table - non partitioned.
CREATE TABLE IF NOT EXISTS mtab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Gender STRING, Salary INT)
	COMMENT 'Employee Table'
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

# Load the sample data into the table
LOAD DATA LOCAL INPATH '/home/cloudera/Downloads/sample.csv' INTO TABLE mtab;

# Create an external table - with static partitioning by Date
CREATE EXTERNAL TABLE IF NOT EXISTS eptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Age INT, Gender STRING, Salary INT)
	PARTITIONED BY (Date DATE)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

# Load the sample data into the table
INSERT INTO TABLE eptab PARTITION (Date='2017-01-03')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2017-01-03';

INSERT INTO TABLE eptab PARTITION (Date='2015-09-01')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2015-09-01';

INSERT INTO TABLE eptab PARTITION (Date='2016-12-02')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2016-12-02';

# Create an internal table - with static partitioning by Date
CREATE TABLE IF NOT EXISTS mptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Age INT, Gender STRING, Salary INT)
	PARTITIONED BY (Date DATE)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

# Load the sample data into the table
INSERT INTO TABLE mptab PARTITION (Date='2017-01-03')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2017-01-03';

INSERT INTO TABLE mptab PARTITION (Date='2015-09-01')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2015-09-01';

INSERT INTO TABLE mptab PARTITION (Date='2016-12-02')
SELECT EmployeeID, FirstName, LastName, Age, Gender, Salary FROM etab WHERE Date='2016-12-02';

# set dynamic partitioning properties
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

# Create an external table - with dynamic partitioning by Gender
CREATE EXTERNAL TABLE IF NOT EXISTS edptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Salary INT)
	PARTITIONED BY (Gender STRING)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';
	
# Load the sample data into the table
INSERT OVERWRITE TABLE edptab PARTITION (Gender)
SELECT EmployeeID, FirstName, LastName, Date, Age, Salary, Gender FROM etab;

# set dynamic partitioning properties
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

# Create an internal table - with dynamic partitioning by Gender
CREATE TABLE IF NOT EXISTS mdptab(
	EmployeeID INT, FirstName STRING, LastName STRING, Date DATE, Age INT, Salary INT)
	PARTITIONED BY (Gender STRING)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ',';

# Load the sample data into the table
INSERT OVERWRITE TABLE mdptab PARTITION (Gender)
SELECT EmployeeID, FirstName, LastName, Date, Age, Salary, Gender FROM etab;

# End
