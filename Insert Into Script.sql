-- Populate Customers
INSERT INTO customers (customer_id, country)
SELECT DISTINCT "CustomerID", "Country"
FROM online_retail_raw
WHERE "CustomerID" IS NOT NULL;

-- Populate Products
INSERT INTO products (stock_code, description)
SELECT DISTINCT "StockCode", "Description"
FROM online_retail_raw;

-- Populate Invoices
INSERT INTO invoices (invoice_no, invoice_date)
SELECT DISTINCT "InvoiceNo", "InvoiceDate"
FROM online_retail_raw;

-- Populate Invoice Details (Fact Table)
INSERT INTO invoice_details (invoice_no, stock_code, customer_id, quantity, unit_price, total_price, invoice_date)
SELECT 
    "InvoiceNo",
    "StockCode",
    "CustomerID",
    "Quantity",
    "UnitPrice",
    "Quantity" * "UnitPrice" AS total_price,
    "InvoiceDate"
FROM online_retail_raw
WHERE "CustomerID" IS NOT NULL;


-- Populate Dates Dimension Table
-- Generate dates from 2010-12-01 to 2011-12-09
INSERT INTO dates (date_id, day, month, year, quarter, day_name, month_name, week)
SELECT 
    d::DATE AS date_id,
    EXTRACT(DAY FROM d) AS day,
    EXTRACT(MONTH FROM d) AS month,
    EXTRACT(YEAR FROM d) AS year,
    EXTRACT(QUARTER FROM d) AS quarter,
    TO_CHAR(d, 'Day') AS day_name,
    TO_CHAR(d, 'Month') AS month_name,
    EXTRACT(WEEK FROM d) AS week
FROM generate_series('2010-12-01'::DATE, '2011-12-09'::DATE, INTERVAL '1 day') d;


);


