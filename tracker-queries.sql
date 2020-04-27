--Find hospitals with no cases of COVID-19 and sort by state.
SELECT h.statecode, h.city, h.center_id
FROM hospital h LEFT OUTER JOIN treatment t ON h.center_id = t.treatment_centerid
WHERE t.treatment_centerid is null
ORDER BY h.statecode;
 
--Show the doctors with no current cases.
SELECT DISTINCT d.doctor_id, d.dr_lname, d.dr_fname
FROM doctor d LEFT OUTER JOIN treatment t ON d.doctor_id = t.treatment_drid
WHERE t.treatment_drid is null
ORDER BY d.dr_lname;

--Count the number of released patients.
SELECT COUNT(treatment_status) as released_patients
FROM treatment
WHERE treatment_status = 'released';

--Count the number of deceased patients with "elderly' as a risk factor.
SELECT COUNT(p.patient_id) as elderly_deceased_patients
FROM patient p JOIN treatment t ON p.patient_id = t.patient_id
WHERE treatment_status = 'deceased'
AND risk_factors = 'elderly';

--Count the number of patients without any immediate family members.
SELECT 105 - COUNT(p.patient_id) as patients_without_dependents
FROM patient p, immediate_family f
WHERE p.patient_id = f.patient_id;

--Calculate states with less than 3% death relative to cases (deaths / cases)
SELECT DISTINCT u.statecode, ROUND((u.deaths / u.confirmed)*100,2) as death_rate
FROM uscases u
WHERE (u.deaths / u.confirmed) < '.03' 
ORDER BY death_rate;

--Calculate the number of people at risk of infecting more than one person. (>1 dependent)
SELECT (COUNT(f.patient_id) - COUNT(DISTINCT f.patient_id)) as multiple_dependents
FROM patient p JOIN immediate_family f ON p.patient_id = f.patient_id
WHERE p.patient_id = f.patient_id;

--Find what state & hospital center the patients arriving from restricted locations ended up in.
SELECT DISTINCT h.statecode, h.center_id, r.country
FROM hospital h, restricted_locations r
WHERE h.center_id = r.center_id
ORDER BY r.country;

--Count the number of infected patients below the age of 35.
SELECT COUNT(patient_id) as below_35
FROM patient
WHERE DOB > '14-APR-1985';

--Insert a new doctor named Dr. Leilani Molo who specializes in geriatrics.
INSERT INTO doctor VALUES ('153889','Leilani','Molo','geriatrics');

--Insert a new hospital located in Palos Verdes, California with a center ID of "72903."
INSERT INTO hospital(center_id, city, statecode)
values ('72903', 'Palos Verdes', 'CA');

--Delete this newly inserted hospital.
DELETE from hospital
WHERE center_id = '72903';