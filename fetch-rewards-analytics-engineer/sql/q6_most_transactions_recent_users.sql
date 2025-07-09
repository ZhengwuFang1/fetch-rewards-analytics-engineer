-- Question 6: Brand with Most Transactions (Recent Users Only)
-- -------------------------------------------------------------
-- Finds the brand associated with the most unique transactions
-- (i.e., receipts) among users who joined within the last 6 months.
-- Joins users → receipts → receipt_items → brands.
-- Counts distinct receipt_ids by brand.
-- Dialect: PostgreSQL

WITH recent_users AS (
  SELECT user_id
  FROM users
  WHERE created_date >= CURRENT_DATE - INTERVAL '6 months'
),
user_receipts AS (
  SELECT DISTINCT r.receipt_id, r.user_id
  FROM receipts r
  JOIN recent_users u ON r.user_id = u.user_id
),
brand_transactions AS (
  SELECT
    b.name AS brand_name,
    COUNT(DISTINCT r.receipt_id) AS receipt_count
  FROM user_receipts r
  JOIN receipt_items ri ON r.receipt_id = ri.receipt_id
  JOIN brands b ON COALESCE(ri.barcode, ri.brand_code) = COALESCE(b.barcode, b.brand_code)
  GROUP BY b.name
)
SELECT *
FROM brand_transactions
ORDER BY receipt_count DESC
LIMIT 1;
