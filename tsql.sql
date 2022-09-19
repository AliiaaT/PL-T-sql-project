-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-01-16 05:09:18.174

-- foreign keys
ALTER TABLE Lesson DROP CONSTRAINT Lesson_Instructor;

ALTER TABLE Lesson DROP CONSTRAINT Lesson_LessonType;

ALTER TABLE Lesson DROP CONSTRAINT Lesson_Student;

ALTER TABLE Lesson DROP CONSTRAINT Lesson_Vehicle;

ALTER TABLE Results DROP CONSTRAINT Results_Student;

-- tables
DROP TABLE Instructor;

DROP TABLE Lesson;

DROP TABLE LessonType;

DROP TABLE Results;

DROP TABLE Student;

DROP TABLE Vehicle;

-- End of file.



-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-01-16 05:09:18.174

-- tables
-- Table: Instructor
CREATE TABLE Instructor (
    Instructor_id int  NOT NULL,
    FirstName char(30)  NOT NULL,
    LastName char(30)  NOT NULL,
    DateOfBirth char(30)  NOT NULL ,
    PhoneNumber int  NOT NULL,
    Address char(30)  NOT NULL,
    Country char(30)  NOT NULL,
    CONSTRAINT Instructor_pk PRIMARY KEY  (Instructor_id)
);

-- Table: Lesson
CREATE TABLE Lesson (
    lesson_id int  NOT NULL,
    lesson_Date char(30)  NOT NULL,
    LessonType_id int  NOT NULL,
    Vehicle_id int  NOT NULL,
    Instructor_id int  NOT NULL,
    Student_id int  NOT NULL,
    CONSTRAINT Lesson_pk PRIMARY KEY  (lesson_id)
);

-- Table: LessonType
CREATE TABLE LessonType (
    LessonType_id int  NOT NULL,
    CategoryName char(30)  NOT NULL,
    Price int  NOT NULL,
	LessonTypeName char(30)  NOT NULL,

    CONSTRAINT LessonType_pk PRIMARY KEY  (LessonType_id)
);

-- Table: Results
CREATE TABLE Results (
    Result_id int  NOT NULL,
    Grade int  NOT NULL,
    Feedback char(30)  NOT NULL,
    Student_id int  NOT NULL,
    CONSTRAINT Results_pk PRIMARY KEY  (Result_id)
);

-- Table: Student
CREATE TABLE Student (
    Student_id int  NOT NULL,
    FirstName char(30)  NOT NULL,
    LastName char(30)  NOT NULL,
    Age int  NOT NULL,
    PhoneNumber int  NOT NULL,
    Address char(30)  NOT NULL,
    Country char(30)  NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY  (Student_id)
);

-- Table: Vehicle
CREATE TABLE Vehicle (
    Vehicle_id int  NOT NULL,
    Model char(30)  NOT NULL,
    shortDesc char(30)   NOT NULL,
    CONSTRAINT Vehicle_pk PRIMARY KEY  (Vehicle_id)
);

