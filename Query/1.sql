USE Hospitalf
GO

SELECT Diagnosis, max(AppointTime) as [last date], COUNT(Diagnosis) as [count]
FROM Appointments
WHERE AppointTime > DATEADD(MONTH, -1, GETDATE())
GROUP BY Diagnosis
