-- SQL Dialect: PostgreSQL

SELECT
  rewards_status,
  COUNT(*) AS receipt_count,
  AVG(total_spent) AS avg_spend,
  SUM(purchased_item_count) AS total_items
FROM receipts
WHERE rewards_status IN ('Accepted', 'Rejected')
GROUP BY rewards_status
ORDER BY rewards_status;
