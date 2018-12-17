use company
drop procedure if exists insert_loop_test;

delimiter //

CREATE PROCEDURE insert_loop_test(p1 INT)
BEGIN
	truncate table staff;

	SET @x = 0;
	REPEAT

	SET @x = @x + 1;

	INSERT INTO staff (name, age, KPI, salary) values (CONCAT('James', FLOOR(RAND() * 41) + 20), 25, 1.0, 1000);

	UNTIL @x > p1
	END REPEAT;

END //

delimiter ;

call insert_loop_test(10000);