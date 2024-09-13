/* 7.   Вывести список людей, не являющихся или не являвшихся студентами ФКТИУ (данные, о которых отсутствуют в таблице Н_УЧЕНИКИ). В запросе нельзя использовать DISTINCT.
*/


SELECT Н_ЛЮДИ.ИД,
       Н_ЛЮДИ.ФАМИЛИЯ,
       Н_ЛЮДИ.ИМЯ,
       Н_ЛЮДИ.ОТЧЕСТВО
FROM Н_ЛЮДИ
WHERE NOT EXISTS (
    SELECT *
    FROM Н_УЧЕНИКИ
        JOIN Н_ПЛАНЫ ON Н_УЧЕНИКИ.ПЛАН_ИД = Н_ПЛАНЫ.ИД
        JOIN Н_ОТДЕЛЫ ON Н_ПЛАНЫ.ОТД_ИД = Н_ОТДЕЛЫ.ИД
            AND Н_ОТДЕЛЫ.КОРОТКОЕ_ИМЯ = 'КТиУ'
    WHERE Н_УЧЕНИКИ.ЧЛВК_ИД = Н_ЛЮДИ.ИД);