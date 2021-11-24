/* Вывести информацию о каждом заказе: его номер, кто его сформировал (фамилия пользователя) и его стоимость 
(сумма произведений количества заказанных книг и их цены), в отсортированном по номеру заказа виде. Последний столбец назвать Стоимость */

SELECT buy_id, name_client, SUM(buy_book.amount * book.price) AS Стоимость
FROM client
    INNER JOIN buy USING(client_id)
    INNER JOIN buy_book USING(buy_id)
    INNER JOIN book USING(book_id)
GROUP BY buy_id
ORDER BY buy_id
