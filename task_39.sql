/* Занести в таблицу fine суммы штрафов, 
которые должен оплатить водитель, в соответствии с данными из таблицы traffic_violation. 
При этом суммы заносить только в пустые поля столбца  sum_fine */

UPDATE fine, traffic_violation AS tf
SET fine.sum_fine =  tf.sum_fine
WHERE fine.sum_fine IS NULL = true AND (fine.violation = tf.violation)
