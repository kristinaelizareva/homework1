CREATE VIEW tuta AS
SELECT s.id AS код,COUNT(DISTINCT r.idcl) AS количество , s.sname AS имя
FROM Rez r JOIN Serv s ON r.idserv = s.id
GROUP BY s.sname, s.id
