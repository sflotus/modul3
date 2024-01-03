create database if not exists ss1_sql;
use ss1_sql;
create table class_management(
id_class int primary key,
class_name varchar(50) unique
);
create table teacher_management(
id_teacher int primary key,
`name` varchar(50),
age int,
country varchar(50)
);
insert into class_management(id_class, class_name) value(1,'c0723l1 jv105');
insert into class_management value(2,'c0823l1 jv106');
insert into teacher_management value(1,'Arthur',27,'VN');
insert into teacher_management(id_teacher,name,age,country) value(2,'Lloyd',25,'JP');
select * from class_management;
select * from teacher_management;
