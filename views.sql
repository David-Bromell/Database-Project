
#VIEW 1 - EMPLOYEE PUBLIC ACCESS




CREATE VIEW employee_public AS
SELECT name, age, department
FROM employee;

CREATE INDEX employee_ind
ON employee(age);

SELECT age
FROM employee_public
GROUP BY age
HAVING (employee_public.age)>16
ORDER BY count(AGE) DESC;


#VIEW 2 - SINGLE FOR PUBLIC ACCESs

CREATE VIEW single_public AS
SELECT song_name, song_length, explicit_
FROM single;

CREATE INDEX single_ind
ON single(explicit_);

SELECT explicit_
FROM single_public
GROUP BY explicit_
HAVING (single_public.explicit_<>'N');

#VIEW 3- ALBUM FOR PUBLIC ACCESS
CREATE VIEW album_public AS
SELECT album_name,album_length,explicit_
FROM album;

CREATE INDEX album_ind
ON album(album_length);

SELECT album_length
FROM album_public
GROUP BY album_length
HAVING(album_length>=30); 
