-- SQL Dialect: PostgreSQL

-- 1. Check for nulls in critical fields
SELECT
  COUNT(*) FILTER (WHERE receipt_id IS NULL) AS null_receipt_id,
  COUNT(*) FILTER (WHERE user_id IS NULL) AS null_user_id,
  COUNT(*) FILTER (WHERE purchase_date IS NULL) AS null_purchase_date,
  COUNT(*) FILTER (WHERE total_spent IS NULL) AS null_total_spent
FROM receipts;

-- 2. Check for negative or zero spend
SELECT *
FROM receipts
WHERE total_spent <= 0;

-- 3. Check for invalid receipt statuses
SELECT DISTINCT rewards_status
FROM receipts;

-- 4. Check for receipts missing matching user records
SELECT r.*
FROM receipts r
LEFT JOIN users u ON r.user_id = u.user_id
WHERE u.user_id IS NULL;

-- 5. Check for receipt items with no matching receipt
SELECT ri.*
FROM receipt_items ri
LEFT JOIN receipts r ON ri.receipt_id = r.receipt_id
WHERE r.receipt_id IS NULL;

-- 6. Check for items with no price
SELECT *
FROM receipt_items
WHERE final_price IS NULL OR final_price < 0;

-- 7. Check for receipt items with missing brand/barcode linkage
SELECT *
FROM receipt_items
WHERE barcode IS NULL AND brand_code IS NULL;
