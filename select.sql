# 1.查询同时存在1课程和2课程的情况
select * from student_course sc
where sc.courseId='1' or sc.courseId='2';

# 2.查询同时存在1课程和2课程的情况
select * from student_course sc
where sc.courseId='1' or sc.courseId='2';

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.id,s.name,avg(score) from student s,student_course sc
where s.id = sc.studentId group by sc.studentId;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select s.id,s.name,s.sex from student s LEFT JOIN student_course sc
on s.id = sc.studentId 
where s.id not in (select distinct sc.studentId from student_course sc);

# 5.查询所有有成绩的SQL
select studentId,score from student_course;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select studentId from student_course
where courseId='1' and studentId in (select studentId from student_course where courseId='2');

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select distinct s.id,s.name,s.age,s.sex from student s,student_course sc 
where s.id = sc.studentId and sc.score in (
select sc.score from student_course sc  
where courseId = 1 order by sc.score desc);

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select c.id,c.name,avg(score) as average from course c,student_course sc 
where c.id = sc.courseId  
group by sc.courseId 
order by average desc,c.id asc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name, sc.score from student s, student_course sc, course c
where s.id = sc.studentId and c.id = sc.courseid 
and c.name = "数学" and sc.score < 60;
