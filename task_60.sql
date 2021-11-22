/* Занести для книги «Стихотворения и поэмы» Лермонтова жанр «Поэзия», а для книги «Остров сокровищ» Стивенсона - «Приключения». (Использовать два запроса) */

UPDATE book, (SELECT book_id FROM book INNER JOIN author USING(author_id) WHERE title = 'Стихотворения и поэмы' AND author.name_author = 'Лермонтов М.Ю.') AS b_1
SET genre_id = (SELECT genre_id FROM genre WHERE name_genre = 'Поэзия')
WHERE book.book_id = b_1.book_id;

UPDATE book, (SELECT book_id FROM book INNER JOIN author USING(author_id) WHERE title = 'Остров сокровищ' AND author.name_author = 'Стивенсон Р.Л.') AS b_1
SET genre_id = (SELECT genre_id FROM genre WHERE name_genre = 'Приключения')
WHERE book.book_id = b_1.book_id
