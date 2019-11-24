
--Easy Function
SELECT COUNT(Employee_ID)
FROM employee;
WHERE (department = 'Legal');


--Trigger

Select * FROM artist WHERE artist_id IN (SELECT artist_id FROM single)


--Harder function -- this is the fucntion that uses a 2 table join

SELECT recordlabel.label_name, address.country_name
FROM recordlabel
INNER JOIN address
ON recordlabel.Record_Label_ID.=address.Record_Label_ID
WHERE(country_name='USA');



SELECT recordlabel.label_name, address.country_name
FROM recordlabel
INNER JOIN address
ON recordlabel.Record_Label_ID.=address.Record_Label_ID
WHERE(country_name='USA' AND NOT 'New York');



DROP TRIGGER IF EXISTS tr_ins_yeet;


--This is the first trigger, when you add in a new row returns it in CAPS
CREATE TRIGGER tr_ins_yeet
BEFORE INSERT ON artist
FOR EACH ROW
NEW.character_name = UPPER(new.character_name);


--

CREATE PROCEDURE
AS
BEGIN
SELECT name, Employee_ID FROM employee
END


CREATE PROCEDURE SelectAllCEO @Job nvarchar(30)
AS
SELECT * FROM employee WHERE department = @Job
GO;




CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

--2nd trigger which adds country code to a mobile number based on the country of the employee
/*
CREATE TRIGGER country_code AFTER UPDATE on employee
FOR EACH ROW
SELECT address.country_name, CONCAT(
 IF(address.country_name = 'USA', '+1',''),
 IF(address.country_name = 'UK', '+44',''),
 IF(address.country_name = 'Netherlands', '+31',''),
 IF(address.country_name = 'Germany', '+27',''),
 IF(address.country_name = 'Ireland', '+353',''),
    employee.mobile) AS mobileno
FROM address
INNER JOIN employee ON address.Record_Label_ID = employee.record_label_id
*/
