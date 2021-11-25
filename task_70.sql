/* В таблице city для каждого города указано количество дней, 
за которые заказ может быть доставлен в этот город (рассматривается только этап "Транспортировка"). 
Для тех заказов, которые прошли этап транспортировки, вывести количество дней за которое заказ реально доставлен в город. 
А также, если заказ доставлен с опозданием, указать количество дней задержки, в противном случае вывести 0. В результат включить номер заказа (buy_id), 
а также вычисляемые столбцы Количество_дней и Опоздание. Информацию вывести в отсортированном по номеру заказа виде */

SELECT buy_id,
    DATEDIFF(date_step_end, date_step_BEG) AS Количество_дней, 
    IF(city.days_delivery < DATEDIFF(date_step_end, date_step_BEG), DATEDIFF(date_step_end, date_step_BEG) - city.days_delivery, 0) AS Опоздание
FROM city
    INNER JOIN client USING(city_id)
    INNER JOIN buy USING(client_id)
    INNER JOIN buy_step USING(buy_id)
    INNER JOIN step USING(step_id)
WHERE name_step = 'Транспортировка' AND date_step_end IS NULL = False
