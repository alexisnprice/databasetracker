/************************************************************************/
/*																		*/
/*	Alexis Price & Kelly Kang					                        */
/*																		*/
/*	4480 Final Project              									*/
/*																		*/
/************************************************************************/

--DROP TABLE hospital CASCADE CONSTRAINTS;
CREATE TABLE hospital (
    centerid      number(8), 
    city          varchar2(30),
    statecode     varchar2(2),
    primary key   (centerid),
    foreign key   (treatment_center) references hospital(centerid)
);

DROP TABLE doctor CASCADE CONSTRAINTS;
CREATE TABLE doctor (
    doctorid    number(8),
    drfname     varchar2(20),
    drlname     varchar2(20),
    specialty   varchar2(30),
    primary key (doctorid),
    foreign key (treatment_dr) references doctor(doctorid)
);

DROP TABLE treatment CASCADE CONSTRAINTS;
CREATE TABLE treatment (
    treatment_dr number(8),
    treatment_center number(8),
    patientid   number(8),
    treatmentstatus varchar2(20)
);

DROP TABLE uscases CASCADE CONSTRAINTS;
CREATE TABLE uscases (
    city          varchar2(30),
    statecode     varchar2(2),
    active        number(8),
    recovered     number(8),
    deaths        number(8),
    primary key (statecode)
    /*just do state not city? alter after */
);