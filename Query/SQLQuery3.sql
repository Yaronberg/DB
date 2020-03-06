USE ISDHospital
GO

SELECT dr.firstName, count(ap.doctor) AS [patients],
(count(ap.doctor)) / 12.0 AS [среднее число пациентов в мес€ц]
FROM appointment AS ap
INNER JOIN doctor AS dr
  ON  ap.doctor = dr.doctorID
GROUP BY  ap.doctor, dr.firstName
ORDER BY count(ap.doctor) DESC