/* Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их стоимости за текущий и предыдущий год . 
Вычисляемые столбцы назвать Количество и Сумма. Информацию отсортировать по убыванию стоимости */

SELECT title, SUM(Количество) AS Количество, SUM(Сумма) AS Сумма
FROM
    (SELECT title, SUM(buy_archive.amount) AS Количество, SUM(buy_archive.price * buy_archive.amount) AS Сумма
    FROM buy_archive INNER JOIN book USING(book_id)
    GROUP BY title
    
    UNION ALL
    
    SELECT title, SUM(buy_book.amount) AS Количество, SUM(book.price * buy_book.amount) AS Сумма
    FROM book
        INNER JOIN buy_book USING(book_id)
        INNER JOIN buy USING(buy_id)
        INNER JOIN buy_step USING(buy_id)
        INNER JOIN step USING(step_id)
    WHERE step.name_step = 'Оплата' AND buy_step.date_step_end IS NULL = FALSE
    GROUP BY title) AS q_1
GROUP BY title
ORDER BY Сумма DESC
