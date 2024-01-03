create database if not exists ss1_sql;
use ss1_sql;
create table class_management(
id_class int primary key,
class_name varchar(50) unique
);
create table teacher_mangagement(
id_teacher int primary key,
`name` varchar(50),
age int,
country varchar(50)
);
