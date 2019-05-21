SELECT *
 FROM survey
 LIMIT 10;

SELECT question,
 	COUNT(DISTINCT user_id) AS 'users'
 FROM survey
 GROUP BY 1;

 SELECT *
 FROM quiz
 LIMIT 5;
 SELECT *
 FROM home_try_on
 LIMIT 5;
 SELECT *
 FROM purchase
 LIMIT 5;

 SELECT DISTINCT quiz.user_id,
 	home_try_on.user_id IS NOT NULL AS 	'is_home_try_on’,
 	home_try_on.number_of_pairs,
 	purchase.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz
 LEFT JOIN home_try_on
 	ON quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase
 	ON purchase.user_id = quiz.user_id
 LIMIT 10;

 WITH table_1 AS
 (SELECT DISTINCT quiz.user_id, home_try_on.user_id IS NOT NULL AS 'is_home_try_on', home_try_on.number_of_pairs, purchase.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz
 LEFT JOIN home_try_on
 	ON quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase
 	ON purchase.user_id = quiz.user_id)
 SELECT number_of_pairs AS 'pairs',COUNT(user_id) AS 'total 	users', SUM(is_purchase) AS 'purchases'
 FROM table_1
 GROUP BY number_of_pairs
 ;
