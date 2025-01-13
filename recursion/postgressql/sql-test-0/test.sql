-- Необязательное указание RECURSIVE превращает WITH из просто удобной синтаксической конструкции в средство
-- реализации того, что невозможно в стандартном SQL.
-- Используя RECURSIVE, запрос WITH может обращаться к собственному результату.
-- Очень простой и бесмысленные в целом пример, суммирующий числа от 1 до 100:

WITH RECURSIVE t(n) AS (
    VALUES (1)
  UNION ALL
    SELECT n+1 FROM t WHERE n < 100
)
SELECT sum(n) FROM t;

-- а можно и так


WITH RECURSIVE t(n) AS (
    VALUES (1)
  UNION ALL
    SELECT n+1 FROM t WHERE n < 100
)
SELECT n FROM t;




-- Примерами рекуррентно заданных последовательностей могут быть
-- арифметические
-- геометрические прогрессии,
-- и числа Фибоначчи.

-- вот это очень интересно
-- https://postgrespro.ru/docs/postgresql/17/queries-with
