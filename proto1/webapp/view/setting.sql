-- 회원가입용
drop table member;
create table member (
id varchar(20) primary key,   --String
pass varchar(20), 
name varchar(20), 
gender number(1),    --int
tel varchar(20), 
email varchar(50), 
picture varchar(200));





















-- 업로드를 위한 게시판
create table board(
num int primary key,
name varchar(30),
pass varchar(20),
subject varchar(100),
content varchar(4000),
file1 varchar(100),
regdate date,
readcnt number(10),
ref int,
reflevel number(3),
refstep number(5),
boardid varchar(1));

--
create sequence boardseq;

select * from ( select rownum rnum ,a.* 
from (select * from board order by ref desc , re_step) a )
where rnum between #{start} and #{end}


--업로드 없는 게시판
create table board (
   num int primary key,  
   name varchar(30),
   pass varchar(20),
   subject varchar(100),
   content varchar(4000),
   file1 varchar(100),
   regdate date,
   readcnt number(10),
   ref int,
   reflevel number(3),
   refstep number(5));