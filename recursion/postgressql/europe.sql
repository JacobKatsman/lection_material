CREATE TABLE geo (
    id int not null primary key, 
    parent_id int references geo(id),  
    name varchar(1000)
);

INSERT INTO geo 
(id, parent_id, name) 
VALUES 
(1, null, 'Планета Земля'),
(2, 1, 'Континент Евразия'),
(3, 1, 'Континент Северная Америка'),
(4, 2, 'Европа'),
(5, 4, 'Россия'),
(6, 4, 'Германия'),
(7, 5, 'Москва'),
(8, 5, 'Санкт-Петербург'),
(9, 6, 'Берлин');

-- выбираем все что относится к европе

WITH RECURSIVE r AS (
   SELECT id, parent_id, name
   FROM geo
   WHERE parent_id = 4

   UNION

   SELECT geo.id, geo.parent_id, geo.name
   FROM geo
      JOIN r
          ON geo.parent_id = r.id
)

SELECT * FROM r;
