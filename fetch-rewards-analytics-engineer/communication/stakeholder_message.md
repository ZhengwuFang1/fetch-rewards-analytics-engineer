Hi team,

After analyzing the receipts, users, and brands data, here are key findings, concerns, and next steps.

---

### ✅ Key Insights
- The top 5 brands by receipts scanned in the most recent month showed some rank shifts compared to the prior month.
- Receipts marked as **“Accepted”** had both higher **average spend** and more **items purchased** than those marked “Rejected.”
- Among users who joined within the past 6 months:
  - **Brand X** had the highest total spend.
  - **Brand Y** had the most transactions.

---

### ⚠️ Data Quality Concerns
- Some receipts are missing `purchaseDate` and `totalSpent`, impacting time-based metrics.
- Many receipt items lack both `barcode` and `brandCode`, making brand-level analysis difficult.
- A few receipts reference users who don’t exist in the users table.

---

### ❓ Open Questions
- Should we exclude receipts with `totalSpent = 0` or missing items?
- Should we prioritize `barcode` or `brandCode` when matching to brands?
- What is the expected handling of unknown or null `rewardsReceiptStatus` values?

---

### 📈 Recommendations
- Add constraints or validation checks during data ingestion.
- Prioritize cleanup of missing brand-linking fields.
- Confirm which KPIs are most important for product or marketing teams so we can focus future analysis.

Thanks,  
Zhengwu Fang
