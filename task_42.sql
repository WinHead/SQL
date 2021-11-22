/* в таблицу fine занести дату оплаты соответствующего штрафа из таблицы payment; 
уменьшить начисленный штраф в таблице fine в два раза  (только для тех штрафов, информация о которых занесена в таблицу payment), 
если оплата произведена не позднее 20 дней со дня нарушения */

UPDATE fine, payment
SET fine.sum_fine = IF (payment.date_payment - payment.date_violation <= 20
                        ,fine.sum_fine / 2, fine.sum_fine), fine.date_payment = payment.date_payment
WHERE (fine.name,fine.number_plate,fine.violation) = (payment.name,payment.number_plate,payment.violation) AND fine.date_payment IS NULL = true
