-- Question 4 (Alternate View): Total Number of Items by Receipt Status
-- --------------------------------------------------------------------
-- Calculates the total number of items purchased for receipts marked
-- “Accepted” vs. “Rejected” using purchased_item_count.
-- Answers which status group contributes more volume of items overall.
-- Dialect: PostgreSQL


SELECT
  rewards_status,
  SUM(purchased_item_count) AS total_items_purchased
FROM receipts
WHERE rewards_status IN ('Accepted', 'Rejected')
GROUP BY rewards_status
ORDER BY total_items_purchased DESC;
