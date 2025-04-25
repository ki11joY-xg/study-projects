WITH count_products AS (
	SELECT product_id, SUM(order_amount) AS count_product
	FROM orders
	GROUP BY product_id
	)

SELECT product_name, amount-count_product AS remains
FROM products JOIN count_products USING(product_id)
ORDER BY product_name