/* В таблице fine увеличить в два раза сумму неоплаченных штрафов для отобранных на предыдущем шаге записей */

UPDATE fine, 
(SELECT name, number_plate, violation, COUNT(*)
FROM fine
GROUP BY name, number_plate, violation
HAVING COUNT(*) >= 2
ORDER BY name, number_plate, violation) AS q
SET fine.sum_fine = 2 * fine.sum_fine
WHERE (fine.name = q.name AND fine.number_plate = q.number_plate AND fine.violation = q.violation) AND date_payment IS NULL = true
