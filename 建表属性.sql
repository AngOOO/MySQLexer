--建立班级表，属性不能为空
create table myclass(
class_name varchar(20) not null,
class_room varchar(10) not null);
--插入数据
--失败
insert into myclass(class_name) values('class1');
--成功
insert into myclass values('class1','103'),('class2','104');

--建立带默认值的表
create table student(
name varchar(20) not null,
age tinyint unsigned default 0,
sex char(2) default'男');
--有默认值的属性，不符值有默认内容
insert into student(name) values('zhangsan');

--comment注释
create table user(
name varchar(20) not null comment'姓名',
age tinyint unsigned default 0 comment'年龄',
sex char(2) default'男' comment'性别');

--zerofill以0填充int括号内的数字
create table b(
a int(5) unsigned default null,
b int(3) unsigned default null);
insert into b values(1,2);
alter table b change a a int(3) unsigned zerofill;
--为b表追加主键
alter table b add primary key(a);

--primary 主键
create table c(
id int(10) unsigned not null primary key comment'学号',
name varchar(20) not null comment'姓名');
--两个字段同时为主键
create table d(
id int(10) unsigned not null comment'学号',
name varchar(20) not null comment'姓名',
score tinyint unsigned default 0 comment'成绩',
primary key(id,name));
--删除主键
alter table d drop primary key;

--auto_increment自增长
create table e(
id int unsigned primary key auto_increment,
name char(20) not null);
insert into e(name) values('a');
insert into e(name) values('b');
insert into e(name) values('c');
--查看上次自增长到多少
select last_insert_id();

--unique唯一键
alter table e change name name char(20) unique comment'姓名,不能重复,但可以为空';

--由于主键与唯一键不能重复，插入数据可以检查更新后插入
--覆盖原先的a=1,b=2称为a=1,b=3
insert into b values(1,3) on duplicate key update a=1,b=3;

--检查表中有无冲突，没有冲突直接插入，有冲突直接替换原先的
--覆盖原先的a=1,b=3称为a=1,b=4
replace into b values(1,4);
--直接插入a=2,b=8
replace into b values(2,8);

--外键约束
--建立主表
create table class(
id int primary key comment'班级id',
name char(20) not null comment'班级名称');
--建立从表
create table stu(
id int primary key comment'学生id',
name char(20) not null comment'学生姓名',
class_id int comment'学生班级id',
foreign key (class_id) references class(id));

insert into class values(1,'java1'),(2,'c++1');
insert into stu values(1,'Tom',1),(2,'Mary',1),(3,'Jack',2);
--错误
insert into stu values(4,'Ami',3);
--正确
insert into stu values(4,'Ami',null);