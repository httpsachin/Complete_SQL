create database collage; # Create database-- keyword use for creation of a database 

use collage;              # use keyword  determin that each operation use Collage Database ;

create table student (
rollno int primary key ,        # create table use for create a table ;
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student                 # insert into use for insert values in a table ;
(rollno,name,marks,grade,city)
values
(101,"sachin", 79, "C","kanpur"),
(102,"manish", 90, "A","indore"),
(103,"sanjana", 85, "B","bhopal"),
(104,"sohini", 65, "D","gudgaon"),
(105,"muskan", 75, "C","delhi");

select * from student;               #  this query use for visualization of table ;
                               
select name, marks from student; 
                                      # here we can visualize column that you want from a table ;
select * from student where marks >80;
                                          # where clause use for condition ;
select*from student where grade="C";

select*from student where city = "bhopal" and marks > 70;
                                                           # AND operator require both condition true for selection;
select*from student where city = "bhopal" or marks > 70; 
                                                            # Or require only one condition true for selection ;
select*from student where marks between 70 and 90;

select * from student where city in ("bhopal", "indore");  # IN use for check given list value; 

select * from student where city not in ("bhopal");  # NOT IN use for not select given list data ;

select * from student where marks > 60 limit 3;  
                                                   # Limit keyword use for create a limit on selection fo records ;
select * from student where marks >60;

select * from student order by city asc;           # ASC , ORDER BY use for select data in ascending order ;

select * from student order by marks desc limit 3;  # DESC use for descending order ;

select max(marks) from student;                    # max() function use for find maximum value from given table or column;

select min(marks) from student;                  # min() use for find minimum value ;

select avg(marks) from student;                # avg() use for average of any record;

select count(name) from student;             # count use for count given values in records ;

select count(rollno) from student;             

insert into student values (6,"manisha",88,"B","bhopal");

select city from  student group by city;              # Group by use for group data based on a column ;

select city, count(name) from  student group by city;

select city,  avg(marks) from  student group by city; # here we find city based average marks ; 

select city , avg(marks) from  student group by city order by avg(marks); 

select grade,count(rollno) from student group by grade order by grade; 

select city,count(rollno) from student group by city having max(marks)>80; # Having clause use in group by for conditions ;

select city from student where grade = "B"group by city having max(marks)>=85;

set sql_safe_updates= 0;    # this query use for updation 0 and safe mode 1 ;

update student  set  grade = "b" where grade = "B"; # here we update grade B as b;

select*from student order by grade;

update student set marks =89 where rollno = 104; 

update student set grade ="b" where marks between 80 and 89; # between use for define range it take also 80 , 89;

select*from student order by grade;

delete from student where marks <=75 ; # Delete keyword use for deletion in a table ;

select*from student;
create table dept(id int primary key , 
	        name varchar(50));
                  
insert into dept
values
(101,"english"),
(102,"it");    
update dept
set id=103 
where id=102;              

create table teacher(id int primary key , 
                     name varchar(50),
                     dept_id int ,
                     foreign key(dept_id) references dept(id) # foreign key use for link two table based on a column refrece of other table;  
                     on update cascade                       # cascade keyword use for update data in both table if change perform in any table 
                     on delete cascade
                     );
             
insert into teacher
values
(101,"adam",101),
(102,"sachin",102);
select*from teacher;

alter table student                      # alter keyword use for structure level updation;  
add column age int not null default 19 ;
select*from student;

alter table student
modify column age varchar(2);     # here we updating age column datatype int as varchar;    

insert into student
(rollno, name, marks,age)
values
(107,"gargi",22,100);

alter table student 
change age stu_age int; # here CHANGE keyword use for change column name age as stu_age ;

select*from student;

alter table student 
drop column stu_age;  # Here we use Drop keyword for delete stu_age column ; 

select*from student;

alter table student 
rename student_tab;   # rename keyword use for update name of any structure 

alter table student_tab 
rename student;

truncate table student;  #delete all table data 
select*from student;

alter table student
change name full_name varchar(50);

select*from student;

delete from student # delete all data of student that have marks below 75
where marks < 75;

alter table student 
drop column grade; # delete column from table 
 
 #join in SQL : JOIN use for merge data of two table based on join type 
 
 #Inner join : inner join merge two table based on column that have common value in one column of each table . 
 
 select*from student
 inner join dept
 on student.rollno = dept.id;# here inner join perform based on two column of both table that have some common values

# Left join : merge both table data and new table contain all left table data and right table ovelapping(common in both table ) data 

 select*from student as st  # you can define alias with the help of AS keyword 
 left join dept 
 on st.rollno = dept.id ;
 
 # Right Join : right join return all records from right table and matche record from left table 
  
  insert into dept(id,name)
  values 
  (107,"science");
 select* from student 
 right join dept
 on student.rollno = dept.id;
 select*from dept;
 
 # Full Join : merge two table and return all records of both table and ovelapping data records
 
 select*from student 
 left join dept
 on student.rollno = dept.id
 union                         #full join perform with union keyword that return only unique values 
 select*from student 
 right join dept 
 on student.rollno = dept.id;
 
 # left Exclusive join : it return only left tabel records that does not overlapp with right table records 

select*from student 
left join dept
on student.rollno = dept.id
where dept.id is null;

# Right Excludive join : it return only right table records that does not overlapp with left table data 

select*from student 
right join dept 
on student.rollno = dept.id
where student.rollno is null ;
 
 # Self Join : join selft table colunmn records 
 create table emp(
                 id int primary key ,name varchar(50), manager_id int);
 insert into emp(id , name , manager_id ) 
 values (101,"adam",103),
        (102,"bob",104),
        (103,"casey",null),
        (104,"donald",103);
select*from emp;  
      
select*from emp as a 
join emp as b
on a.id = b.manager_id ;

# Union : merge records withuot dupcate value it return only unoque records 

select full_name from student 
union 
select name from emp;
 
 select name from emp
 union all               #Union all return duplicate value of column
  select name from emp;
  
  # sub query : use inside a query for dynimic 
  
  select full_name ,marks 
  from student 
  where marks > (select avg(marks) from student);# this sub query 
  
  select full_name , rollno 
  from student 
  where rollno % 2=0;
 update student 
 set city  = "bhopal"
 where city = "indore";
 select*from student ;
 
 select max(marks)
 from (select * from student where city = "bhopal")as bpl;
 
 # View: you can create a virtual table from a table  according your choosen columns 
  
create view view1 as 
select rollno, full_name ,marks from student;
select*from view1;

 