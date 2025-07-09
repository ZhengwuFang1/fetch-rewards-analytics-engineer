-- Question 1: Top 5 Brands by Receipts Scanned (Most Recent Month)
-- This query returns the top 5 brands ranked by number of receipts scanned 
-- during the most recent calendar month in the receipts data.
-- It joins receipts → receipt_items → brands and filters on purchase_date.
-- Dialect: PostgreSQL


WITH most_recent_month AS (
  SELECT DATE_TRUNC('month', MAX(purchase_date)) AS month_start
  FROM receipts
  WHERE purchase_date IS NOT NULL
),
scanned_counts AS (
  SELECT
    b.name AS brand_name,
    COUNT(DISTINCT r.receipt_id) AS receipts_scanned
  FROM receipts r
  JOIN receipt_items ri ON r.receipt_id = ri.receipt_id
  JOIN brands b ON COALESCE(ri.barcode, ri.brand_code) = COALESCE(b.barcode, b.brand_code)
  WHERE r.purchase_date >= (SELECT month_start FROM most_recent_month)
    AND r.purchase_date < (SELECT month_start + INTERVAL '1 month' FROM most_recent_month)
  GROUP BY b.name
)
SELECT *
FROM scanned_counts
ORDER BY receipts_scanned DESC
LIMIT 5;
