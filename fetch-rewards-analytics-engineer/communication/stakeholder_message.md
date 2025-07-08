Hi team,

After reviewing the receipts, users, and brands data, here are my key findings and questions:

---

###  Business Insights
- The **top 5 brands by receipts scanned** last month were [Brand A, B, C...], with notable shifts from the previous month.
- Receipts marked **“Accepted”** had both higher **average spend** and **more items purchased** compared to those marked “Rejected”.
- Among users who joined in the last 6 months:
  - **Brand X** had the highest total spend.
  - **Brand Y** had the most unique transactions.

---

###  Data Quality Issues Observed
- Several receipts are missing `purchaseDate` and `totalSpent`, which could skew spend metrics.
- Many receipt items are missing `barcode` or `brandCode`, making it harder to attribute purchases to brands.
- Some receipts reference users that don’t exist in the users table — this may indicate missing or invalid joins.

---

###  What I Need to Know
- Should we treat receipts with zero `totalSpent` or missing items as **valid** or exclude them from analysis?
- Can we rely more on `brandCode` or `barcode` for brand attribution — or do we need to clean/merge these fields?
- Are receipts with unknown `rewardsReceiptStatus` (e.g., null or unrecognized status) considered complete?

---

###  Next Steps
- Recommend a data clean-up pass for brand and receipt linking fields.
- Consider adding constraints or validations at the ingestion stage to ensure future consistency.
- Let me know if we should prioritize any specific KPI or segment for deeper analysis.

Thanks!  
Zhengwu Fang