-- foreign keys
ALTER TABLE Bookings
    DROP CONSTRAINT Bookings_Instructor;

ALTER TABLE Bookings
    DROP CONSTRAINT Bookings_LessonType;

ALTER TABLE Bookings
    DROP CONSTRAINT Bookings_Student;

ALTER TABLE Bookings
    DROP CONSTRAINT Bookings_Vehicle;

ALTER TABLE Results
    DROP CONSTRAINT Results_Student;

-- tables
DROP TABLE Bookings;--leson

DROP TABLE Instructor;

DROP TABLE LessonType;

DROP TABLE Results;

DROP TABLE Student;

DROP TABLE Vehicle;

-- End of file.



-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-01-14 17:42:08.916

-- tables
-- Table: Bookings
CREATE TABLE Bookings ( --lesson
    Booking_id integer  NOT NULL,
    Booking_Date varchar2(30)  NOT NULL,
    Student_id integer  NOT NULL,
    Lesson_id integer  NOT NULL,
    Instructor_id integer  NOT NULL,
    Vehicle_id integer  NOT NULL,
    CONSTRAINT Bookings_pk PRIMARY KEY (Booking_id)
) ;

-- Table: Instructor
CREATE TABLE Instructor (
    Instructor_id integer  NOT NULL,
    FirstName varchar2(30)  NOT NULL,
    LastName varchar2(30)  NOT NULL,
    DateOfBirth varchar2(30)  NOT NULL,
    PhoneNumber integer ,
    Address varchar2(30)  NOT NULL,
    Country varchar2(30)  NOT NULL,
    Salary INTEGER not null,
    CONSTRAINT Instructor_pk PRIMARY KEY (Instructor_id)
) ;

-- Table: LessonType
CREATE TABLE LessonType (
    Lesson_id integer  NOT NULL,
    TypeName varchar2(30)  NOT NULL,
    Price integer  NOT NULL,
    ShortDescr  varchar2(30)  NOT NULL,
    CONSTRAINT LessonType_pk PRIMARY KEY (Lesson_id)
) ;

-- Table: Results
CREATE TABLE Results (
    Result_id integer  NOT NULL,
    Grade integer  NOT NULL,
    Feedback varchar2(30)  NOT NULL,
    Student_id integer  NOT NULL,
    CONSTRAINT Results_pk PRIMARY KEY (Result_id)
) ;

-- Table: Student
CREATE TABLE Student (
    Student_id integer  NOT NULL,
    FirstName varchar2(30)  NOT NULL,
    LastName varchar2(30)  NOT NULL,
    Age integer  NOT NULL,
    PhoneNumber integer  NOT NULL,
    Address varchar2(30)  NOT NULL,
    Country varchar2(30)  NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY (Student_id)
) ;

-- Table: Vehicle
CREATE TABLE Vehicle (
    Vehicle_id integer  NOT NULL,
    Model varchar2(30)  NOT NULL,
    ShortDescr  varchar2(30)  NOT NULL,
    CONSTRAINT Vehicle_pk PRIMARY KEY (Vehicle_id)
) ;

