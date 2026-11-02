# Procurement Spend & Supplier Performance Analysis

📄 [Case Study Report](reports/Supplier_Quality_Performance_Dashboard_Writeup.docx) | 🗃️ [SQL Queries](sql/procurement_analysis.sql) | 📈 [Excel Analysis](excel/Vendor_Scorecard_Composite_Ranking.xlsx) | 📊 [Power BI Dashboard](dashboard/Supplier_Quality_Performance_Dashboard.pbix)

A SQL, Excel and Power BI analysis of procurement spend and supplier performance, focusing on purchasing patterns, supplier delivery performance, product quality, negotiated savings and compliance.

---

## Project Overview

This project focuses on analysing procurement spend and supplier performance using SQL, Microsoft Excel, and Power BI.

The analysis aims to evaluate supplier delivery performance, product quality, procurement costs, and compliance to identify areas for operational improvement and cost optimisation.

## Business Problem

Organisations work with multiple suppliers to purchase goods and services. However, poor supplier performance, delayed deliveries, product defects, and inefficient purchasing decisions can increase operational costs and affect business performance.

This project uses procurement data to evaluate supplier performance, analyse purchasing patterns, identify potential cost-saving opportunities, and support data-driven procurement decisions.

## Dataset

- **Source:** [Kaggle – Procurement KPI Analysis Dataset](https://www.kaggle.com/datasets/shahriarkabir/procurement-kpi-analysis-dataset)
- **Records:** 777 purchase orders
- **Suppliers:** 5
- **Time Period:** January 2022 – January 2024
- **Key Columns:** Supplier, Order_Date, Delivery_Date, Item_Category, Quantity, Unit_Price, Negotiated_Price, Defective_Units, Compliance.

## Tools & Technologies

- **PostgreSQL:** Database management, data exploration, data cleaning, and SQL analysis.
- **pgAdmin 4:** Writing and executing SQL queries.
- **Microsoft Excel:** Data validation, formulas, Pivot Tables, supplier scorecards, and cost analysis.
- **Power BI:** Data modelling, DAX measures, interactive dashboards, and data visualisation.

## Key Performance Indicators (KPIs)

- Total Procurement Spend
- Total Purchase Orders
- Total Suppliers
- Total Negotiated Savings
- Savings Percentage
- Average Delivery Lead Time
- Supplier Defect Rate
- Supplier Compliance Rate

## Analysis Performed

- Explored and validated procurement data.
- Identified duplicate records and missing values.
- Analysed supplier-wise procurement expenditure.
- Compared original and negotiated purchase prices.
- Calculated procurement cost savings.
- Evaluated supplier delivery lead times.
- Analysed defective units and supplier quality.
- Examined supplier compliance performance.
- Used SQL queries to identify procurement trends and supplier rankings.
- Created Excel-based supplier performance analysis and scorecards.
- Developed interactive Power BI dashboards.

## Key Insights

- Analysed 777 purchase orders across 5 suppliers: average lead time of 10.49 days, defect rate of 5.45% and compliance rate of 82.86%.
- Defects created a cost impact of 1.96M. Delta_Logistics (783K) and Beta_Supplies (553K) together account for about 68% of it.
- Delta_Logistics has the highest defect rate (10.64%) and the lowest compliance (61.67%), even though its on-time rate (58.25%) is second best. Fast delivery does not mean good quality.
- Beta_Supplies is the weakest on delivery: lowest on-time rate (46.00%), longest lead time (11.23 days), and the second-highest defect rate (7.42%).
- Gamma_Co leads on-time delivery (61.29%) with the shortest lead time (9.90 days). Epsilon_Group has the best compliance (98.33%) and Alpha_Inc the lowest defect rate (1.82%).
- Key influencers analysis shows Beta_Supplies orders outside the Office Supplies category are late 59.5% of the time, 14 percentage points above the 45.9% average.

## Business Questions

1. Which suppliers account for the highest procurement expenditure?
2. Which product categories contribute most to total procurement spend?
3. How much cost savings are achieved through negotiated pricing?
4. Which suppliers have the highest defect rates?
5. Which suppliers have the longest delivery lead times?
6. How does supplier compliance vary?
7. Which suppliers require performance improvement?

## Business Recommendations

1. **Prioritise Delta_Logistics and Beta_Supplies for improvement plans:** together they drive about 68% of defect cost. Set targets for defect rate, delivery and compliance.

2. **Run root-cause analysis on Delta_Logistics quality issues:** a 10.64% defect rate and 61.67% compliance need action even though delivery is on time.

3. **Fix Beta_Supplies delivery for non-Office-Supplies items:** these orders are late 59.5% of the time. Review lead-time commitments for these categories.

4. **Use Gamma_Co and Epsilon_Group as benchmarks:** best delivery and best compliance respectively. Consider shifting volume once price and capacity are checked.

5. **Adopt the supplier scorecard for regular reviews:** track on-time rate, defect rate, compliance and lead time every quarter.

## Author

Sanskriti Rajpoot

