--全列查找
select * from dept;
--指定列查找
select dname from dept;
--结果中显示多个字段
select empno,ename,sal+comm from emp;
--结果中指定列别名
select empno,ename,sal+comm 收入 from emp;
--结果去重
select distinct sal+comm 收入 from emp;
