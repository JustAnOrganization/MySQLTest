use company
drop procedure if exists insert_loop_test;

delimiter //

CREATE PROCEDURE insert_loop_test(p1 INT)
BEGIN
	truncate table staff;

	SET @x = 0;
	SET @prev_time = NOW();
	REPEAT

	SET @x = @x + 1;

	INSERT INTO staff (name, age, KPI, salary) values (CONCAT('James', FLOOR(RAND() * 41) + 20), 25, 1.0, 1000);

	IF @x % 100000 = 0 THEN 
		SELECT TIMEDIFF(@prev_time, NOW());
		SET @prev_time = NOW();
	END IF;

	UNTIL @x > p1
	END REPEAT;

END //

delimiter ;

call insert_loop_test(100);