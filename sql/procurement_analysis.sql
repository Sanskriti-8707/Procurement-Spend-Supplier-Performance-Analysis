-- Supplier Quality & Performance Analysis
-- Database: procurement_analysis (PostgreSQL)
-- Source: Kaggle Procurement KPI Analysis Dataset (777 purchase orders)
-- Quality KPIs use the 560 Delivered orders; on-time KPIs use the 492 of them with a delivery date.

-- SETUP
CREATE TABLE procurement (
    po_id            VARCHAR(20),
    supplier         VARCHAR(50),
    order_date       DATE,
    delivery_date    DATE,
    item_category    VARCHAR(50),
    order_status     VARCHAR(30),
    quantity         INT,
    unit_price       NUMERIC(10,2),
    negotiated_price NUMERIC(10,2),
    defective_units  INT,
    compliance       VARCHAR(10)
);

-- DATA QUALITY CHECKS

-- Q0a: Order status distribution
SELECT order_status, COUNT(*) AS orders,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct
FROM procurement
GROUP BY order_status
ORDER BY orders DESC;

-- Q0b: Duplicate PO IDs
SELECT po_id, COUNT(*) AS cnt
FROM procurement
GROUP BY po_id
HAVING COUNT(*) > 1;

-- Q0c: Missing values
SELECT COUNT(*) FILTER (WHERE delivery_date IS NULL) AS missing_delivery_date,
       COUNT(*) FILTER (WHERE defective_units IS NULL) AS missing_defects,
       COUNT(*) FILTER (WHERE compliance IS NULL) AS missing_compliance
FROM procurement;

-- SUPPLIER KPIs

-- Q1: Orders per supplier
SELECT supplier, COUNT(po_id) AS no_of_orders
FROM procurement
GROUP BY supplier
ORDER BY no_of_orders DESC;

-- Q2: Lead time per delivered order (sample rows)
SELECT po_id, supplier, order_date, delivery_date,
       delivery_date - order_date AS lead_time_days
FROM procurement
WHERE order_status = 'Delivered' AND delivery_date IS NOT NULL
LIMIT 10;

-- Q3: On-time delivery rate per supplier (11 days = median lead time)
SELECT supplier, COUNT(po_id) AS total_orders,
  COUNT(*) FILTER (WHERE delivery_date - order_date <= 11) AS ontime_orders,
  ROUND(COUNT(*) FILTER (WHERE delivery_date - order_date <= 11) * 100.0 / COUNT(*), 1) AS percentage_ontime
FROM procurement
WHERE order_status = 'Delivered' AND delivery_date IS NOT NULL
GROUP BY supplier
ORDER BY percentage_ontime DESC;

-- Q4: Defect rate per supplier
SELECT supplier, ROUND(SUM(defective_units) * 100.0 / SUM(quantity), 1) AS def_pct
FROM procurement
WHERE order_status = 'Delivered'
GROUP BY supplier
ORDER BY def_pct DESC;

-- Q5: Compliance rate per supplier
SELECT supplier, COUNT(po_id) AS total_orders,
  COUNT(*) FILTER (WHERE compliance = 'Yes') AS comp_check,
  ROUND(COUNT(*) FILTER (WHERE compliance = 'Yes') * 100.0 / COUNT(*), 1) AS comp_pct
FROM procurement
WHERE order_status = 'Delivered'
GROUP BY supplier
ORDER BY comp_pct DESC;

-- Q6: Average lead time per supplier
SELECT supplier, ROUND(AVG(delivery_date - order_date), 1) AS avg_lead_time_days
FROM procurement
WHERE order_status = 'Delivered' AND delivery_date IS NOT NULL
GROUP BY supplier
ORDER BY avg_lead_time_days DESC;

-- Q7: Combined vendor scorecard (defect and compliance on all 560 delivered orders)
SELECT supplier,
  ROUND(COUNT(*) FILTER (WHERE delivery_date IS NOT NULL AND delivery_date - order_date <= 11) * 100.0
        / NULLIF(COUNT(*) FILTER (WHERE delivery_date IS NOT NULL), 0), 2) AS ontime_pct,
  ROUND(SUM(defective_units) * 100.0 / NULLIF(SUM(quantity), 0), 2) AS def_pct,
  ROUND(COUNT(*) FILTER (WHERE compliance = 'Yes') * 100.0 / COUNT(*), 2) AS comp_pct,
  ROUND(AVG(delivery_date - order_date), 2) AS avg_lead_time_days
FROM procurement
WHERE order_status = 'Delivered'
GROUP BY supplier;

-- Q8: Defect cost per supplier (defective units x list unit price)
SELECT supplier, ROUND(SUM(defective_units * unit_price), 1) AS def_value
FROM procurement
WHERE order_status = 'Delivered'
GROUP BY supplier
ORDER BY def_value DESC;

-- ADVANCED (CTE + window functions)

-- Q9: Supplier ranking and share of defect cost
WITH supplier_kpis AS (
  SELECT supplier,
    ROUND(SUM(defective_units) * 100.0 / SUM(quantity), 2) AS def_pct,
    ROUND(COUNT(*) FILTER (WHERE compliance = 'Yes') * 100.0 / COUNT(*), 2) AS comp_pct,
    ROUND(SUM(defective_units * unit_price), 0) AS defect_cost
  FROM procurement
  WHERE order_status = 'Delivered'
  GROUP BY supplier
)
SELECT supplier, def_pct, comp_pct, defect_cost,
  RANK() OVER (ORDER BY def_pct DESC) AS defect_rank,       -- 1 = worst
  RANK() OVER (ORDER BY comp_pct ASC) AS compliance_rank,   -- 1 = worst
  ROUND(defect_cost * 100.0 / SUM(defect_cost) OVER (), 1) AS pct_of_total_defect_cost
FROM supplier_kpis
ORDER BY defect_cost DESC;

-- Q10: Cumulative share of defect cost
WITH defect_by_supplier AS (
  SELECT supplier, SUM(defective_units * unit_price) AS defect_cost
  FROM procurement
  WHERE order_status = 'Delivered'
  GROUP BY supplier
)
SELECT supplier, ROUND(defect_cost, 0) AS defect_cost,
  ROUND(SUM(defect_cost) OVER (ORDER BY defect_cost DESC) * 100.0 / SUM(defect_cost) OVER (), 1) AS cumulative_pct
FROM defect_by_supplier
ORDER BY defect_cost DESC;

-- CATEGORY AND PRICING

-- Q11: Defect rate by item category
SELECT item_category, ROUND(SUM(defective_units) * 100.0 / SUM(quantity), 2) AS def_pct
FROM procurement
WHERE order_status = 'Delivered'
GROUP BY item_category
ORDER BY def_pct DESC;

-- Q12: Average negotiated discount per supplier
SELECT supplier, ROUND(AVG((unit_price - negotiated_price) / unit_price * 100), 1) AS avg_discount_pct
FROM procurement
GROUP BY supplier;
