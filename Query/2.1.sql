USE Hospitala
GO

SELECT dp.DepartID,
 WH.Doctor,
SUM(DATEDIFF(HH, StartWD , EndWH) - (DATEDIFF(MINUTE, StartBreak, EndBreak) / 60.0)) AS [total hours]
FROM WorkHours as WH
INNER JOIN Doctors as Dr
	ON Dr.DoctorID = WH.Doctor
INNER JOIN Departments AS dp
	ON Dr.Depart = dp.DepartID
WHERE wh.StartWD > DATEADD(m, -3, GETDATE())
group by dp.DepartID,
WH.Doctor
order by dp.DepartID, [total hours] desc
