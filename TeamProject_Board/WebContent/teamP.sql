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
alter table user_tbl add unique (id)
alter table myboard add constraint fk_myboard_id foreign key(id) references user_tbl(id)
ALTER TABLE myboard MODIFY (author varchar2(100))
ALTER TABLE user_tbl MODIFY (address varchar2(300))
alter table user_tbl add birth date
alter table user_tbl add master number default '0'

select * from MYBOARD

delete from myboard where title like '%test%'

select * from user_tbl
update user_tbl set master = 1 where num = 0

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
insert into USERMENU_TBL values (15, '/board/updateui.do', 'kr.co.board.command.UpdateUICommand')
insert into USERMENU_TBL values (16, '/board/update.do', 'kr.co.board.command.UpdateCommand')
insert into USERMENU_TBL values (17, '/board/delete.do', 'kr.co.board.command.DeleteCommand')
insert into USERMENU_TBL values (18, '/board/replyui.do', 'kr.co.board.command.ReplyUICommand')
insert into USERMENU_TBL values (19, '/board/reply.do', 'kr.co.board.command.ReplyCommand')
insert into USERMENU_TBL values (20, '/board/search.do', 'kr.co.board.command.SearchCommand')
insert into USERMENU_TBL values (21, '/fieload/fileupload.do', 'kr.co.fileload.command.FileUploadCommand')
--/board/filedownload.do 를 굳이 /fileload/filedownload.do로 변경 해야 할까?
insert into USERMENU_TBL values (22, '/board/filedownload.do', 'kr.co.fileload.command.FileDownloadCommand')
insert into USERMENU_TBL values (22, '/board/filedownload.do', 'kr.co.fileload.command.FileDownloadCommand')
insert into USERMENU_TBL values (23, '/member/jusoPopup.do', 'kr.co.member.command.JusoPoupCommand')
insert into USERMENU_TBL values (24, '/member.do', 'kr.co.member.command.MemberCommand')

update USERMENU_TBL set sp = '/board/insertui.do' where menunum = 14
update USERMENU_TBL set fullname = 'kr.co.member.command.JusoPoupCommand' where menunum = 23

select * from USERMENU_TBL

commit

create table fileload_tbl(
num number primary key,
save varchar2(50),
realPath varchar2(500),
id varchar2(20),
sysFileName varchar2(100),
orgFileName varchar2(100),
boardNum number
)

alter table fileload_tbl add constraint fk_fileload_tbl_id foreign key (id) references user_tbl(id)

select * from fileload_tbl
select a.num, b.한국나이 from user_tbl a, (select num, (to_char(sysdate, 'YYYY') - to_char(birth, 'YYYY')) + 1 as 한국나이 from user_tbl) b where a.num = b.num and a.num = 1


select (to_char(sysdate, 'YYYY') - to_char(birth, 'YYYY')) + 1 as 한국나이 from user_tbl
