use QuanLySinhVien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select  *  from  subject where  credit = (select max(credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * 
from subject s join mark m on s.subId=m.subID
where m.mark=(
	select max(mark) from mark
);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studentId  as Student_ID, s.StudentName as Student_Name, ifnull(avg(m.mark),0) as Avg_Mark
from student s  left join mark m on  s.StudentID=m.StudentID
group by s.StudentId
order by Avg_Mark desc;




