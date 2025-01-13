WITH RECURSIVE Ancestors AS (
    SELECT id, parent_id FROM YourTable WHERE id = {item_id} -- Ваша отправная точка
    UNION ALL
    SELECT yt.id, yt.parent_id FROM YourTable yt
    JOIN Ancestors ON yt.id = Ancestors.parent_id -- Работает как машина времени
)
SELECT * FROM Ancestors WHERE id != {item_id}; -- Выводим всех предков, исключая исходный элемент!


--http://techn.sstu.ru/kafedri/%D0%BF%D0%BE%D0%B4%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F/1/MetMat/shaturn/theoralg/8.htm
