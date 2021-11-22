/* Вывести информацию о книгах (название книги, фамилию и инициалы автора, название жанра, цену и количество экземпляров книг), 
написанных в самых популярных жанрах, в отсортированном в алфавитном порядке по названию книг виде. 
Самым популярным считать жанр, общее количество экземпляров книг которого на складе максимально */

SELECT book.title, author.name_author, genre.name_genre, book.price, book.amount
FROM author INNER JOIN book 
ON author.author_id = book.author_id
INNER JOIN
(SELECT q_2.genre_id, q_2.s
FROM (SELECT genre_id, SUM(amount) AS s
         FROM book
         GROUP BY genre_id) AS q_2
     INNER JOIN (
         SELECT genre_id, SUM(amount) AS s
         FROM book
         GROUP BY genre_id
         ORDER BY s DESC
         LIMIT 1) AS q_3 ON q_2.s = q_3.s
) AS q1
ON q1.genre_id = book.genre_id
INNER JOIN genre
ON genre.genre_id = book.genre_id

ORDER BY book.title
