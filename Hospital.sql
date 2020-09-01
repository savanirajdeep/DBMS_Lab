create table Doctor(
Doc_ID varchar2(10) constraint docid PRIMARY KEY,
Doc_Name varchar2(20) NOT NULL,
Gender varchar2(1) NOT NULL,
DOB date,
Specialist varchar2(20) NOT NULL,
Qualification varchar2(20) NOT NULL,
Contact number(10),
Address varchar2(200),
Dept_No varchar2(10) NOT NULL,
constraint doc_gender CHECK (Gender IN('M','F','T'))
);

create table Department(
Dept_No varchar2(10),
Dept_Name varchar2(20) NOT NULL,
Room_No number(3),
Floor number(2),
HOD varchar2(20),
Estd_Date date
);

create table Staff(
Staff_ID varchar2(10) constraint staffid PRIMARY KEY,
Staff_Name varchar2(20) NOT NULL,
Catagory varchar2(30) NOT NULL,
Designation varchar2(30) NOT NULL,
DOB date,
Contact number(10),
Address varchar2(200),
Dept_No varchar2(10)
);

create table Patient(
Pat_ID varchar2(10) constraint patient PRIMARY KEY,
Pat_Name varchar2(30) NOT NULL,
DOB date,
Gender varchar2(1) NOT NULL,
Contact number(10),
Address varchar2(300),
constraint pat_gender CHECK (Gender IN('M','F','T'))
);

create table In_Patient(
Pat_ID varchar2(10),
Date_Of_Admission date constraint inpatient PRIMARY KEY,
Bed_No number(4) NOT NULL,
Start_Time date,
End_Time date);
create table In_Patient_Prescription(
Pat_ID varchar2(10),
Pres_ID varchar2(10)
);

create table Appointment(
App_ID varchar2(10)constraint appointment PRIMARY KEY,
Pat_ID varchar2(10),
Doc_ID varchar2(10),
Nurse_ID varchar2(10),
Consault_Room_No number(3) NOT NULL,
Appointment_Date date NOT NULL
);

create table Prescription(
Pres_ID varchar2(10) constraint prescription PRIMARY KEY,
App_ID varchar2(10), 
Appointment_Date date NOT NULL,
Diagnosis_Detail varchar2(30)
);

create table Prescribed_Medicines(
Pres_ID varchar2(10),
Medicine_Name varchar2(30) constraint medicines PRIMARY KEY,
Dosage varchar2(30),
Brand varchar2(30)
);

create table Hospital_Bill(
Inv_No varchar2(10) constraint hospitalbill PRIMARY KEY,
Inv_Date date NOT NULL,
Pat_ID varchar2(10),
Bill_Amount number(10) NOT NULL,
Payment_Type varchar2(15),
discount number(6)
);

create table Lab_Tests(
Test_ID varchar2(10)constraint labtests PRIMARY KEY,
Pat_ID varchar2(10),
Test_Date date NOT NULL
);

create table Test_Results(
Test_ID varchar2(10),
TT_ID varchar2(10),
Test_Result varchar2(20)
);

create table Test_Type(
TT_ID varchar2(10) constraint testtype PRIMARY KEY,
Description varchar2(50),
Low_Value number(5), 
High_Value number(5),
Test_Method varchar2(20),
Technician varchar2(10)
);

/*Altering tables: */

alter table In_Patient ADD FOREIGN KEY (Pat_ID) references Patient(Pat_ID);
alter table In_Patient_Prescription ADD FOREIGN KEY (Pat_ID) references Patient(Pat_ID);
alter table In_Patient_Prescription ADD FOREIGN KEY (Pres_ID) references Prescription(Pres_ID);
alter table Appointment ADD FOREIGN KEY (Pat_ID) references Patient(Pat_ID);
alter table Appointment ADD FOREIGN KEY (Nurse_ID) references Staff(Staff_ID);
alter table Prescription ADD FOREIGN KEY (App_ID) references Appointment(App_ID);
alter table Prescribed_Medicines ADD FOREIGN KEY (Pres_ID) references Prescription(Pres_ID);
alter table Hospital_Bill ADD FOREIGN KEY (Pat_ID) references Patient(Pat_ID);
alter table Lab_Tests ADD FOREIGN KEY (Pat_ID) references Patient(Pat_ID);
alter table Test_Results ADD FOREIGN KEY (Test_ID) references Lab_Tests(Test_ID);
alter table Test_Results ADD FOREIGN KEY (TT_ID) references Test_Type(TT_ID);
alter table Test_Type ADD FOREIGN KEY (Technician) references Staff(Staff_ID);

