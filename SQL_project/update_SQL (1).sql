update clients set client_name = 'Борис Казимиров' where client_id = 6;
--INSERT INTO clients (client_name) VALUES ('Иванов Иван');
--delete from clients where client_name = 'Иванов Иван';

select * from clients
order by client_id