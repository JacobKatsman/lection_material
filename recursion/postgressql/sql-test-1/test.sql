--
--  В рекурсивной части CTE обязательно должна быть стартовая часть и рекурсивная часть, разделенные словом UNION. 
--

--
-- FROM r не выполняет весь запрос снова, а работает так: в первый раз берет то, что в стартовой части рекурсии (anchor),
-- а в следующие итерации берет результаты предыдущей итерации. 
--

-- https://habr.com/ru/companies/postgrespro/articles/318398/


WITH RECURSIVE r AS (
    -- стартовая часть рекурсии (т.н. "anchor")
    SELECT 
        1 AS i, 
        1 AS factorial
    UNION 
    -- рекурсивная часть 
    SELECT 
        i+1 AS i, 
        factorial * (i+1) as factorial 
    FROM r
    WHERE i < 10
)
SELECT * FROM r;


-- но обычно делается так:


WITH RECURSIVE t(n,factorial) AS (
  VALUES (0,1)
  UNION ALL
  SELECT t.n+1, t.factorial*(t.n+1) FROM t WHERE t.n < 5
)

SELECT * FROM t;