/*Insurting Values */

insert into Doctor values('D0001','DR.VIJAY','M','12.JAN.1998','NEUROLOGIST','MD',6356170990,'C-202,Golden City, Utran, Surat, Gujarat','DP0001');
insert into Doctor values('D0002','DR.RAJESH','M','25.NOV.1976','NEUROLOGIST','MD',9825818011,'SKY LINE,VARACHHA, SURAT, GUJARAT','DP0001');
insert into Doctor values('D0003','DR.NIKUNJ','M','10.OCT.1990','CARDIOLOGIST','MBBS',8264919423,'RIVER SKY APPARTMENT, SURAT','DP0002');
insert into Doctor values('D0004','DR.LABDHI','F','14.JAN.1989','CARDIOLOGIST','MD',7139913879,'SHAKTI TOWER,VARACHHA, SURAT','DP0002');
insert into Doctor values('D0005','DR.ROHAN','M','10.DEC.1995','ONCOLOGIST','MS',8417918472 ,'AFFILE TOWER APPARTMENT, SURAT','DP0003');
insert into Doctor values('D0006','DR.DISHA','F','21.FEB.19','GENERAL MEDICINE','MBBS',9087163862 ,'JOLLY AVENUE SOCEITY, SURAT','DP0004');
insert into Doctor values('D0007','DR.NIL','M','07.AUG.1995','DIABETOLOGIST','MDS',9409489791,'HAPPY BANGLOWS, SURAT','DP0005');
insert into Doctor values('D0008','DR.ASHA','F','14.JAN.1992','GENERAL MEDICINE','MD',9908812723,'WHITE HOUSE,UTRAN, SURAT','DP0004');

insert into Department values('DP0001','NEUROLOGY',508,5,'D0001','24.JUL.2012');
insert into Department values('DP0001','NEUROLOGY',509,5,'D0002','24.JUL.2012');
insert into Department values('DP0002','CARDIOLOGY',402,4,'D0003','12.JAN.2012');
insert into Department values('DP0002','CARDIOLOGY',401,4,'D0004','12.JAN.2012');
insert into Department values('DP0003','ONCOLOGY',201,2,'D0005','25.MAY.2012');
insert into Department values('DP0004','GENERAL MEDICINE',301,3,'D0006','1.JUN.2012');
insert into Department values('DP0004','GENERAL MEDICINE',305,3,'D0008','1.JUN.2012');
insert into Department values('DP0005','DIABETIC',111,1,'D0007','17.JUL.2012');

insert into Staff values('S0001','NISHA','NURSE','STAFF NURSE','18.DEC.1998',9421862561,'C-123, SKYLINE APPARTMENT ,SURAT','DP0001');
insert into Staff values('S0002','AKASH','ATTENDER','SENIOR ATTENDER','1.FEB.1975',6723846284,'OPERA HOUSE, UTRAN,SURAT','DP0005');
insert into Staff values('S0003','MAHESH','NURSE','HEAD NURSE','25.NOV.1974',8724083672,'VASTU SHILP, UTRAN,SURAT','DP0004');
insert into Staff values('S0004','ANJALI','LAB TECHNICIAN','SENIOR TECHNICIAN','20.JUL.1985',8926738924,'SHREE RECIDANCE ,SURAT','DP0001');
insert into Staff values('S0005','SHREYA','ATTENDER','SENIOR ATTENDER','12.APR.1980',7890653289,'APPLE HEIGHTS , UTRAN,SURAT','DP0001');
insert into Staff values('S0006','AMIT','HELPER','HELPER','20.FEB.1985',7808648192,'DHARM NAGAR,SURAT','DP0004');
insert into Staff values('S0007','SEEMA','LAB TECHNICIAN','JUNIOR TECHNICIAN','19.JAN.1979',8906246381,'SHANKAR SCOIETY, UTRAN,SURAT','DP0003');
insert into Patient values('P0001','RAJDEEP','17.JUL.2002','M',9913218011,'C-202, GOLDEN CITY,SURAT');

