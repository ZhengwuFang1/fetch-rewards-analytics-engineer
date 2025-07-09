-- Question 2: Comparison of Top 5 Brand Rankings (Current vs Previous Month)
-- -------------------------------------------------------------------------
-- Compares receipt counts and ranks for top brands in the current vs.
-- previous month. Shows how top 5 brands shifted month-over-month.
-- Uses RANK window function and CTEs to break down receipt counts by month.
-- Dialect: PostgreSQL

WITH month_bounds AS (
  SELECT
    DATE_TRUNC('month', MAX(purchase_date)) AS this_month,
    DATE_TRUNC('month', MAX(purchase_date)) - INTERVAL '1 month' AS prev_month
  FROM receipts
),
brand_month_data AS (
  SELECT
    b.name AS brand_name,
    DATE_TRUNC('month', r.purchase_date) AS month,
    COUNT(DISTINCT r.receipt_id) AS receipts_scanned
  FROM receipts r
  JOIN receipt_items ri ON r.receipt_id = ri.receipt_id
  JOIN brands b ON COALESCE(ri.barcode, ri.brand_code) = COALESCE(b.barcode, b.brand_code)
  WHERE r.purchase_date >= (SELECT prev_month FROM month_bounds)
    AND r.purchase_date < (SELECT this_month + INTERVAL '1 month' FROM month_bounds)
  GROUP BY brand_name, DATE_TRUNC('month', r.purchase_date)
),
ranked_brands AS (
  SELECT
    brand_name,
    month,
    receipts_scanned,
    RANK() OVER (PARTITION BY month ORDER BY receipts_scanned DESC) AS brand_rank
  FROM brand_month_data
),
rank_compare AS (
  SELECT
    curr.brand_name,
    curr.receipts_scanned AS curr_count,
    curr.brand_rank AS curr_rank,
    prev.receipts_scanned AS prev_count,
    prev.brand_rank AS prev_rank
  FROM ranked_brands curr
  LEFT JOIN ranked_brands prev
    ON curr.brand_name = prev.brand_name
    AND prev.month = (SELECT prev_month FROM month_bounds)
  WHERE curr.month = (SELECT this_month FROM month_bounds)
)
SELECT *
FROM rank_compare
WHERE curr_rank <= 5
ORDER BY curr_rank;
