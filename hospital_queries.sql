-- Question 1: Which SQL statement is used to modify existing data in a table?
-- Answer: B) UPDATE

-- Question 2: What keyword is used to sort the result set in SQL?
-- Answer: B) ORDER BY

-- Question 3: Write a query to select the names and insurance ids of all patients in the Patient table.
SELECT name, InsuranceID FROM Patient;

-- Question 4: How would you retrieve the details of doctors from the Physician table whose position is ‘Surgical Attending Physician’?
SELECT * FROM Physician WHERE position = 'Surgical Attending Physician';

-- Question 5: Write a query to find the total number of patients in the Patient table.
SELECT COUNT(*) AS total_patients FROM Patient;

-- Question 6: What is the primary affiliated physician for each department?
-- Hint: use following tables: Physician, Department, Affiliated_With
SELECT Department.name AS Department_Name, Physician.name as Physician_Name
FROM department
JOIN Affiliated_With ON Department.DepartmentID = Affiliated_With.Department
JOIN Physician ON Affiliated_With.Physician = Physician.EmployeeID
WHERE Affiliated_With.PrimaryAffiliation = TRUE;

-- Question 7: How many patients are assigned to each physician in the Appointment table?
SELECT Physician, COUNT(Patient) AS patient_count
FROM Appointment
GROUP BY Physician;

-- Question 8: Write a query to list all appointments along with the names of the patients and their doctors.
SELECT Appointment.AppointmentID, Patient.name AS patient_name, Physician.name AS Doctor_name
FROM Appointment
JOIN Patient ON Appointment.Patient = Patient.SSN
JOIN Physician ON Appointment.Physician = Physician.EmployeeID

-- Question 9: Write a query to find the names of patients who have more than one appointment.
SELECT Patient.name AS patient_name
FROM Appointment
JOIN Patient ON Appointment.Patient = Patient.SSN
GROUP BY Patient.name
HAVING COUNT(Appointment.AppointmentID) > 1;

-- Question 10: How would you find the name of the patient and the medication name that is given to them?
-- Hint: use Patient, Prescribes, Medication tables
SELECT Patient.name AS patient_name, Medication.name AS medication_name
FROM Prescribes
JOIN Patient ON Prescribes.Patient = Patient.SSN
JOIN Medication ON Prescribes.Medication = Medication.Code