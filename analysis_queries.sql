-- Supply Chain PO Analytics Dashboard
-- SQL practice queries for analysing purchase orders, supplier performance, delayed shipments and confirmations.

-- 1. Total PO value by supplier
SELECT
    supplier,
    SUM(po_value) AS total_po_value
FROM po_data
GROUP BY supplier
ORDER BY total_po_value DESC;

-- 2. Count of purchase orders by status
SELECT
    status,
    COUNT(po_number) AS po_count
FROM po_data
GROUP BY status
ORDER BY po_count DESC;

-- 3. Open purchase orders by supplier
SELECT
    supplier,
    COUNT(po_number) AS open_po_count
FROM po_data
WHERE status = 'Open'
GROUP BY supplier
ORDER BY open_po_count DESC;

-- 4. Delayed purchase orders
SELECT
    po_number,
    supplier,
    sku,
    current_eta,
    delay_status,
    po_value
FROM po_data
WHERE delay_status = 'Delayed'
ORDER BY current_eta ASC;

-- 5. Pending supplier confirmations
SELECT
    po_number,
    supplier,
    sku,
    supplier_confirmation,
    po_value
FROM po_data
WHERE supplier_confirmation = 'Pending'
ORDER BY po_value DESC;

-- 6. High-value open purchase orders
SELECT
    po_number,
    supplier,
    sku,
    status,
    po_value
FROM po_data
WHERE status = 'Open'
  AND po_value > 20000
ORDER BY po_value DESC;

-- 7. Average delay days by supplier
SELECT
    supplier,
    AVG(delay_days) AS average_delay_days
FROM po_data
GROUP BY supplier
ORDER BY average_delay_days DESC;

-- 8. PO value by category
SELECT
    category,
    SUM(po_value) AS total_po_value
FROM po_data
GROUP BY category
ORDER BY total_po_value DESC;
