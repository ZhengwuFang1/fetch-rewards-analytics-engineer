# Fetch Rewards Analytics Engineer Coding Exercise

This repository contains my submission for the Fetch Rewards Analytics Engineer coding exercise. The goal was to transform and analyze unstructured JSON data into a clean, structured relational model, then write SQL queries to answer specific business questions.

---

## ✅ Contents

### 📁 `/erd`
- Entity Relationship Diagram in `.dbml` and `.png` format

### 📁 `/sql`
- SQL queries answering six business stakeholder questions

### 📁 `/data_quality` (coming next)
- SQL and/or Python code identifying data quality issues

### 📁 `/communication`
- Slack/email-style summary message to business stakeholders

---

## 📊 SQL Business Questions Answered

1. **Top 5 brands by receipts scanned for the most recent month**
2. **Comparison of top 5 brand rankings to previous month**
3. **Which rewardsReceiptStatus group (Accepted/Rejected) has higher average spend?**
4. **Which rewardsReceiptStatus group has more total items purchased?**
5. **Which brand had the most spend from users created within the past 6 months?**
6. **Which brand had the most transactions from users created within the past 6 months?**

SQL dialect: **PostgreSQL**

---

## 🧱 Data Model

Modeled three source files into normalized relational tables:

- `users` (user-level attributes)
- `receipts` (receipt-level data)
- `receipt_items` (nested item-level list on each receipt)
- `brands` (brand metadata)

See `/erd/fetch_rewards_erd.dbml` for schema definitions and diagram.

---

## 🧪 Data Quality Checks

Coming in the `/data_quality` folder — includes null checks, type coercion, and consistency validations across receipts and items.

---

## 🗨️ Stakeholder Communication

A message template in `/communication/stakeholder_message.md` explains key findings, data concerns, and suggested next steps in a non-technical format.

---

## 👋 Contact

Prepared by: *Your Name*  
GitHub: [@yourusername](https://github.com/yourusername)

