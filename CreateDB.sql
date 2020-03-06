CREATE DATABASE Hospitala;
GO

USE Hospitala;
GO 

CREATE TABLE Departments 
(
    DepartID INT IDENTITY,
    DepartName NVARCHAR(50) NOT NULL,
	PRIMARY KEY (DepartID)
);
 
CREATE TABLE Doctors 
(
	DoctorID INT IDENTITY,
    DoctorName NVARCHAR(100)  NOT NULL,
    Specialty NVARCHAR(50)  NOT NULL,
    Birthday DATE NOT NULL,
    Depart INT,
	PRIMARY KEY (DoctorID),
	FOREIGN KEY (Depart) REFERENCES Departments(DepartID)
);
 
CREATE TABLE Patients 
(
    PatientID INT IDENTITY,
    PatientName NVARCHAR(100) NOT NULL,
    Brithday DATE NOT NULL,
	PRIMARY KEY (PatientID)
);

CREATE TABLE DurationsAppoint
(
	DurationID INT IDENTITY, 
	Duration INT,
	PRIMARY KEY (DurationID),
	CHECK (Duration = 10 OR Duration = 20 OR Duration = 30)
);

CREATE TABLE Appointments 
(
    AppointID INT IDENTITY,
    Doctor INT NOT NULL,
    Patient INT NOT NULL,
    AppointTime DATETIME NOT NULL,
    Duration INT NOT NULL,
    Diagnosis NVARCHAR(50),
	PRIMARY KEY (AppointID),
	FOREIGN KEY (Doctor) REFERENCES Doctors (DoctorID),
	FOREIGN KEY (Patient) REFERENCES Patients (PatientID),
	FOREIGN KEY (Duration) REFERENCES DurationsAppoint(DurationID)
);
 
CREATE TABLE WorkHours 
(
	WorkHoursID INT IDENTITY,
    Doctor INT,
    StartWD DATETIME NOT NULL,
	EndWH DATETIME NOT NULL,
    StartBreak TIME,
    EndBreak TIME ,
	PRIMARY KEY (WorkHoursID),
	FOREIGN KEY (Doctor) REFERENCES Doctors(DoctorID)
);
GO