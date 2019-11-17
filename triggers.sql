SELECT COUNT(Employee_ID)
FROM employee;
WHERE (department = 'Legal');

SELECT COUNT (Artist_ID)
FROM artist
WHERE(Record_Label_ID=2);


SELECT (record_label)
FROM address
WHERE (country_name='USA' AND NOT 'New York');





SELECT recordlabel.label_name, address.country_name
FROM recordlabel
INNER JOIN address 
ON recordlabel.Record_Label_ID.=address.Record_Label_ID
WHERE(country_name='USA' AND NOT 'New York');



SELECT recordlabel.label_name, address.country_name
FROM recordlabel
INNER JOIN address 
ON recordlabel.Record_Label_ID.=address.Record_Label_ID
WHERE(country_name='USA' AND NOT 'New York');



DROP TRIGGER IF EXISTS tr_up_yeet;

CREATE TRIGGER tr_ins_yeet
BEFORE INSERT ON artist
FOR EACH ROW
NEW.character_name = UPPER(new.character_name);

CREATE TRIGGER tr_up_yeet
BEFORE UPDATE ON artist
FOR EACH ROW
SET NEW.character_name = 
LOWER(new.character_name);