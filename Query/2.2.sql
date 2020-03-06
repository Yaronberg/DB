USE Hospitala 
GO

SELECT TOP 1 Diagnosis, count (Diagnosis) as [Count]
FROM Appointments
WHERE AppointTime > DATEADD(m, -3, GETDATE())
GROUP BY Diagnosis
ORDER BY [Count] desc