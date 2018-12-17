use company;
DROP TABLE if exists staff;
CREATE TABLE staff (
   id INT(10) unsigned NOT NULL AUTO_INCREMENT primary key,
   name CHAR(20),
   age INT(3),
   KPI FLOAT(4, 3),
   salary FLOAT(10, 2)
   #INDEX (name)
 );

#insert
INSERT INTO staff (name, age) values ('James', 25);
#ALTER TABLE 

#update
#UPDATE staff SET age = 22 WHERE name = 'James';
UPDATE staff SET age = 22 WHERE name = CONCAT('James', FLOOR(RAND() * 41) + 20) LIMIT 1;

#select
SELECT *
FROM staff
WHERE name = 'James';

#delete
#DELETE FROM staff;
DELETE FROM staff WHERE name = CONCAT('James', FLOOR(RAND() * 41) + 20) LIMIT 1;
