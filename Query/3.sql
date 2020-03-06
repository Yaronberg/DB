USE Hospitala
GO

SELECT dr.DoctorName, dp.DepartName, wh.StartBreak, DATEDIFF(MINUTE, StartBreak, EndBreak) as duration, wh.EndBreak
FROM WorkHours AS wh 
INNER JOIN Doctors AS dr 
    ON dr.DoctorID = wh.Doctor
INNER JOIN Departments AS dp 
    ON dp.DepartID = dr.Depart
WHERE DATEDIFF(MINUTE, StartBreak, EndBreak) > 30
ORDER BY duration DESC