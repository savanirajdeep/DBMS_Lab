--Find the details of all doctors.
select * from Doctor;

--Display all the hospital bill details. 
select * from Hospital_Bill;

--List the doctors who are specialized in ‘Cardiology’ and ‘Neurology’ 
select * from Doctor where Specialist=’CARDIOLOGIST’ or Specialist= ‘NEUROLOGIST’;

--List all the appointments made for consultation room number 111, on ’11-Jan2020’. 
select * from Appointment where Consault_Room_No=’111’and Appointment_Date=’11.JAN.2020’;

--Display all the test types that have the values in the range of 25 and 75. 
select * from Test_Type where Low_Value>’20’ and High_Value<’80’;

--Find the diagnosis details of the patient with prescription id ‘PR0004’
select * from Prescription where Pres_ID=’PR0004’; 

--Display the name of the patients whose gender is female or the contact number is 9878987890. 
select * from Patient where Gender=’F’ and Contact=’9878987890’;

--Find the staff name and staff id who are not working in the department ‘D0002’
select Staff_ID,Staff_Name from Staff where Dept_No!=’D0002’;

--Find the patients who are admitted on ’01-May-2020’ in the bed 100.
select * from In_Patient where Date_Of_Admission=’01.MAY.2020’ and Bed_No=’100’;

--Delete the test results that are ‘Positive’
select * from Test_Results where Test_Result=’POSITIVE’;

--Change the HOD of cardiology department with doctor ‘D0003’ 
update Department set HOD=’D0003’ where Dept_Name=’CARDIOLOGY’;

--Delete the prescribed medicines records that have the brand name ‘MEDICARE’ 
delete from Prescribed_Medicines where Brand=’MEDICARE’;

--Modify the low value and high value to 10 and 30 respectively for the clinical test ‘urine’ 
update Test_Type set Low_Value=’10’ where Description=’URINE TEST’;
update Test_Type set High_Value=’30’ where Description=’URINE TEST’;

--Update the contact number of all staffs who are in the category ‘Nurse’ 
update Staff set Contact=’8917814273’ where Category=’NURSE’;

