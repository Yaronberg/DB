USE Hospitala
GO

select Doctor, count (Patient) [number of patients], 
round (  cast( count(Patient) as float (5)) / DATEDIFF(MONTH, MIN(AppointTime), GETDATE() ),   2) as [avg patient per month]
FROM Appointments
group by Doctor
order by [avg patient per month] desc