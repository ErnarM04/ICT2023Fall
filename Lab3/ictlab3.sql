create database ictlab3;
create table Teachers (
    teacher_ID serial primary key,
    first_name varchar(55),
    last_name varchar(65)
);
create table Courses
(
    course_ID serial primary key,
    course_name varchar(55),
    teacher_ID integer,
    foreign key (teacher_ID) references Teachers(teacher_ID)
);
create table Student
(
    student_ID serial primary key,
    first_name varchar,
    last_name varchar,
    yearcourse integer,
    yearbirth integer,
    course_ID integer,
    foreign key (course_ID) references Courses(course_ID),
    GPA decimal,
    course varchar(50)

);
INSERT INTO Teachers (teacher_ID, first_name, last_name)
VALUES
 (1, 'Kamilla', 'Aitalieva'),
 (2, 'Aigerim', 'Kenzhebayeva'),
 (3, 'Bakytzhan', 'Sultanov'),
 (4, 'Dinara', 'Ismailova'),
 (5, 'Erlan', 'Nurzhanov');

INSERT INTO Courses(course_ID, course_name, teacher_ID)
values

    (1, 'OOP', 1),
    (2, 'Calculus', 2),
    (3, 'ICT', 3),
    (4, 'ADS', 4),
    (5, 'DATABASES', 5);
insert into Student(student_ID, first_name, last_name, yearcourse, yearbirth, gpa, course_ID, course)
VALUES
(1, 'Amina', 'Abdulova', 1, 2005, 3.8, 2, 'Calculus'),
(2, 'Aidar', 'Kazakhov', 2, 2004, 3.5, 1, 'OOP'),
(3, 'Gulnara', 'Ismailova', 2, 2003, 3.9, 1, 'OOP'),
(4, 'Bakhytzhan', 'Nurpeisov', 4, 2002, 3.2, 3,  'ICT'),
(5, 'Ainur', 'Suleimenova', 3, 2003, 3.6, 2,'Calculus'),
(6, 'Askhat', 'Yerzhanov', 3, 2003, 3.7,3,  'ICT'),
(7, 'Aizere', 'Tulegenova', 2, 2005, 3.4, 3,'ICT'),
(8, 'Aruzhan', 'Zhumagaliyeva', 2, 2004, 3.8, 4, 'ADS'),
(9, 'Azamat', 'Iskakov', 2, 2004,3.5, 1, 'OOP'),
(10, 'Dana', 'Baibekova', 1, 2006, 3.9,  5, 'DATABASES'),
(11, 'Eldar', 'Bekturov', 2, 2005, 3.3, 3, 'ICT'),
(12, 'Emina', 'Kasimova', 2, 2004, 3.7, 4, 'ADS'),
(13, 'Galymzhan', 'Saparbayev', 3, 2003, 3.6, 1,  'OOP'),
(14, 'Gaukhar', 'Nurkhanova', 2, 2004, 3.4,  5, 'DATABASES'),
(15, 'Ilyas', 'Rakhimov', 1, 2007, 3.8, 5, 'DATABASES'),
(16, 'Karlygash', 'Tursynbekova', 2, 2006, 3.9, 4, 'ADS');

select * from Student where course='ICT';

select *from Student order by yearcourse asc
limit 1;
select *from Student order by yearcourse desc
limit 1;

update Student set last_name = 'Mukhtaruly' where student_ID = 2;
select * from Student where student_ID= 2;
update Student set last_name='Mustafayeva' where yearcourse = 3;
select * from Student where yearcourse=3;

select Student.*, Courses.course_name, Teachers.first_name as teacher_first_name, Teachers.last_name as teacher_last_name from Student
join Courses on Student.course_ID = Courses.course_ID
join Teachers on Courses.teacher_ID = Teachers.teacher_ID;

select Courses.course_name, count(*) as studentcnt
from Student join Courses on Student.course_ID = Courses.course_ID group by Courses.course_name;

select Courses.course_name, avg(yearbirth) as avgage from Student join Courses on Student.course_ID = Courses.course_ID group by Courses.course_name;

select * from Student where Student.GPA > (select avg(GPA) from Student);

select * from Student where GPA > 3;

create view infotable as select Student.student_ID, Student.first_name, Student.last_name, Courses.course_name, Student.gpa from Student
join Courses on Student.course_ID = Courses.course_ID;
select * from infotable;

select course_name, avg(GPA) AS avggpa from infotable group by course_name;