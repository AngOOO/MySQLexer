--使用group by
--显示每个部门的平均工资和最高工资
select deptno,avg(sal),max(sal) from emp group by deptno;
--显示每个部门的每种岗位的平均工资和最低工资
select deptno,job,avg(sal),max(sal) from emp group by deptno,job;
--显示平均工资低于2000的部门和它的平均工资
--统计各部门的平均工资
select avg(sal) from emp group by deptno;
--使用having对group by的结果进行筛选
select avg(sal) as mysal from emp group by deptno having mysal<2000;