USE Hospitala
GO

select (select count(AppointTime) from Appointments where DATEPART(HOUR, AppointTime) Between 7 and 10 ) as [7-10],
(select count(AppointTime) from Appointments where DATEPART(HOUR, AppointTime) Between 10 and 13 ) as [10-13],
(select count(AppointTime) from Appointments where DATEPART(HOUR, AppointTime) Between 13 and 16 ) as [13-16],
(select count(AppointTime) from Appointments where DATEPART(HOUR, AppointTime) Between 16 and 19 ) as [16-19]