Use mydb;
select * from bill;
select * from Coverage;
select * from Driver;
select * from driveraddress;
select * from Driver_TrafficViolation_Record;
select * from PaymentDetail;
select * from policy;
select * from PolicyCoverage;
select * from Sedan;
select * from trucks;
select * from  Vehicle;
select * from  VehicleDriver;
select * from  Violation_Code;

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_DriverAddress.csv' 
	INTO TABLE driveraddress
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Violation_Code.csv' 
	INTO TABLE Violation_Code
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

SET foreign_key_checks = 0;

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/test.csv'
	INTO TABLE Driver_TrafficViolation_Record
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
    
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Driver.csv'
	INTO TABLE Driver
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_VehicleDriver.csv'
	INTO TABLE VehicleDriver
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/test2.csv'
	INTO TABLE Vehicle
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;   

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Sedan.csv'
	INTO TABLE Sedan
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Trucks.csv'
	INTO TABLE trucks
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Policy.csv'
	INTO TABLE policy
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS; 

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Bill.csv'
	INTO TABLE bill
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_PaymentDetail.csv'
	INTO TABLE PaymentDetail
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_Coverage.csv'
	INTO TABLE Coverage
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/Table_PolicyCoverage.csv'
	INTO TABLE PolicyCoverage
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;

SET foreign_key_checks = 1;
    
drop database mydb;

create table test(
idVehicle varchar(50),
idPolicy varchar(50),
Year varchar(50),
Model varchar(45),
Color varchar(45),
Trim varchar(45),
Mileage varchar(45),
VINNumber varchar(50),
VehicleNumberPlate varchar(45),
CreatedDate varchar(45),
Active varchar(45)
);

LOAD DATA LOCAL INFILE '/Users/richard/Desktop/FE512_FP_Table/test2.csv'
	INTO TABLE test
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS;   
    
select * from test; 
drop table test; 
    
SELECT idBill, CreatedDate,  DueDate FROM Bill WHERE MinimumPayment < 5000;

SELECT idBill,  DueDate, Driver_idDriver, PaymentOption, TotalAmount
FROM Bill INNER JOIN Policy
ON idBill = Bill_idBill;

select Driver_idDriver,  Vehicle_idVehicle from VehicleDriver;

select idDriver, Title, First_name, Last_name, EmailAddress, Phonenumber, SSN, IsPrimaryDriver, EverydayMileage
from Driver Inner Join VehicleDriver
On idDriver=Driver_idDriver;

SELECT idDriver, First_name, Last_name, EmailAddress, Phonenumber, Violation_Code_ID, TrafficViolationType, TrafficViolationPoint
FROM Driver  Left JOIN Driver_TrafficViolation_Record 
ON Violation_Code_ID = Driver_TrafficViolation_Record_idDriver_TrafficViolation;

select Driver_idDriver, Vehicle_idVehicle from VehicleDriver
