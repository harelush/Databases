-- Create Extended Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    region VARCHAR(50),
    zip VARCHAR(10)
);

-- Create Extended Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category VARCHAR(50)
);

-- Create Extended Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    order_date DATE,
    status VARCHAR(50),
    shipping_address VARCHAR(255)
);

-- Insert Sample Data into Extended Customers Table
INSERT INTO customers (first_name, last_name, email, phone, address, city, region, zip) VALUES
('David', 'Cohen', 'david.cohen@example.com', '050-1234567', '1 Herzl St', 'Tel Aviv', 'Central District', '61000'),
('Sara', 'Levi', 'sara.levi@example.com', '052-2345678', '2 Ben Yehuda St', 'Jerusalem', 'Jerusalem District', '91000'),
('Yossi', 'Mizrachi', 'yossi.mizrachi@example.com', '053-3456789', '3 Rothschild Blvd', 'Haifa', 'Northern District', '32000'),
('Rivka', 'Goldberg', 'rivka.goldberg@example.com', '054-4567890', '4 Dizengoff St', 'Rishon LeZion', 'Central District', '75000');

-- Insert Sample Data into Extended Products Table
INSERT INTO products (product_name, description, price, stock_quantity, category) VALUES
('Laptop', 'A high-performance laptop with 16GB RAM and 512GB SSD.', 3999.99, 10, 'Electronics'),
('Smartphone', 'A latest-gen smartphone with a powerful camera.', 2999.99, 20, 'Electronics'),
('Tablet', 'A lightweight tablet with a 10-inch screen.', 1999.99, 15, 'Electronics'),
('Headphones', 'Noise-cancelling over-ear headphones.', 799.99, 30, 'Accessories'),
('Monitor', '27-inch 4K UHD monitor.', 1499.99, 25, 'Electronics'),
('Keyboard', 'Mechanical keyboard with RGB lighting.', 499.99, 50, 'Accessories'),
('Mouse', 'Wireless ergonomic mouse.', 299.99, 45, 'Accessories');

-- Insert Sample Data into Extended Orders Table
INSERT INTO orders (customer_id, product_id, quantity, order_date, status, shipping_address) VALUES
(1, 1, 1, '2023-06-01', 'Shipped', '1 Herzl St, Tel Aviv, Central District, 61000'),
(1, 2, 2, '2023-06-15', 'Delivered', '1 Herzl St, Tel Aviv, Central District, 61000'),
(2, 3, 1, '2023-06-20', 'Processing', '2 Ben Yehuda St, Jerusalem, Jerusalem District, 91000'),
(3, 4, 3, '2023-06-25', 'Cancelled', '3 Rothschild Blvd, Haifa, Northern District, 32000'),
(4, 1, 1, '2023-07-01', 'Shipped', '4 Dizengoff St, Rishon LeZion, Central District, 75000'),
(2, 5, 2, '2023-07-05', 'Delivered', '2 Ben Yehuda St, Jerusalem, Jerusalem District, 91000'),
(3, 6, 1, '2023-07-10', 'Shipped', '3 Rothschild Blvd, Haifa, Northern District, 32000'),
(4, 7, 3, '2023-07-15', 'Processing', '4 Dizengoff St, Rishon LeZion, Central District, 75000');
