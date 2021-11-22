/* Для каждого автора из таблицы author вывести количество книг, написанных им в каждом жанре.

Вывод: ФИО автора, жанр, количество. Отсортировать по фамилии, затем - по убыванию количества написанных книг */

SELECT author.name_author, genre.name_genre, IFNULL(q_1.КОЛИЧЕСВТВО, 0) as Количество
FROM genre CROSS JOIN author LEFT JOIN (
SELECT author_id, genre_id, SUM(amount) AS КОЛИЧЕСВТВО
FROM book
GROUP BY author_id, genre_id
) AS q_1 ON q_1.author_id = author.author_id AND q_1.genre_id = genre.genre_id
ORDER BY author.name_author, КОЛИЧЕСВТВО