insert into Patient values('P0002','SHAKSHI','05.FEB.2003','F',8917283619,'KAMDAR SHOPPING CENTRE,OPP RLY STATION, VILE PARLE');
insert into Patient values('P0003','NEERAJ','10.MAY.1990','M',7806271243,'24,JAWAHAR NAGAR');
insert into Patient values('P0004','ABHISHEK','19.JUN.2000','M',8922453013,'28,BASVESHWAR NAGAR');
insert into Patient values('P0005','ISHA','21.JAN.1998','F',9878987890 ,'13, PATHARI ROAD, ANNASALAI');
insert into Patient values('P0006','RAGHAV','29.NOV.1999','M',9089812723,'3,KESHREE BUILDING,SURAT');
insert into Patient values('P0007','VAIBHAV','17.MAR.2001','M',8912627083,'17-A, VASHI PLAZA,SURAT');
insert into Patient values('P0008','NISHITA','25.DEC.2004','F',9012748234,'DIVYA JYOT,SURAT');
insert into Patient values('P0009','VIKAS','04.OCT.2001','M',8236801623,'D-302,KIRAN APPARTMENT,SURAT');
insert into Patient values('P0010','SARA','10.SEP.2002','F',9090127322,'BHAKTIDHAM SECTOR,SURAT');

insert into In_Patient values('P0001','11.JAN.2020',1,'11.JAN.2020','14.JAN.2020');
insert into In_Patient values('P0003','01.MAY.2020',100,'01.MAY.2020','04.MAY.2020');
insert into In_Patient values('P0005','12.JUL.2019',3,'12.JUL.2019','22.AUG.2019');
insert into In_Patient values('P0008','18.SEP.2019',4,'18.SEP.2019','20.AUG.2019');

insert into Appointment values('A0001','P0001','D0001','S0004',111,'11.JAN.2020');
insert into Appointment values('A0002','P0002','D0003','S0001',201,'12.FEB.2019');
insert into Appointment values('A0003','P0003','D0005','S0002',205,'01.MAY.2020');
insert into Appointment values('A0004','P0004','D0006','S0003',302,'16.JAN.2019');
insert into Appointment values('A0005','P0005','D0007','S0002',102,'12.JUL.2019');
insert into Appointment values('A0006','P0006','D0004','S0001',402,'09.OCT.2019');
insert into Appointment values('A0007','P0007','D0006','S0003',309,'29.NOV.2019');
insert into Appointment values('A0008','P0008','D0002','S0005',506,'18.SEP.2019');
insert into Appointment values('A0009','P0009','D0008','S0006',305,'15.DEC.2019');
insert into Appointment values('A0010','P0010','D0007','S0002',105,'10.APR.2019');

insert into Prescription values('PR0001','A0001','11.JAN.2020','NEURAL ARREST');
insert into Prescription values('PR0002','A0002','12.FEB.2019','CARDIAC ARREST');
insert into Prescription values('PR0003','A0003','01.MAY.2020','BILATERAL PNEUMONIA');
insert into Prescription values('PR0004','A0004','16.JAN.2019','ACCIEDENT');
insert into Prescription values('PR0005','A0005','12.JUL.2019','HIGH DIABETICE');
insert into Prescription values('PR0006','A0006','09.OCT.2019','CARDIAC ARREST');
insert into Prescription values('PR0007','A0007','29.NOV.2019','FEWER');
insert into Prescription values('PR0008','A0008','18.SEP.2019','NEURAL ARREST');
insert into Prescription values('PR0009','A0009','15.DEC.2019','COUGH');
insert into Prescription values('PR0010','A0010','10.APR.2019','DIABETICE REPORT');

insert into In_Patient_Prescription values('P0001','PR0001');
insert into In_Patient_Prescription values('P0002','PR0002');
insert into In_Patient_Prescription values('P0003','PR0003');
insert into In_Patient_Prescription values('P0004','PR0004');
insert into In_Patient_Prescription values('P0005','PR0005');
insert into In_Patient_Prescription values('P0006','PR0006');
insert into In_Patient_Prescription values('P0007','PR0007');
insert into In_Patient_Prescription values('P0008','PR0008');
insert into In_Patient_Prescription values('P0009','PR0009');
insert into In_Patient_Prescription values('P0010','PR0010');

