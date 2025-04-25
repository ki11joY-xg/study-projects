WITH name_clients AS (
	SELECT client_name, order_id
	FROM clients JOIN orders USING(client_id)
	),
	
	 name_workers AS (
	SELECT worker_name, order_id
	FROM workers JOIN workers_orders USING(worker_id)
	)

SELECT worker_name, COUNT(order_id)
FROM name_clients JOIN name_workers USING(order_id)
WHERE client_name LIKE 'У%' OR 
	  client_name LIKE 'Е%' OR
	  client_name LIKE 'Э%' OR
	  client_name LIKE 'О%' OR
	  client_name LIKE 'А%' OR
	  client_name LIKE 'Я%' OR
	  client_name LIKE 'И%' OR
	  client_name LIKE 'Ю%'
GROUP BY worker_name
ORDER BY worker_name
	
