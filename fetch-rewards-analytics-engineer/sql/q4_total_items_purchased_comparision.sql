-- SQL Dialect: PostgreSQL
-- Total number of items purchased from receipts with status 'Accepted' or 'Rejected'

SELECT
  rewards_status,
  SUM(purchased_item_count) AS total_items_purchased
FROM receipts
WHERE rewards_status IN ('Accepted', 'Rejected')
GROUP BY rewards_status
ORDER BY total_items_purchased DESC;
