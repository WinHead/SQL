/* Если в таблицах supply  и book есть одинаковые книги, которые имеют равную цену,  вывести их название и автора, 
а также посчитать общее количество экземпляров книг в таблицах supply и book,  столбцы назвать Название, Автор  и Количество */

SELECT book.title AS Название, supply.author AS Автор, (book.amount +supply.amount)  AS Количество
FROM book INNER JOIN supply
ON book.title = supply.title AND book.price = supply.price
