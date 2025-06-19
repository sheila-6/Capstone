-- Drop existing tables if needed (optional)
DROP TABLE IF EXISTS invoice_details;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country TEXT
);

-- Create Products table
CREATE TABLE products (
    stock_code VARCHAR(20) PRIMARY KEY,
    description TEXT
);

-- Create Invoices table
CREATE TABLE invoices (
    invoice_no VARCHAR(20) PRIMARY KEY,
    invoice_date TIMESTAMP
);

-- Create Invoice Details (Fact Table)
CREATE TABLE invoice_details (
    item_id SERIAL PRIMARY KEY,
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    customer_id INT,
    quantity INT,
    unit_price NUMERIC(10, 2),
    total_price NUMERIC(10, 2),
    invoice_date TIMESTAMP,
    FOREIGN KEY (invoice_no) REFERENCES invoices(invoice_no),
    FOREIGN KEY (stock_code) REFERENCES products(stock_code),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE IF NOT EXISTS dates (
    date_id DATE PRIMARY KEY,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    day_of_week INT,
    day_name VARCHAR(20),
    week INT
);
