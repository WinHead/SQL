/* Вывести названия книг, которые ни разу не были заказаны, отсортировав в алфавитном порядке */

SELECT book.title
FROM book 
    LEFT JOIN buy_book USING(book_id)
    LEFT JOIN buy USING(buy_id)
    LEFT JOIN buy_step USING(buy_id)
GROUP BY book.title 
HAVING SUM(buy_book.amount) IS NULL = TRUE
