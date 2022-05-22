--1
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM books LIMIT 10;

--2
SELECT * FROM pg_Indexes WHERE tablename = 'customers';
SELECT * FROM pg_Indexes WHERE tablename = 'books';
SELECT * FROM pg_Indexes WHERE tablename = 'orders';
--3
EXPLAIN ANALYZE  SELECT customer_id, quantity FROM orders WHERE quantity > 18;

--4
CREATE INDEX customer_id_quantity_idx ON orders(customer_id, quantity > 18);

--5
EXPLAIN ANALYZE  SELECT customer_id, quantity FROM orders WHERE quantity > 18;

--6
EXPLAIN ANALYZE SELECT * FROM customers WHERE customer_id = 67569;

--7
ALTER TABLE customers 
ADD PRIMARY KEY (customer_id);

--8
EXPLAIN ANALYZE SELECT * FROM customers WHERE customer_id = 67569;

--9
CREATE INDEX customer_id_idx ON customers(customer_id);
CLUSTER customers USING customer_id_idx;
SELECT * FROM customers LIMIT 10;

--10
CREATE INDEX books_author_books_title_idx ON books(books_author, books_title);

--11
EXPLAIN ANALYZE SELECT * FROM orders WHERE (quantity * price_base) > 100;

--12
CREATE INDEX calc_total_price_idx ON orders ((quantity * price_base)> 100);

--13
EXPLAIN ANALYZE SELECT * FROM orders WHERE (quantity * price_base) > 100;