insert into Prescribed_Medicines values('PR0001','ANTI-INFLAMMATORY','TWICE A DAY','MEDIMIND');
insert into Prescribed_Medicines values('PR0002','SPORLAC','ONCE A DAY','CIPLA');
insert into Prescribed_Medicines values('PR0003','RESPIRA','THRICE A DAY','MEDIMIND');
insert into Prescribed_Medicines values('PR0004','CEFIXIZE','TWICE A DAY','CIPLA');
insert into Prescribed_Medicines values('PR0005','TAZAR','ONCE A DAY','MEDICARE');
insert into Prescribed_Medicines values('PR0006','AZITHROMYCIN','TWICE A DAY','CIPLA');
insert into Prescribed_Medicines values('PR0007','REMDESIVIR','TWICE A DAY','MANKIND');
insert into Prescribed_Medicines values('PR0008','EZITHROMYCINE','ONCE A DAY','MEDICARE');
insert into Prescribed_Medicines values('PR0009','DOLO500','THRICE A DAY','MANKIND');
insert into Prescribed_Medicines values('PR0010','ANZITHROMYCINE','TWICE A DAY','CIPLA');

insert into Hospital_Bill values('I0001','31.AUG.2019','P0001',105000,'CARD',10);
insert into Hospital_Bill values('I0002','14.JAN.2020','P0002',23000,'CARD',0);
insert into Hospital_Bill values('I0003','04.MAY.2020','P0003',50000,'CASH',5);
insert into Hospital_Bill values('I0004','16.JAN.2019','P0004',8750,'CASH',0);
insert into Hospital_Bill values('I0005','22.AUG.2019','P0005',10050,'CARD',0);
insert into Hospital_Bill values('I0006','09.OCT.2019','P0006',13500,'CASH',0);
insert into Hospital_Bill values('I0007','29.NOV.2019','P0007',40000,'CASH',0);
insert into Hospital_Bill values('I0008','20.AUG.2019','P0008',87500,'CARD',5);
insert into Hospital_Bill values('I0009','15.DEC.2019','P0009',45000,'CASH',0);
insert into Hospital_Bill values('I0010','09.APR.2019','P0010',23050,'CASH',0);

insert into Lab_Tests values('T0001','P0001','31.AUG.2019');
insert into Lab_Tests values('T0003','P0003','01.MAY.2019');
insert into Lab_Tests values('T0004','P0004','16.JAN.2019');
insert into Lab_Tests values('T0005','P0005','14.JUL.2019');
insert into Lab_Tests values('T0007','P0007','29.NOV.2019');
insert into Lab_Tests values('T0008','P0008','19.SEP.2019');
insert into Lab_Tests values('T0009','P0009','15.DEC.2019');

insert into Test_Type values('TT0001','URINE TEST',0.2,2.3,'LAB TEST','S0004');
insert into Test_Type values('TT0003','XRAY TEST',25,75,'LAB TEST','S0004');
insert into Test_Type values('TT0004','CT TEST',3.2,4.2,'LAB TEST','S0007');
insert into Test_Type values('TT0005','XRAY TEST',4.6,9.8,'LAB TEST','S0007');
insert into Test_Type values('TT0007','XRAY TEST',1.2,3.2,'LAB TEST','S0004');
insert into Test_Type values('TT0008','URINE TEST',3.4,3.9,'LAB TEST','S0007');
insert into Test_Type values('TT0009','CT TEST',0.8,1.4,'LAB TEST','S0007');

insert into Test_Results values('T0001','TT0001','POSITIVE');
insert into Test_Results values('T0003','TT0003','NEGATIVE');
insert into Test_Results values('T0004','TT0004','NEGATIVE');
insert into Test_Results values('T0005','TT0005','POSITIVE');
insert into Test_Results values('T0007','TT0007','POSITIVE');
insert into Test_Results values('T0008','TT0008','NEGATIVE');
insert into Test_Results values('T0009','TT0009','POSITIVE');
