--一张学生表
create table student(
id int unsigned primary key auto_increment,
sn int not null unique comment'学号',
name varchar(20) not null,
qq varchar(20));
--插入数据
insert into student values(100,1901,'tang',null),(101,1902,'sun','123456');
insert into student(id,sn,name) values(102,1903,'cao'),(103,1904,'sun');
--插入数据，有冲突更新要updata的值插入，没冲突直接插入
insert into student(id,sn,name) values(100,1901,'tang')
on duplicate key update sn=1901,name='zhu';
--插入数据，有冲突替换插入，没冲突直接插入
replace into student(id,sn,name) values(100,1901,'tang');


--创建表
create table if not exists exam_result(
id int unsigned primary key auto_increment,
name varchar(20) not null comment'学生姓名',
chinese float default 0.0 comment'语文成绩',
math float default 0.0 comment'数学成绩',
english float default 0.0 comment'英语成绩');
--插入数据
insert into exam_result(name,chinese,math,english) values
('tang',67,98,56),
('sun',87,78,77),
('zhu',88,98,90),
('cao',82,84,67),
('liu',55,85,45),
('sun',70,73,78),
('song',75,65,30);
--全列查询
select * from exam_result;
--指定列查询
select id,name,chinese from exam_result;
--包含多个字段查询
select id,name,chinese+math+english from exam_result;
--指定别名
select id,name,chinese+math+english 总分 from exam_result;
--结果去重
select distinct math from exam_result;

--英语不及格的同学和英语成绩
select name,english from exam_result where english<60;
--语文成绩在[80，90]的同学和语文成绩
select name,chinese from exam_result where chinese>=80 and chinese<=90;
select name,chinese from exam_result where chinese between 80 and 90;
--数学成绩是58或59或98或99的同学和数学成绩
select name,math from exam_result where math=58 or math =59 or math=98 or math=99;
select name,math from exam_result where math in(58,59,98,99);
--s开头的同学和su某同学
select name from exam_result where name like 's%';
select name from exam_result where name like 'su_';
--语文成绩好于英语成绩的同学
select name,chinese,english from exam_result where chinese>english;
--总分在200分一下的同学
select name,chinese+math+english 总分 from exam_result
where chinese+math+english<200;
--语文成绩>80并且不以s开头的同学
select name,chinese from exam_result where chinese>80 and name not like 's%';
--要么名字以su开头的同学，要么总成绩>200并且语文<数学，英语>80
select name,chinese,math,english,chinese+math+english 总分 from exam_result
where name like 's__' or (chinese+math+english>200 and chinese<math and english>80);

--升序显示
select name,math from exam_result order by math;
--降序显示
select name,math from exam_result order by math desc;
--查询名字以s开头的同学或者名字以c开头的同学的数学成绩，结果按数学成绩由高到低显示
select name,math from exam_result where(name like 's%') or (name like 'c%')
order by math desc;
--查询所有学生成绩，一页显示3，4，5行
select id,name,chinese,math,english from exam_result
order by id limit 2,3;

--更新sun同学数学成绩为80
update exam_result set math=80 where name='sun';
--更新cao同学数学成绩为60，语文成绩为70
update exam_result set math=60,chinese=70 where name='cao';
--将成绩倒数前三的3位同学的数学成绩加上30分
update exam_result set math=math+30 order by chinese+math+english limit 3;
--将所有同学的语文成绩更新为原来的2倍
update exam_result set chinese=chinese*2;

--删除('zhu',88,98,90)
delete from exam_result where name='zhu';
--删除整张表
delete from b;

create table test_truncate(
id int primary key auto_increment,
name char(5));
--1a,2b,3c,4d
insert into test_truncate(name) values('a'),('b'),('c'),('d');
truncate test_truncate;
--1a,2b,3c,4d
insert into test_truncate(name) values('a'),('b'),('c'),('d');

create table test_delete(
id int primary key auto_increment,
name char(5));
--1a,2b,3c,4d
insert into test_delete(name) values('a'),('b'),('c'),('d');
delete from test_delete;
--5a,6b,7c,8d
insert into test_delete(name) values('a'),('b'),('c'),('d');

--删除表中的重复记录，重复的数据只能有一份
create table a (id int,name char(10));
insert into a values
(111,'aaa'),
(111,'aaa'),
(222,'bbb'),
(555,'ccc'),
(666,'ddd');
create table aa like a;
insert into aa select distinct * from a;
rename table a to c,aa to a;
drop table c;

--使用count()返回查询到的数据的数量
select count(*) from student;
select count(1) from student;
select count(qq) from student;
select count(distinct math) from exam_result;
--使用sum()返回查询到的数据的总和，不是数字没有意义
select sum(math) from exam_result;
select sum(chinese) from exam_result where chinese>10;
--使用avg()返回查询到的数据的平均值，不是数字没有意义
select avg(math+chinese+english) 平均成绩 from exam_result;
--使用max() 返回查询到的数据的 最大值，不是数字没有意义
select max(chinese) from exam_result;
--使用min() 返回查询到的数据的 最小值，不是数字没有意义
select min(math) from exam_result where math>70;