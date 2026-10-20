SELECT e.id,e.fam AS Фамилия,COUNT(DISTINCT r.idcl) AS Количество
FROM dbo.Em e JOIN dbo.Rez r ON e.id = r.idem
GROUP BY e.id,e.fam
