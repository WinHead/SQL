/* Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество . Последний столбец назвать Количество */

WITH q1 AS (SELECT name_genre, SUM(buy_book.amount) AS Количество
    FROM genre
    INNER JOIN book USING(genre_id)
    INNER JOIN buy_book USING(book_id)
    GROUP BY name_genre)
SELECT name_genre, Количество
FROM q1
WHERE q1.Количество = (SELECT MAX(q1.Количество) FROM q1 );

/* Или */

SELECT name_genre, SUM(buy_book.amount) AS Количество
FROM genre
    INNER JOIN book USING(genre_id)
    INNER JOIN buy_book USING(book_id)
GROUP BY name_genre
HAVING Количество = (SELECT SUM(buy_book.amount) AS Колич
     FROM book INNER JOIN buy_book USING(book_id)
     GROUP BY genre_id
     LIMIT 1);
