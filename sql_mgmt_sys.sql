create table teachers
(
teacher_id int primary key not null, 
first_name varchar(50), 
last_name varchar(50), 
subject varchar(50), 
contact_no varchar(50), 
email varchar(50)
);
insert into teachers(teacher_id, first_name, last_name, subject, contact_no, email) values 
(101,'John','Doe','Mathematics','555-1234','johndoe@example.com'),
(201,'Jane','Smith', 'English','555-5678', 'janesmith@example.com'),
(301, 'Emily','Johnson','Science','555-8765','emilyjohnson@example.com'),
(401,'Michael','Brown','History','555-4321','michaelbrown@example.com'),
(501,'Sarah','Davis','Art','555-2468','sarahdavis@example.com'),
(601,'David','Martinez','Physical Education','555-1357','davidmartinez@example.com'),
(701,'Olivia','Taylor','Music','555-8642','oliviataylor@example.com'),
(801, 'James','Anderson','Geography','555-7531','jamesanderson@example.com'),
(901,'Sophia','Thomas','Literature','555-9753','sophiathomas@example.com'),
(1001,'William','Jackson','Computer Science', '555-8640','williamjackson@example.com');
create table classes (
class_id int primary key not null, 
class_name varchar(50), 
teacher_id int, 
foreign key (teacher_id) references teachers(teacher_id)
);
insert into classes(class_id,class_name, teacher_id) values
(1,'Algebra I',101),
(2, 'English Literature',201),
(3, 'Biology', 301),
(4, 'World History',401),
(5,'Painting and Drawing',501),
(6,'Physical Education',601),
(7,'Choir',701),
(8,'Geography 101',801),
(9,'Shakespearen Drama',901),
(10,'Intro to Programming',1001);
create table schedules(schedule_id int primary key not null,
class_id int, 
day_of_week varchar(50), 
start_time time, 
end_time TIME, 
foreign key (class_id) references classes(class_id)
);
insert into schedules(schedule_id, class_id, day_of_week, start_time, end_time) values
(1,1,'Monday','08:00:00','09:30:00'),
(2,2,'Tuesday','09:00:00','10:30:00'),
(3,3,'Wednesday','10:00:00','11:30:00'),
(4,4,'Thursday','11:00:00','12:30:00'),
(5,5,'Friday','13:00:00','14:30:00'),
(6,6,'Monday','14:00:00','15:30:00'),
(7,7,'Tuesday','15:00:00','16:30:00'),
(8,8,'Wednesday','16:00:00','17:30:00'),
(9,9,'Thursday','08:30:00','10:00:00'),
(10,10,'Friday','10:30:00','12:00:00');
insert into teachers(teacher_id,first_name,last_name, subject,contact_no,email) values (321,'Emma','Brown','Mathematics','9876543210','emma.brown@gmail.com');
insert into classes (class_id, class_name, teacher_id) values (11,'Grade 10 Mathematics',101);
select * from classes;
select * from schedules;
select c.class_name, s.day_of_week,s.start_time,s.end_time from classes c join schedules s on c.class_id = s.class_id where c.class_id = 1;
select * from teachers;
select c.class_name from classes c join teachers t on c.teacher_id = t.teacher_id where t.first_name = 'John' and t.last_name='Doe';

select s.day_of_week, s.start_time, s.end_time from schedule s join classes c on c.class_id = c.class_id where c.class_name = 'Algebra I';
-- Find which teacher is teaching a specific class on a particular day:
select t.first_name, t.last_name, s.day_of_week,s.start_time, s.end_time from teachers t join classes c on t.teacher_id = c.teacher_id join schedules s on c.class_id = s.class_id where c.class_name = 'Algebra I' and s.day_of_week ='Monday';
-- Get the total number of classes taught by a specific teacher:
select t.first_name, t.last_name, count(c.class_id) as total_classes from teachers t left join classes c on t.teacher_id = c.teacher_id group by t.teacher_id;
-- Find all classes scheduled on a specific date
select c.class_name, s.start_time,s.end_time from schedules s join classes c on s.class_id = c.class_id where s.day_of_week='Monday';
-- update the schedule for a class(e.g., changing the time for a specific class)
update schedules set start_time ='09:00:00', end_time='10:30:00' where schedule_id = 1;
delete from schedules where class_id = 5;
-- Get the teachers who are scheduled on a specific date
select t.first_name,t.last_name,s.day_of_week from teachers t join classes c on t.teacher_id = c.teacher_id join schedules s on c.class_id = s.class_id where s.day_of_week = 'Friday';
-- Find classes taught by teachers whose names start with "J":
select c.class_name from classes c join teachers t on c.teacher_id = t.teacher_id where t.first_name LIKE 'J%';
