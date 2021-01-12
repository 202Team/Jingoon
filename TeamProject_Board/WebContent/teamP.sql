SELECT * FROM tabs

create table user_tbl (
num number primary key,
id varchar2(20) not null,
pw varchar2(20) not null,
name varchar2(15) not null,
nickname varchar2(30) default '별명없음',
address varchar2(30),
day date default sysdate
)

select * from user_tbl
update user_tbl set num =1 where pw = 'mm'

create table usermenu_tbl(
menuNum number(2) primary key,
sp varchar2(100) not null,
fullname varchar2(100) not null
)

insert into USERMENU_TBL values (1, '/member/insertui.do', 'kr.co.member.command.InsertUICommand')
insert into USERMENU_TBL values (2, '/member/idcheck.do', 'kr.co.member.command.IdCheckCommand')
insert into USERMENU_TBL values (3, '/member/insert.do', 'kr.co.member.command.InsertCommand')
insert into USERMENU_TBL values (4, '/loginui.do', 'kr.co.member.command.LoginUICommand')
insert into USERMENU_TBL values (5, '/login.do', 'kr.co.member.command.LoginCommand')
insert into USERMENU_TBL values (6, '/logout.do', 'kr.co.member.command.LogoutCommand')
insert into USERMENU_TBL values (7, '/board/list.do', 'kr.co.board.command.ListCommand')

update USERMENU_TBL set sp = '/logout.do' where menunum = 6

select * from USERMENU_TBL

commit