/* Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в отсортированном по алфавиту виде. В решении используйте фамилию автора, а не его id */

SELECT name_client
FROM author
    INNER JOIN book USING(author_id)
    INNER JOIN buy_book USING(book_id)
    INNER JOIN buy USING(buy_id)
    INNER JOIN client USING(client_id)
WHERE name_author LIKE 'Достоевский%'
GROUP BY name_client
ORDER BY name_client
