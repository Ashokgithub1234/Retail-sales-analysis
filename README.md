# Retail Sales Analysis (2022–2025)

End-to-end data analysis project exploring sales, profit, and discount patterns across Indian regions, using Python, SQL, and Power BI.

## Business Problem

A retail company wants to understand where it makes and loses money. This project analyzes 4 years of order data to answer:
1. Which categories and sub-categories drive profit — and which lose money?
2. Which regions and states underperform?
3. How do discounts affect profit?
4. How have sales and profit trended over time?
5. Who are the most valuable customers and segments?

## Dataset

- **Source:** Synthetic retail dataset modeled on real-world order data (5,035 orders, 19 columns)
- **Fields:** Order details, customer info, location, product category, sales, discount, and profit
- **File:** `data/retail_sales_india.csv` (raw), `data/retail_sales_clean.csv` (cleaned)

## Tools Used

- **Python (pandas)** — data cleaning and exploration
- **SQL (SQLite)** — business question queries, window functions, joins
- **Power BI** — interactive dashboard
- **GitHub** — version control and portfolio presentation

## Data Cleaning

Removed 35 duplicate rows, converted Sales from text to numeric by stripping the ₹ symbol, converted Order Date and Ship Date from text to datetime, standardized Region and Customer Name capitalization, filled missing Discount with 0 (assumed no discount recorded) and missing Segment with "Unknown," and engineered Year, Month, Profit Margin %, and Shipping Days.

## Key Insights

1. **Tables is the only sub-category losing money** (-1% margin) despite ₹74.7L in sales, while Copiers is the strongest performer (32.5% margin, ₹3.16Cr sales).
2. **East region has the lowest profit margin** (16.6% vs 19-20% elsewhere), missing a 20% target; 3 of the 5 lowest-profit states belong to East — linked to higher average discounting.
3. **Profit turns negative once discounts exceed 30%**; even the 21-30% band barely breaks even, suggesting discounts should be capped around 20%.
4. **The business grew efficiently** — sales up ~57% from 2022 to 2025, with profit margin improving from 16.7% to 20.1% over the same period.
5. **Consumer segment drives the most volume** (63% of sales) though all segments have similar margins (18-19%).

## Dashboard

![Dashboard Screenshot](Dashboard/Screenshot%202026-10-01%20191539.png)

Interactive Power BI dashboard with KPI cards (Total Sales, Total Profit, Total Orders, Margin %), monthly trend, sub-category profit breakdown, discount band analysis, and Region/Category/Year filters.

## Recommendations

- **Cap discounts at ~20%** company-wide — profit turns negative beyond 30%, and 21-30% is barely profitable.
- **Review Tables' pricing or supplier costs** before applying further discounts — it's the only loss-making sub-category.
- **Investigate East region's discounting practices** — it is the only region missing its 20% margin target.
- **Continue current growth strategy** — margin improved alongside sales growth, suggesting healthy, non-discount-driven expansion.

## Project Structure

```
retail-sales-analysis/
├── data/
│   ├── retail_sales_india.csv
│   └── retail_sales_clean.csv
├── notebooks/
│   └── retail_sales_analysis.ipynb
├── sql/
│   └── queries.sql
├── dashboard/
│   ├── retail_dashboard.pbix
│   └── dashboard_screenshot.png
└── README.md
```

## Author

**Ashok S**
B.Tech, Artificial Intelligence and Data Science
Salem, Tamil Nadu, India
