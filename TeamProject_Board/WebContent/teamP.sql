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

alter table myboard add id varchar2(20)
select * from MYBOARD

select * from user_tbl
update user_tbl set num = 0 where pw = 'master'

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
insert into USERMENU_TBL values (8, '/board/insertui.do', 'kr.co.board.command.InsertUICommand')
insert into USERMENU_TBL values (9, '/board/insert.do', 'kr.co.board.command.InsertCommand')
insert into USERMENU_TBL values (10, '/member/read.do', 'kr.co.member.command.ReadCommand')
insert into USERMENU_TBL values (11, '/member/updateui.do', 'kr.co.member.command.UpdateUICommand')
insert into USERMENU_TBL values (12, '/member/update.do', 'kr.co.member.command.UpdateCommand')
insert into USERMENU_TBL values (13, '/member/delete.do', 'kr.co.member.command.DeleteCommand')
insert into USERMENU_TBL values (14, '/board/read.do', 'kr.co.board.command.ReadCommand')

update USERMENU_TBL set sp = '/board/insertui.do' where menunum = 14
update USERMENU_TBL set fullname = 'kr.co.board.command.ReadCommand' where menunum = 14

select * from USERMENU_TBL

commit