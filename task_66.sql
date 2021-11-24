/* Вывести города, в которых живут клиенты, оформлявшие заказы в интернет-магазине. Указать количество заказов в каждый город, этот столбец назвать Количество. 
Информацию вывести по убыванию количества заказов, а затем в алфавитном порядке по названию городов */

SELECT name_city, COUNT(client_id) AS Количество
FROM city
    INNER JOIN client USING(city_id)
    INNER JOIN buy USING(client_id)
GROUP BY name_city
ORDER BY COUNT(client_id) DESC, name_city
