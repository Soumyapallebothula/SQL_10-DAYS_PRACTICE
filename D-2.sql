-- Restaurant Growth 
-- [https://leetcode.com/problems/restaurant-growth/]

--CODE:
With cte AS
(SELECT visited_on, SUM(amount) AS total_amount from Customer group by visited_on),

cte2 AS
(SELECT visited_on, SUM(total_amount)  OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount, 
ROUND(AVG(total_amount)  OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount from cte)

Select * from cte2  where visited_on >=(select visited_on from cte order by visited_on limit 1)+6
order by visited_on
