-- SQL Dialect: PostgreSQL

WITH recent_users AS (
  SELECT user_id
  FROM users
  WHERE created_date >= CURRENT_DATE - INTERVAL '6 months'
),
user_receipts AS (
  SELECT r.receipt_id, r.user_id, r.total_spent
  FROM receipts r
  JOIN recent_users u ON r.user_id = u.user_id
),
brand_spend AS (
  SELECT
    b.name AS brand_name,
    SUM(r.total_spent) AS total_brand_spend
  FROM user_receipts r
  JOIN receipt_items ri ON r.receipt_id = ri.receipt_id
  JOIN brands b ON COALESCE(ri.barcode, ri.brand_code) = COALESCE(b.barcode, b.brand_code)
  GROUP BY b.name
)
SELECT *
FROM brand_spend
ORDER BY total_brand_spend DESC
LIMIT 1;
