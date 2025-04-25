SELECT order_id, client_id, product_id, order_amount, order_price, order_date
FROM (
  SELECT order_id, client_id, product_id, order_amount, order_price, order_date,
         ROW_NUMBER() OVER (PARTITION BY EXTRACT(MONTH FROM order_date)) AS row_num
  FROM orders
) AS ranked_orders
WHERE EXTRACT(MONTH FROM order_date) = 11 AND EXTRACT(YEAR FROM order_date) = 2023;