# Each query must contain either a subquery or both GROUP BY and HAVING clauses;

#VIEW 1 - EMPLOYEE PUBLIC ACCESS
CREATE VIEW employee_public AS
SELECT name, age, department
FROM employee_public
GROUP BY age
HAVING (employee_public.age)>16
ORDER BY count(AGE) DESC;


#VIEW 2 - SINGLE FOR PUBLIC ACCESS
CREATE VIEW single_public AS
SELECT song_name, song_length, explicit_
FROM single
GROUP BY explicit_
HAVING (single_public.explicit_<>'N');

#VIEW 3- ALBUM FOR PUBLIC ACCESS
CREATE VIEW album_public AS
SELECT album_name,album_length,explicit_
FROM album
GROUP BY album_length
HAVING(album_length>=00.00.30);