CREATE TABLE clients (
  client_id SERIAL PRIMARY KEY,
  client_name VARCHAR(50)
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10,2),
  amount INTEGER,
  expiration_date DATE
);

CREATE TABLE suppliers (
  supplier_id SERIAL PRIMARY KEY,
  supplier_name VARCHAR(50)
);

CREATE TABLE workers (
  worker_id SERIAL PRIMARY KEY,
  worker_name VARCHAR(50),
  position VARCHAR(50)
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  client_id INTEGER,
  product_id INTEGER,
  order_amount INTEGER,
  order_price DECIMAL(10,2),
  order_date DATE,
  FOREIGN KEY (client_id) REFERENCES clients (client_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE suppliers_products (
  suppliers_products_id SERIAL PRIMARY KEY,
  supplier_id INTEGER,
  product_id INTEGER,
  FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE supplies (
  supply_id SERIAL PRIMARY KEY,
  product_id INTEGER,
  supply_amount INTEGER,
  supply_date DATE,
  supplier_id INTEGER,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE workers_orders (
  workers_orders_id SERIAL PRIMARY KEY,
  worker_id INTEGER,
  order_id INTEGER,
  FOREIGN KEY (worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

CREATE TABLE workers_supplies (
  workers_supplies_id SERIAL PRIMARY KEY,
  worker_id INTEGER,
  supply_id INTEGER,
  FOREIGN KEY (worker_id) REFERENCES workers (worker_id),
  FOREIGN KEY (supply_id) REFERENCES supplies (supply_id)
);

INSERT INTO clients (client_name) VALUES ('Кадыков Валентин');
INSERT INTO clients (client_name) VALUES ('Удалый Григорий');
INSERT INTO clients (client_name) VALUES ('Рождественская Екатерина');
INSERT INTO clients (client_name) VALUES ('Иванов Иван');
INSERT INTO clients (client_name) VALUES ('Кронова Дарья');

INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Морковь', 19.50, 30, '2023-11-21');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Картофель', 29.90, 60, '2024-02-11');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Перец сладкий', 30.00, 15, '2023-11-11');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Чеснок', 39.90, 21, '2024-05-21');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Шампиньоны', 99.00, 12, '2023-11-09');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Авокадо', 110.99, 10, '2023-11-04');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Мандарины', 71.80, 25, '2023-11-30');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Яблоки', 69.90, 80, '2023-12-30');
INSERT INTO products (product_name, price, amount, expiration_date)
VALUES ('Бананы', 89.90, 70, '2023-12-01');


INSERT INTO suppliers (supplier_name) VALUES ('РосФрукт');
INSERT INTO suppliers (supplier_name) VALUES ('Тевобилев Тимур');
INSERT INTO suppliers (supplier_name) VALUES ('Радомир и ко');
INSERT INTO suppliers (supplier_name) VALUES ('MAI FRUIT');

INSERT INTO workers (worker_name, position) VALUES ('Петров Владимир', 'Комплектовщик');
INSERT INTO workers (worker_name, position) VALUES ('Альнараз Айнура', 'Комплектовщик');
INSERT INTO workers (worker_name, position) VALUES ('Багетова Ирина', 'Заведующий');
INSERT INTO workers (worker_name, position) VALUES ('Мухаммедов Роман', 'Грузчик');
INSERT INTO workers (worker_name, position) VALUES ('Дорохов Илья', 'Комплектовщик');




INSERT INTO orders (client_id, product_id, order_amount, order_price, order_date)
VALUES (2, 3, 5, 200.00, '2023-11-07');
INSERT INTO orders (client_id, product_id, order_amount, order_price, order_date)
VALUES (3, 2, 10, 310.00, '2023-11-04');
INSERT INTO orders (client_id, product_id, order_amount, order_price, order_date)
VALUES (1, 4, 10, 450.00, '2023-11-10');
INSERT INTO orders (client_id, product_id, order_amount, order_price, order_date)
VALUES (4, 5, 5, 550.00, '2023-10-30');
INSERT INTO orders (client_id, product_id, order_amount, order_price, order_date)
VALUES (5, 1, 20, 600.00, '2023-10-27');


INSERT INTO suppliers_products (supplier_id, product_id) VALUES (2, 3);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (3, 2);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (1, 5);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (4, 3);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (4, 2);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (1, 6);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (4, 7);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (2, 8);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (1, 9);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (3, 1);
INSERT INTO suppliers_products (supplier_id, product_id) VALUES (2, 4);

INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (2, 5, '2023-10-25', 3);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (1, 10, '2023-10-26', 3);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (3, 3, '2023-10-27', 2);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (4, 7, '2023-10-28', 2);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (5, 5, '2023-10-29', 1);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (6, 10, '2023-10-29', 1);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (7, 5, '2023-10-25', 4);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (8, 5, '2023-10-25', 2);
INSERT INTO supplies (product_id, supply_amount, supply_date, supplier_id) VALUES (9, 5, '2023-10-25', 1);


INSERT INTO workers_orders (worker_id, order_id) VALUES (1, 5);
INSERT INTO workers_orders (worker_id, order_id) VALUES (2, 5);
INSERT INTO workers_orders (worker_id, order_id) VALUES (2, 3);
INSERT INTO workers_orders (worker_id, order_id) VALUES (5, 4);
INSERT INTO workers_orders (worker_id, order_id) VALUES (5, 2);
INSERT INTO workers_orders (worker_id, order_id) VALUES (1, 1);

INSERT INTO workers_supplies (worker_id, supply_id) VALUES (1, 8);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (2, 7);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (3, 7);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (4, 2);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (4, 1);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (2, 5);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (3, 3);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (3, 4);
INSERT INTO workers_supplies (worker_id, supply_id) VALUES (1, 6);

SELECT * FROM supplies;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM clients;
SELECT * FROM suppliers;
SELECT * FROM workers;
SELECT * FROM suppliers_products;
SELECT * FROM workers_orders;
SELECT * FROM workers_supplies;