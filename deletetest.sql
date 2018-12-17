use company
drop procedure if exists delete_loop_test;

delimiter //

CREATE PROCEDURE delete_loop_test(p1 INT)
BEGIN
	SET @x = 0;
	REPEAT

	DELETE FROM staff WHERE name = CONCAT('James', FLOOR(RAND() * 41) + 20) LIMIT 1;

	SET @x = @x + 1;

	UNTIL @x > p1
	END REPEAT;

END //

delimiter ;

call delete_loop_test(10000);