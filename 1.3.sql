IF OBJECT_ID('trg', 'TR') IS NOT NULL
    DROP TRIGGER trg;
GO

CREATE TRIGGER trg
ON dbo.Rez
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN dbo.Rez r ON i.idem = r.idem AND i.drez = r.drez
        WHERE i.id <> r.id
    )
    BEGIN
        ROLLBACK TRANSACTION;
    END
END;
GO

INSERT INTO dbo.Rez (id, idcl, idem, idserv, iddep, drez)
VALUES (20, 2, 1, 2, 1, '2026-10-01');
GO

INSERT INTO dbo.Rez (id, idcl, idem, idserv, iddep, drez)
VALUES (887, 2, 1, 2, 1, '2030-11-02');
GO

DELETE FROM dbo.Rez WHERE id IN (887, 888);
GO