-- foreign keys
-- Reference: Bookings_Instructor (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_Instructor
    FOREIGN KEY (Instructor_id)
    REFERENCES Instructor (Instructor_id);

-- Reference: Bookings_LessonType (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_LessonType
    FOREIGN KEY (Lesson_id)
    REFERENCES LessonType (Lesson_id);

-- Reference: Bookings_Student (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_Student
    FOREIGN KEY (Student_id)
    REFERENCES Student (Student_id);

-- Reference: Bookings_Vehicle (table: Bookings)
ALTER TABLE Bookings ADD CONSTRAINT Bookings_Vehicle
    FOREIGN KEY (Vehicle_id)
    REFERENCES Vehicle (Vehicle_id);

-- Reference: Results_Student (table: Results)
ALTER TABLE Results ADD CONSTRAINT Results_Student
    FOREIGN KEY (Student_id)
    REFERENCES Student (Student_id);

-- End of file.
select*  from Student
order by age asc;
Insert into Student values(1,'Sam','Smith',16,690390,'Green Street 55','USA');
Insert into Student values(2,'Kate','Smith',26,564575,'Black Street 525','Polans');
Insert into Student values(3,'Josh','Black',20,575757,'Pink Street 32','Germany');
Insert into Student values(4,'Lisa','Pink',33,444440,'Gray Street 45','Hungary');
Insert into Student values(5,'Sugar','Depp',32,2222222,'Strawberry Street 65','Austria');
Insert into Student values(6,'Bred','Pit',43,3333333,'Blue Street 78','Russia');
Insert into Student values(7,'Angelina','Joley',18,555555,'Orange Street 89','Korea');
Insert into Student values(8,'Andrew','Skott',17,7878787,'Yellow Street 344','Japan');
Insert into Student values(9,'Andrew','Skott',24,7878787,'Yellow Street 344','Japan');
Insert into Student values(10,'Ann','Brown',33,5645656,'Paper Street 567','Swiss');
Insert into Student values(11,'Will','Jones',26,567667,'Yellow Street 344','Japan');
Insert into Student values(12,'Andrew','Skott',19,5675676,'Yellow Street 344','Japan');

select* from Instructor;
Insert into Instructor  values(0,'Nick','Jonas','1967/02/15',690390,'Pen Street 55','Poland',2000);
Insert into Instructor  values(2,'Dmitri','Ololo','1975/05/30',567655,'Coffee Street 55','USA',1000);
Insert into Instructor  values(3,'Emil','Miller','1987/08/12',null,'Coffee Street 99','USA',3000);
Insert into Instructor  values(4,'Bill','David','1990/06/25',7868576,'Coffee Street 09','USA',4000);
Insert into Instructor  values(5,'Patrick','Lee','1995/05/30',null,'Coffee Street 55','USA',1200);
Insert into Instructor  values(6,'Dmitri','Pole','1975/05/30',567655,'Coffee Street 121','Italy',900);
Insert into Instructor  values(7,'Alex','Jonson','1995/09/10',null,'aoalaol street 121','France',2500);


select* from LessonType;
insert into lessonType values(1,'Categoty A',2500,'Motorcycles');
insert into lessonType values(2,'Categoty B',3500,'Cars');
insert into lessonType values(3,'Categoty C',4000,'Large Vehicle');
insert into lessonType values(4,'Categoty D',2500,'Buses');

select* from results;
insert into results values(1,2,'bad',4);
insert into results values(2,3,'not bad',1);
insert into results values(3,4,'good',2);
insert into results values(4,4,'good',3);
insert into results values(5,5,'very good',5);
insert into results values(6,3,'not bad',6);
insert into results values(7,4,'good',7);
insert into results values(8,5,'very good',8);
insert into results values(9,2,'bad',10);

select* from student s, results r
where s.student_id=r.student_id;

select* from vehicle;
insert into vehicle values(1,'bmw','car');
insert into vehicle values(2,'tayota','car');
insert into vehicle values(3,'mercedes','car');
insert into vehicle values(4,'motoName1','motorcycle');
insert into vehicle values(5,'bmw','car');
insert into vehicle values(6,'lambo','car');
insert into vehicle values(7,'BusName1','bus');
insert into vehicle values(8,'truck','large vehicle');

select* from bookings;
insert into bookings values(1,'2021-05-12',11,2,3,1);

--------------PL\SQl triggers and procedures-------------------------------------------------------

--1) procedure noNumber shows instructors name without number from given country as a parameter
set serveroutput on;

CREATE OR REPLACE PROCEDURE noNUMBER(countryy instructor.country%type)
as
noCountry exception;
cursor person is select firstname, lastname from instructor where phonenumber is null and country=countryy;
firstName varchar2(15);
lastName varchar2(15);
nOfCountry number(10);
BEGIN
select count(instructor_id) into nOfCountry from instructor where country=countryy;
if nOfCountry=0 then raise noCountry;
else
open person;
loop fetch person into firstName, lastName;
exit when person%notfound;
DBMS_OUTPUT.PUT_LINE('Name of the instructor '|| firstName||' ' ||lastName);
END LOOP;
close person;
END IF;
EXCEPTION
WHEN noCountry THEN
DBMS_OUTPUT.PUT_LINE('NO country called '|| countryy);
END;

exec noNumber('France');
select firstname, lastname, phonenumber , country from instructor;

    
--2) procedure feedbackChg changes the feedback of the student with 'not bad' feedback to 'good'
create or replace procedure feedbackChg
as
    noFeedback exception;
    fnumber int;
    cursor result is select result_id from results where feedback='not bad';
    resultsId int;
begin
    select count(result_id) into fnumber from results where feedback='not bad';
    if fnumber=0 then raise noFeedback;
    else
        open result;
        loop
        fetch result into resultsId;
        exit when result%notfound;
        update results set feedback='good' where result_id =resultsId;
        end loop;
    END if;
    CLOSE RESULT;
exception when noFeedback then
    DBMS_OUTPUT.PUT_LINE('No such feedback');
end;
select * from results;
exec feedbackchg;

--3) procedure changeAddres changes address of the student with name of a first parameter to the given as second parameter address
create or replace procedure changeAddres(studentName varchar2, addressSt varchar2)
as
cursor person is select student_id from student where firstname=studentName;
idperson number;
noStudent exception;
nOfStudent int;
begin
select count(student_id) into nOfStudent from student  where firstname=studentName;
if nOfStudent=0 then raise noStudent;
else
open person;
loop
fetch person into idperson;
exit when person%notfound;
update student set address=addressSt where student_id=idperson;
end loop;
end if;
close person;
exception when noStudent then
 DBMS_OUTPUT.PUT_LINE('No students found');
