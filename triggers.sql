
--Easy Function
SELECT COUNT(Employee_ID)
FROM employee;
WHERE (department = 'Legal');



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
ALTER TABLE employee ADD CONSTRAINT myconstraint UNIQUE(mobile)
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
