--创建数据库,区分大小写
create database if not exists A charset=utf8 collate utf8_bin;
--创建数据库,不区分大小写
create database if not exists B charset=utf8 collate utf8_general_ci;
--查看数据库支持字符集
show charset;
--查看数据库支持校验规则
show collate;
--查看当前数据库信息
show create database A;
--创建表
create table user(
id int,
name varchar(20) comment'用户名',
password char(32) comment'密码')
character set utf8 engine MyISAM;
--查看表结构
desc user;
show create table user;
--添加内容
insert into user values(1,'Tom','123'),(2,'Mary','456');
--添加字段
alter table user add birthday date comment'生日' after password;
--将name长度改为60
alter table user modify name varchar(60);
--删除password一列
alter table user drop password;
--修改表名为studentname
alter table user rename to studentname;
--修改列名
alter table studentname change birthday birth date;
--删除表
drop table studentname;
--删除数据库
drop database if exists A;
--导入数据库
source D:\scott_data.sql;
--查看连接情况
show processlist;
