SELECT supplier_id, SUM(supply_amount) FROM supplies
GROUP BY supplier_id
ORDER BY supplier_id
