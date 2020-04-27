/************************************************************************/
/*																		*/
/*	Alexis Price & Kelly Kang					                        */
/*	4480 Final Project              									*/
/*																		*/
/************************************************************************/

DROP TABLE hospital CASCADE CONSTRAINTS;
CREATE TABLE hospital (
    center_id      char(5), 
    city          varchar2(30),
    statecode     varchar2(2) not null,
    primary key   (center_id)
);

DROP TABLE doctor CASCADE CONSTRAINTS;
CREATE TABLE doctor (
    doctor_id    char(6),
    dr_fname     varchar2(20) not null,
    dr_lname     varchar2(20) not null,
    specialty   varchar2(30),
    primary key (doctor_id)
);

DROP TABLE treatment CASCADE CONSTRAINTS;
CREATE TABLE treatment (
    patient_id    char(8),
    treatment_drid char(6),
    treatment_centerid char(8),
    treatment_status varchar2(20)
);

DROP TABLE uscases CASCADE CONSTRAINTS;
CREATE TABLE uscases (
    statecode     varchar2(2),
    confirmed     number(8),
    deaths        number(8),
    primary key (statecode)
);

DROP TABLE patient CASCADE CONSTRAINTS;
CREATE TABLE patient (
  patient_id char(8),
  patient_fname    varchar2(20) not null, 
  patient_lname    varchar2(20) not null, 
  DOB   date,
  Arrival_from char(3),
  risk_factors varchar2(20),
  primary key (patient_id)
);

DROP TABLE immediate_family CASCADE CONSTRAINTS;
CREATE TABLE immediate_family (
    patient_id char(8),
    relation_id char(9),
    relationship varchar2(15) not null,
    DOB   date,
    f_name varchar2 (20) not null,
    l_name varchar2 (20) not null,
    primary key (relation_id),
    foreign key (patient_id) references patient(patient_id)
);

DROP TABLE restricted_locations CASCADE CONSTRAINTS;
CREATE TABLE restricted_locations (
    country varchar2(20),
    country_code char(3),
    patient_id char(8),
    center_id char(5),
    date_of_arrival date,
    primary key (country),
    foreign key (patient_id) references patient(patient_id),
    foreign key (center_id) references hospital(center_id)
);
