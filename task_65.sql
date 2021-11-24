/* Посчитать, сколько раз была заказана каждая книга, для книги вывести ее автора (нужно посчитать, в каком количестве заказов фигурирует каждая книга).  
Вывести фамилию и инициалы автора, название книги, последний столбец назвать Количество. 
Результат отсортировать сначала  по фамилиям авторов, а потом по названиям книг */

SELECT name_author, title, COUNT(buy_book.buy_id) AS Количество
FROM author
    INNER JOIN book USING(author_id)
    LEFT JOIN buy_book USING(book_id)
GROUP BY name_author, title
ORDER BY name_author, title
