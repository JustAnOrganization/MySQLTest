use company
drop procedure if exists update_loop_test;

delimiter //

CREATE PROCEDURE update_loop_test(p1 INT)
BEGIN
	SET @x = 0;
	REPEAT

	UPDATE staff SET age = 22 WHERE name = CONCAT('James', FLOOR(RAND() * 41) + 20) LIMIT 1;

	SET @x = @x + 1;

	UNTIL @x > p1
	END REPEAT;

END //

delimiter ;

call update_loop_test(10000);