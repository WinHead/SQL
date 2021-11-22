/* Для книг, которые уже есть на складе (в таблице book), но по другой цене, чем в поставке (supply),  необходимо в таблице book увеличить количество на значение, указанное в поставке,  и пересчитать цену. А в таблице  supply обнулить количество этих книг. Формула для пересчета цены:

price={ (p_1*k_1+p_2*k_2)/ (k_1+k_2) }
 
где  p1, p2 - цена книги в таблицах book и supply;

       k1, k2 - количество книг в таблицах book и supply */

UPDATE  author INNER JOIN book USING(author_id) INNER JOIN supply ON author.name_author = supply.author AND book.title = supply.title
SET book.price = ( (book.price * book.amount + supply.price * supply.amount) / (book.amount + supply.amount) ), book.amount = book.amount + supply.amount, supply.amount = 0
WHERE book.price <> supply.price
