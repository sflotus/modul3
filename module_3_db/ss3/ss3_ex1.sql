use quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student s where s.studentname  like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from student s  
join class c on s. classid  = c.classid
where extract(month from c.startdate)=12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from student s 
join mark m  on s.studentid = m.studentid
join subject sub on sub.subid = m.subid
where sub.credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student s set classid = 2 where studentname like 'hung';
select *  from student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
select * from  student s
join mark m on m.studentid = s.studentid
join subject sub on m.subid=sub.subid
order by m.mark desc, s.studentname asc
