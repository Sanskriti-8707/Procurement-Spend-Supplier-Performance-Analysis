# Procurement Spend & Supplier Performance Analysis

📄 [Case Study Report](reports/Procurement_Case_Study.pdf) | 🗃️ [SQL Queries](sql/procurement_analysis.sql) | 📈 [Excel Analysis](excel/Procurement_Analysis.xlsx) | 📊 [Power BI Dashboard](powerbi/Procurement_Dashboard.pbix) | 📂 [Dataset](data/Procurement_KPI_Analysis_Dataset.csv)

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

## Business Questions

1. Which suppliers account for the highest procurement expenditure?
2. Which product categories contribute most to total procurement spend?
3. How much cost savings are achieved through negotiated pricing?
4. Which suppliers have the highest defect rates?
5. Which suppliers have the longest delivery lead times?
6. How does supplier compliance vary?
7. Which suppliers require performance improvement?

## Business Recommendations

## Business Recommendations

1. **Strengthen Supplier Performance Management:** Identify underperforming suppliers and implement structured performance improvement plans with measurable delivery, quality and compliance targets.

2. **Investigate Supplier Quality Issues:** Conduct root-cause analysis for suppliers with high defect rates to identify whether quality issues originate during manufacturing, handling or transportation.

3. **Optimise Supplier Allocation:** Evaluate supplier performance before reallocating purchase volumes. Prioritise reliable suppliers while considering pricing, delivery capacity and product quality.

4. **Improve Delivery Reliability:** Monitor supplier lead times and establish clear delivery performance expectations to minimise delays and improve procurement efficiency.

5. **Negotiate Better Procurement Terms:** Use supplier-wise spend and negotiated price analysis to identify opportunities for cost reduction and improved purchasing agreements.

6. **Establish Regular Supplier Reviews:** Implement a supplier scorecard to regularly evaluate delivery, quality, cost and compliance performance and support data-driven procurement decisions.

## Repository Structure

- `data/` – Original and processed datasets.
- `excel/` – Excel analysis and supplier scorecards.
- `sql/` – SQL queries and analysis.
- `powerbi/` – Power BI dashboard files.
- `screenshots/` – Dashboard screenshots.
- `reports/` – Project documentation and case study.

## Author

Sanskriti Rajpoot

