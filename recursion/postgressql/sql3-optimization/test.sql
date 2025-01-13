CREATE OR REPLACE TEMP VIEW некоеимя AS (
    -- тут у нас подзапрос
);
WITH RECURSIVE prior AS (
    SELECT … FROM некоеимя WHERE …некий критерий…
    UNION ALL
    SELECT … FROM некоеимя INNER JOIN prior …критерий соединения…
)
SELECT … FROM prior…

-- https://bolknote.ru/all/4438/
-- https://sql-ex.ru/blogs/?/Sozdanie_bazy_dannyh_i_tablic_v_PostgreSQL_Izuchenie_PostgreSQL_s_Grant_Fritchey.html