-- foreign keys
-- Reference: Lesson_Instructor (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_Instructor
    FOREIGN KEY (Instructor_id)
    REFERENCES Instructor (Instructor_id);

-- Reference: Lesson_LessonType (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_LessonType
    FOREIGN KEY (LessonType_id)
    REFERENCES LessonType (LessonType_id);

-- Reference: Lesson_Student (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_Student
    FOREIGN KEY (Student_id)
    REFERENCES Student (Student_id);

-- Reference: Lesson_Vehicle (table: Lesson)
ALTER TABLE Lesson ADD CONSTRAINT Lesson_Vehicle
    FOREIGN KEY (Vehicle_id)
    REFERENCES Vehicle (Vehicle_id);

-- Reference: Results_Student (table: Results)
ALTER TABLE Results ADD CONSTRAINT Results_Student
    FOREIGN KEY (Student_id)
    REFERENCES Student (Student_id);

-- End of file.

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
Insert into Instructor  values(1,'Nick','Jonas','1967/02/15',690390,'Pen Street 55','Poland');
Insert into Instructor  values(2,'Dmitri','Ololo','1975/05/30',567655,'Coffee Street 55','USA');
Insert into Instructor  values(3,'Emil','Miller','1987/08/12',45645655,'Coffee Street 99','USA');
Insert into Instructor  values(4,'Bill','David','1990/06/25',7868576,'Coffee Street 09','USA');
Insert into Instructor  values(5,'Patrick','Lee','1995/05/30',567655,'Coffee Street 555','USA');
Insert into Instructor  values(6,'Dmitri','Pole','1975/05/30',567655,'Coffee Street 121','Italy');


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

select* from lesson;
insert into lesson values(1,'2021-05-12',3,8,3,1);


--result set procedure SalaryChange chenges the salary if the salary less then min or greater the max to 10%increase or deacease
CREATE PROCEDURE SalaryChange( @MINSAL INT, @MAXSAL INT)
AS
BEGIN

DECLARE @COUNT INT ,
@inId INT,
@SAL INT,
@NAME VARCHAR(20);

declare inst CURSOR FOR SELECT instructor_id, salary FROM instructor WHERE salary<@MINSAL OR salary>@MAXSAL;

SELECT @COUNT= COUNT(instructor_id) FROM instructor WHERE salary<@MINSAL OR salary>@MAXSAL;
IF @COUNT=0
Print 'There is no need to change salary';
ELSE
OPEN inst;
FETCh NEXT FROM inst INTO @inId, @SAL;
WHILE @@FETCH_STATUS=0
BEGIN
SELECT @NAME= first_name FROM instructor WHERE instructor_id=@inId;
IF @SAL>@MAXSAL
UPDATE instructor
SET salary=salary*0.9
WHERE instructor_id=@inId;
else
UPDATE instructor
SET salary=salary*1.1
WHERE instructor_id=@inId;
PRINT ' Salary of ' +@NAME + ' changed' + cast (getdate() as varchar);
FETCH NEXT FROM inst INTO @inId, @SAL;
END;
CLOSE inst;
deallocate inst;
select* from instructor;
END;
exec SalaryChange 1500, 3000;

--return type procedure reeturning the sum of salaries of instructors from all countries
Create procedure Salsum
as
declare 
@totalSum int,
@tmpSum int,
@inId int;
declare c1 cursor for select instructor_id from instructor;
begin
set @totalSum=0;
open c1;
fetch c1 into @inId;
while @@fetch_status=0
begin
set @tmpSum = (select sum(sal) from instructor where instructor_id=@inId);
set @totalSum=@totalSum+@tmpSum;
fetch c1 into @inId;
end;
close c1;
deallocate c1;
return @totalSum;
end;

declare @x int;
execute @x = SalSum;
print @x;

--output type procedure  that returns the number of instructors from a given country;
Create procedure countryInstructor @country, @res int output
as
declare person cursor for select instructor_id from instructor where country like @country;
declare 
@inId int,
@countryy char(30);
begin
set @res =0;
open person;
fetch person into @inId;
while @@fetch_status =0;
begin
set @res=@res+1;
fetch person into @inId;
end;
close person;
deallocate person;
end;

declare @result int;
exec countryInstructor 'France', @result output;
print @result;

--Trigger that varifies that student's address do not repeat among students
Create trigger verifyID
on instructor
for insert
as
	declare students cursor for select student_id from Student;
	declare @newId integer;
	declare @newAddress integer;
	declare @currentStudent integer;
	declare @currentAddress integer;
begin
	set @newId=(select student_id from inserted);
	set @newAddress=(select address from inserted )
	open students;
	fetch students into @currentStudent;
	while @@fetch_status=0;
	begin
		set @currentAddress = (select address from student where student_id=@currentStudent );
		if @currentAddress = @newAddress
		begin
			print 'FOund the duplicate address';
			delete from student where student_id=@newId
		end;
		fetch students into @currentStudent;
	end;
	close students;
	deallocate Students;
end;

insert into student values (22,'Angelina','J',18,555555,'Orange Street 89','Korea');

--trigger tha shows the instructors name with  deleted record for instructors from Italy
create trigger t
on instructor
for delete
as
	declare i cursor for select instructor_id from instructor where country='Italy';
	declare @instrId int;
	declare @name char(20);
	DECLARE @DeletedId int;
begin
	set @name=(select firstname from deleted);
	set @deletedId =(select student_id from deleted)
	open i;
	fetch i into @instrId;
	while @@fetch_status =0;
	begin
		IF @deletedId=insrtId
		begin
		print (@name + 's record was deleted');
		end;
	fetch i into @instrId;
	end;
close i;
deallocate i;
end;

delete instructoe where id=1;

				
				
		
	