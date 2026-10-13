sql
--- Problem: Obtain the third transaction of every user
--- Source: https://datalemur.com/questions/sql-third-transaction
--- Difficulty: Medium
--- Approach: First, we obtain the order of transaction numbers for each user and we convert the query into a subquery.
WITH RankedRows AS (
  SELECT user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS rn
  FROM transactions
  )
SELECT user_id, spend, transaction_date
FROM RankedRows
WHERE rn = 3;
