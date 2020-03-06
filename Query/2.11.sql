USE Hospitala
GO

select DepartID, max([hours]) as [hours]
from
(
SELECT dp.DepartID,
 WH.Doctor,
SUM(DATEDIFF(HH, StartWD , EndWH) - (DATEDIFF(MINUTE, StartBreak, EndBreak) / 60.0)) AS [hours]
FROM WorkHours as WH
INNER JOIN Doctors as Dr
	ON Dr.DoctorID = WH.Doctor
INNER JOIN Departments AS dp
	ON Dr.Depart = dp.DepartID
WHERE wh.StartWD > DATEADD(m, -5, GETDATE())
GROUP BY dp.DepartID, WH.Doctor
--ORDER BY dp.DepartID, [total hours] desc
) as ada,
WorkHours
group by DepartID
order by  DepartID, [hours] desc