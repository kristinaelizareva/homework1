IF OBJECT_ID('tempdb..#vremenay') IS NOT NULL
    DROP TABLE #vremenay;

CREATE TABLE #vremenay (
    id_doctor   INT,
    doctor_name VARCHAR(100),
    id_dep      INT,
    dep_name    VARCHAR(100),
    id_serv     INT,
    serv_name   VARCHAR(100),
    serv_price  MONEY
);
INSERT INTO #vremenay ( id_doctor, doctor_name, id_dep, dep_name, id_serv, serv_name, serv_price)
SELECT e.id AS id_doctor, e.fam AS doctor_name, d.id AS id_dep, d.dapname AS dep_name, s.id AS id_serv, s.sname AS serv_name, s.mon AS serv_price
FROM Rez r JOIN Em e ON r.idem = e.id JOIN Dep d ON r.iddep = d.id JOIN Serv s ON r.idserv = s.id;
DECLARE @vre TABLE (
    id_doctor   INT,
    doctor_name VARCHAR(100),
    id_dep      INT,
    dep_name    VARCHAR(100),
    id_serv     INT,
    serv_name   VARCHAR(100),
    serv_price  MONEY
);

INSERT INTO @vre ( id_doctor, doctor_name, id_dep, dep_name, id_serv, serv_name, serv_price)
SELECT e.id AS id_doctor, e.fam AS doctor_name, d.id AS id_dep, d.dapname AS dep_name, s.id AS id_serv, s.sname AS serv_name, s.mon AS serv_price
FROM Rez r JOIN Em e ON r.idem = e.id JOIN Dep d ON r.iddep = d.id JOIN Serv s ON r.idserv = s.id;

SELECT * FROM #vremenay;
SELECT * FROM @vre;