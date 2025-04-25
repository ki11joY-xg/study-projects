SELECT product_name, amount*price AS avg_sum FROM products
WHERE amount*price > 1000
ORDER BY avg_sum DESC
LIMIT 5