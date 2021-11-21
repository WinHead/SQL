/* Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, или 3, или 5, или 7 . */

SELECT title, author
FROM book
WHERE (price >= 540.50 AND price <= 800) AND (amount = 2 OR amount = 3 OR amount = 5 OR amount = 7)