end;

exec changeAddres('Lisa','Watwerrrrr');
select firstname, address from student;





--this trigger shows students with age>18;
create or replace trigger StudentAge
after insert or update
on student
declare
noStudent exception;
cursor s is select student_id from student where age>18;
nOfStudents integer;
stId integer;
begin 
select count(student_id) into nOfStudents from student where age>18;
if nOfStudents=0 then raise noStudent;
else
open s;
loop
fetch s into stId;
exit when s%notfound;
dbms_output.put_line('Student with id '||stId||' is older 18');
end loop;
end if;
close s;
exception when noStudent then dbms_output.put_line('There is no one older then 18');
end;

update student set age=11 where student_id=5;
select age from student;





--1) Trigger will show the salary difference between old and new salary for instructoe who is from USA
Create or replace trigger SalDifference
before update or insert
on Instructor
For each row
declare
noInstr exception;
nOfInstr int;
salDiff integer;
cursor inst is select INSTRUCTOR_ID from instructor where country='USA';
InstID instructor.instructor_id%type;
begin
select count(instructor_id) into nOfInstr from Instructor where country='USA';
if nOfInstr=0 then raise noInstr;
else
open inst;
loop
fetch inst into InstId;
Exit when inst%notfound;
salDiff:= :NEW.salary  - :OLD.salary;
DBMS_OUTPUT.PUT_LINE('Old Salary of instructor with id '||instId||' is ' ||:old.salary);
DBMS_OUTPUT.PUT_LINE('New Salary of instructor with id '||instId||' is ' ||:new.salary);
DBMS_OUTPUT.PUT_LINE('Salary difference of instructor with id '||instId||' is ' ||salDiff);
END LOOP;
close inst;
end if;
exception when noInstr then DBMS_OUTPUT.PUT_LINE('NO instructor from USA');
end;
drop trigger SalDifference;

update instructor set salary=salary+100  where country='Italy';
set serveroutput on;
SELECT* FROM INSTRUCTOR;
Insert into Instructor  values(6730030860,'Dmitri','Pole','1975/05/30',567655,'Coffee Street 121','USA',8800);

-- while adding a new record to the instructor it will check for a duplicate ofphone number and if found will print that there is already such number
create or replace trigger checkDupName
before insert
on Instructor
for each row
declare
    phnumber instructor.phonenumber%type;
    nOfInstr int;
    noInstr exception;
    cursor i is select instructor_id from instructor;
    InstrId int;
begin
select count(instructor_id) into nOfInstr from instructor;
if nOfInstr=0 then raise noInstr;
else
open i;
loop
fetch i into InstrId;
exit when i%notfound;
select phonenumber into phnumber from instructor where instructor_id=InstrId;
if phnumber=:new.phonenumber then  DBMS_OUTPUT.PUT_LINE('There is already same number');
end if;
end loop;
close i;
end if;
exception when noInstr then DBMS_OUTPUT.PUT_LINE('No any instructor');
end;

select * from instructor;


    





































