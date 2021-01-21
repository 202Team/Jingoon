# Jingoon
진군

1-21일 진행내용

jusoPopup.jsp, member/insert.jsp, BoardDAO, login.jsp, 팀회의

@ 팀 회의 내용

각자 코딩한 진행내용을 서로 살펴보며 토의
- 이해가 안되는 코드, 생각과 다른코드, 새로운 코드 등 서로의 코드를 보고 보완할 점이나 수정할 점 등을 토의

 진군,  도현, 진택
- 게시글 쓰기에서 오류
select max(num) from myboard , num = rs.getInt(1)+1 을 
select nvl2(max(num), max(num)+1, 1) from myboard , num = rs.getInt(1) 로 수정
- 인코딩필터의 Annotation 변경
- DB에 생성한 로그인테이블 어디다 쓰는지 모르겠음
- LoginCommand (로그인실패시 코드가 없음)
: 틀리거나 없는 아이디도 로그인됨
- 수정/삭제기능들에 대한 세션의 미적용
- id체크기능이 서블릿으로 작성됨-> 커멘드로 코딩(MVC2 방식)
- insert.jsp의 input태그에서 email, pw, tell 등 입력type 적용
- LogoutCommand의 세션(false): 세션이없으면 새로생성함, 중복코드(포워딩)
- 조회수 업데이트 기능 추가
- 오탈자: 멤버DTO sql문 id 빠짐
- boardinsert.jsp 게시글 입력 from태그의 전송방식이 작성되지않음
- 코딩을 클라이언트의 요청 > 프론트컨트롤 서블릿의 연결 > 커맨드의 처리 순서로 하면 좋겠음
- Map을 이용한 객체 생성, sp를 fullname과 연결하기가 이해하기 어려움
- Tomcat의 PortNumber가 서로 다른점을 수정(8089로 통일)
- board/Insert.do가 Board/ReadCommand를 호출하는 이유(오류 찾기)
- 수정 보완할 점이 있는지 찾아보기

---

진군 21일 진행상황

회원가입 주소입력에 검색기능 추가
- 행정안전부 도로명주소 API (devU01TX0FVVEgyMDIxMDExOTA5MzQzODExMDcxMDE=)

검색 팝업창이 닫히지 않는 문제 해결
- jusoCallBack 함수에서 사용하지 않는 파라미터들을 전부 가져와서 생긴 문제
- 사용하는 파라미터만 받게 함수 수정

첫글 쓰기 num생성 메서드 수정
- select max(num) from myboard , num = rs.getInt(1)+1 을 
- select nvl2(max(num), max(num)+1, 1) from myboard , num = rs.getInt(1) 로 수정

부트스트랩 적용
- 부트스트랩 사용법, 로그인 화면 적용

=================================================================================================

1-20일 진행내용

RollbackDeleteCommand, MemberCommand, Member/UpdateCommand, Board/UpdateCommand, Member/DeleteCommand, Board/DeleteCommand, Member/DeleteCommad, LoginCommand, MemberDAO

관리자 기능 추가, 메뉴 추가, 유저 삭제 업데이트, 삭제복구 기능 추가, 회원가입 주소검색 추가

관리자권한 추가
- 회원수정시 회원의 아이디와 로그인아이디가 같은지 확인하는데 관리자는 예외
- 모든 게시글 삭제, 수정 가능
- 모든 회원정보 수정, 탈퇴, 복구 가능

삭제 업데이트
: 유저테이블의 id가 게시글테이블(id)의 외래키로 설정되어있어서 회원 삭제시 오류
- 회원탈퇴시 로그인 불가능하게 회원정보를 수정(로그인 시 체크)

관리자 메뉴 추가
- 회원수정, 회원탈퇴, 탈퇴복구, 회원추가

삭제 복구 기능 추가
- 관리자 메뉴에서 탈퇴회원 정보를 수정가능(권한 체크)

회원가입 주소 검색기능 추가
- 행정안전부 도로명주소 API 
- 문제: 팝업창이 닫히지 않음(해결중)

==========================================================================================

1-19일 진행내용

게시글 삭제업데이트, 블라인드 추가, 회원정보 생일 추가, 관리자 기능 추가, 나이 추가
MemberInsertCommand, insert.jsp, MemberDAO, MemberDTO, LoginDTO, MemberCommand, member.jsp, MemberReadCommand, MemberDeleteCommand, MemberUpdateCommand, read.jsp

답글이 있는 게시글 삭제
- 게시글 블라인드( 작성자, 내용을 "Blind")
회원정보에 생일입력 추가
- 유저 테이블 birth추가, 회원가입화면 생일 추가, 회원정보화면 생일 추가, 회원정보수정화면 생일 추가
(입력타입은 date이고 DB저장 타입도 date이지만 java에서는 String으로 처리 ( yy-mm-dd-)형식)
관리자 계정(권한) 추가
- 유저 테이블 master 컬럼을 추가 default 0
- 로그인세션에 정보 추가
- 홈 화면에 관리자메뉴 추가
관리자 메뉴 생성
- 회원목록 추가
회원 정보 나이 추가
- 나이를 계산해 리스트에 반영하는 메서드 추가
-- 유저테이블의 두 검색값(테이블)을 조인하여 유저테이블 번호에 해당하는 나이를 첨가
- 생일이 null인 회원은  초기값 0으로 설정
회원가입 주소 검색기능
- 행정안전부 도로명주소 API (진행중)


**
select a.num, b.한국나이 from user_tbl a, (select num, (to_char(sysdate, 'YYYY') - to_char(birth, 'YYYY')) + 1 as 한국나이 from user_tbl) b where a.num = b.num and a.num = ?

==========================================================================

1-18일 진행내용

게시글 수정, 삭제, 파일 다운로드
DeleteCommand, FrontController, FileDownloadCommand, FileDownload, read.jsp, FileDAO


게시글 수정 후 목록화면으로 이동시 curPage 정보 누락으로 널포인트발생
- 입력 curPage없을 때 초기값 1로 설정

파일테이블의 id컬럼에 유저테이블의 id컬럼을 외래키로 설정. 
- alter table fileload_tbl add constraint fk_fileload_tbl_id foreign key (id) references user_tbl(id)
- 유저의 아이디로 작성한 게시글과 업로드 파일을 한번에 검색 가능(관리자용 추후 추가)

파일 다운로드
- 게시글보기화면에 첨부파일 링크를 추가
- 첨부파일의 이름을 누르면 다운로드
- 첨부파일이 없을 때는 "첨부파일이 없습니다"를 표시

게시글 삭제 업데이트
- 디렉토리의 저장된 파일의 삭제
- DB에 저장된 파일정보(파일테이블) 삭제


** 파일다운로드
파일링크를 누르면 커맨드로 이동해서 파일 다운로드메서드를 실행하게 구현
심각: 경로가 [/TeamProject_Board]인 컨텍스트의 서블릿 [kr.co.controller.Frontcontroller]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.
java.lang.IllegalStateException: 응답이 이미 커밋된 후에는, sendRedirect()를 호출할 수 없습니다.
==> 예외 발생
==> 해결
파일다운로드 메서드 중 ServletOutputStream out = response.getOutputStream(); 을 사용
이미 요청을 응답하여 포워딩을 처리할 수 없음(포워딩 필요하지 않음)
Command클래스의 return을 null 처리, controller에서 포워딩 할때 코드 추가
CommandAction ca =com.execute(request, response);
if(ca == null) {// 파일 다운로드 시 요청을 끝내고 null값을 반환해 요청을 끝낸다
	return;
}

==========================================================================

1-15일 진행내용

게시글의 페이징 적용
- 주소창에 totalpage이상의 양수를 적었을 때 마지막 페이지로 이동
토탈페이지보다 큰수의 주소창 입력을 막기위해 Amount() 메서드 오버로딩, ListCommand에서 totalPage를 구해서 비교
- 목록 메뉴추가 : 게시글보기(글 자세히보기read.do) 중에 목록페이지(list.do)로 돌아가면 원래페이지(curPage)로 돌아가기 추가
- 현재 보고있는 페이지를 페이지 목록에서 강조
- 총 페이지가 1페이지 일경우 페이징목록 안보이게 적용
BoardDAO, board/ListCommand

게시글 검색기능 적용
- 검색페이지 페이징 적용
(서치옵션과 서치키워드값을 바인딩하고 페이징시 주소값에 추가)
- 검색 결과 없음 표시
- 검색 결과가 1페이지 일경우 페이징목록 안보이게 적용
- 현재 보고있는 페이지를 페이지 목록에서 강조
SearchCommand, board/list.jsp, searchlist.jsp, searchpage.jsp, searchPage(), Amount()오버로딩

파일 업로드
- 게시판에 파일 업로드 기능 추가
첨부파일이 있을때는 파라미터들을 MultipartRequest 객체가 받아서 게시글을 생성하고, 생성된 게시글의 num값을 
받아서 파일DB에 저장,(이후 그 값으로 해당 게시글에서 다운로드 적용)
첨부파일이 없을 때를 스크립트로 구분하여 action를 이전 InsertCommand로 응답
FileUploadCommand, FileDAO, FileDTO, create fileload_tbl, board/insert.jsp

=========================================================

1-14일 진행내용

게시글의 수정/삭제 적용
- 작성자와 수정자의 로그인 id가 같을 때 수정/삭제글자가 나타남

추가 - board: /update, /UpdateCommand, /deleteCommand, /ReplyUICommand, /ReplyCommand, /PageTO, /page.jsp, /
수정 - board: /boardDTO, /boardDAO, /InsertCommand, /InsertUICommand, board/read.jsp

게시글 수정
- 제목과 내용, 작성시간을 수정시간으로 변경
- 회원정보 수정하면 재로그인해서 정보반영하기.
- 회원정보를 수정후 게시글을 수정하면 작성자명 변경하기. 

게시글의 삭제
- 삭제 할 때 로그인되어있는지 확인

게시글 조회수 적용
- 게시글보기를 할때 readcnt를 1씩 증가
- 게시글보기와 조회수업데이트 메서드를 트렌젝션 적용

답글
- 게시글보기에서 답글화면으로 이동해서 답글 작성
- 답글 작성시 이전 답글의 reStep을 하나씩 증가시켜 정렬시 후순위로 보이게
- 답글 작성시 reIndent 를 기존 글의 +1 해주고 들여쓰기 적용
- (reIndent > 0 이면 re: 를 제목앞에 붙임)
- 이전답글의 repStep업데이트메서드와 답글입력메서드를 같은 connection을 사용해서 트렌젝션 적용

게시글의 페이징 적용
- 게시글 리스트의 반환을 PageTO에 저장해서 한다.
- 게시글목록화면 하단에 페이징할 수있는 넘버링 추가
- 넘버링 전후로 < > 를 추가해 한페이지씩 이동
- 현재페이지가 1페이지면 <보이지 않고, 마지막페이지면 >가 보이지 않는다
- 주소창에 페이지 음수를 적었을때 페이지를 1페이지로 고정

*게시글테이블의 id 컬럼을 추가하고, 회원테이블의 id를 외래키로 설정
( 회원 본인이 작성한 게시글의 수정과 삭제 확인을 위해서)
alter table myboard add id varchar2(20)
alter table myboard add constraint fk_myboard_id foreign key(id) references user_tbl(id)
* 회원 테이블의 id(email)가 고유키가 아니라서 외래키가 적용 안되서 유니크 키로 설정후 외래키 설정
alter table user_tbl add unique (id)
alter table myboard add constraint fk_myboard_id foreign key(id) references user_tbl(id)
-> 게시글보기에서 로그인id와 게시글작성자 id를 비교후 같으면 수정/삭제를 출력
-> 로그인 하지 않거나 id가 같지 않으면 글쓰기와 답글만 출력

===========================================

1-13일 진행내용

member/InsertUIcommaind, member/InsertCommand, member/ReadCommad, member/UpdateCommand, member/UpdateUICommand, member/DeleteCommand
board/InsertUICommand, board/InsertCommand, board/ReadCommand
board/inset.jsp, member/insert.jsp, member/read.jsp, member/update.jsp 

[ 회원 정보 수정 ]
- 메인화면과 게시글화면에서 회원의 닉네임을 클릭하면 회원정보보기로 이동
 ( 로그인한 상황인지 확인, 로그인한 아이디와 회원정보가 일치한지 확인)
- 회원 정보화면에서는 회원번호, id(email), 가입일, 이름, 닉네임, 주소와 수정/삭제를  출력
- 회원 수정화면에서 이름, 닉네임 주소를 변경하고 수정완료 하면 회원정보화면으로 이동
 ( 로그인 유지와 로그인 회원정보를 다시 확인)
- 회원정보화면에서 회원탈퇴를 누르면 회원정보를 삭제하고 로그아웃
 ( 로그인 유지와 로그인 회원정보를 다시 확인)

[ 게시글 입력, 수정, 삭제 ]
- 주소창에서 글쓰기창으로 접근(경로입력)하면 로그인확인하고 게시글화면으로 이동
- 로그인 하면 메인화면과 게시글화면에서 글쓰기를 출력 
- 게시글작성: 닉네임으로 게시글 작성 , 작성후 게시글화면으로 이동
- 게시글화면에서 게시글제목을 누르면 게시글내용화면으로 이동
진행중) 게시글 수정, 삭제
 - 로그인상태 일 때 (댓글과 수정/삭제를 출력)
 - 타인의  작성 글일 때 (댓글 버튼 출력)

--------
http://localhost:8089/TeamProject_Board/board/
http://localhost:8089/TeamProject_Board/member/

member폴더와 board폴더를 나누다 보니까 경로에 /member, /board가 추가됨.
commad도 sp등록을 해줘서 갠찮았는데 로그인을 적용해보니 로그인을 성공할때와 로그인을 실패할 때의 포워드 경로와 로그아웃을 메인에서 할때 게시판에서 할때의 포워드 경로가 달라져서 절대 경로를 추가(추가하는 김에 모든 경로를 절대경로로 변경) -> 오류 발생

ListCommand - return new CommandAction(false, "list.jsp");
IdCheckCommand - return new CommandAction(false, "result.jsp");
--> 두 곳에서 절대경로로 포워딩 하면 주소창에 /board/절대경로 로 찍히면서 못찾음
공통점: request 바인딩 , request.getRequestDispatcher 방식 포워딩
===> 검색을 해보니 request.getRequestDispatcher 방식 포워딩은 상대경로만 포워딩 가능하고
절대경로는 ServletContext.getRequestDispatcher(path)으로 해야하지만 절대경로만 인식
==> 절대경로가 필요한 곳만 변경

=========================================

1-12일 진행내용

Jingoon : 진군 저장소 
dohyun1 : 도현 저장소
jintek15 : 진택 저장소
board : 팀 저장소( 기능추가와 응용을 하게된다면 여기서 작업하도록 하겠습니다.)
깃허브를 효율적으로 사용하고자 했지만 아직은 미숙하여 일단 팀허브를 만들고
각 개인당 하나씩 저장소를 생성해 각자가 그날 그날 코드내용을 commit - push 하기로 하였습니다
그동안 수업내용들을 종합하면서 코딩하고 추가할 기능이 떠오르면 일단은 기록만 하고 있습니다
회원관리와 게시판을 다 합치고 나서 팀원들과 상의를 거쳐 복습을 해야 할지 기능을 추가하며 응용하는 방향으로 가능할지 토의해 보기로 하였습니다

- 진군
추가: login.jsp, loginCommand, LogoutCommand, LoginDTO, BoardDAO, BoardDTO, listCommand, 
수정: insert.jsp, main.jsp, MemberDAO 

- 회원가입화면
주소와 별명을 제외한 입력값을 입력하지 않으면 가입화면으로 넘어가지 않게 확인창
- 로그인
로그인 성공시 글쓰기 게시판 (글 목록)화면으로 포워드
로그인 실패시 회원가입화면으로 포워드
- 로그아웃
로그아웃 시 메인화면의 로그인과 회원가입 버튼 출력
- 글목록화면
로그인, 로그아웃 태그 상단위치
진행중: 아이디 누르면 회원정보 자세히보기, 글제목 누르면 해당글 자세히보기

=======================================

1-11일 진행내용

게시판 팀 프로젝트
팀원: 진군, 도현, 진택

아이디어:
커뮤니티 사이트 게시판, 의류 쇼핑몰, 식품홈페이지, 첨부파일게시판, 이미지게시판 등등이 나왔습니다
그러나 아직 다들 뭘 해야 하는지 어떻게 해야 하는지 잘 모르겠어서 수업 시간에 배운 내용을 다시 한번 파악하고 각자가 공통 코드를 짜보고 거기에서 기능을 추가해 역할을 나눠보자고 하였습니다.

진군
Command, CommandAction, IdCheckCommand, InsertUICommand, Frontcontroller, KrEncoding, MemberDAO, MemberDTO
-
index, main, insert, reult
-
user_table, usermenu_table

회원가입화면
id중복체크(ajax적용) 버튼(DB회원과 입력id중복 체크)
submit 비밀번호 동일 체크, 아이디 입력값없음 체크, 비밀번호 입력없음 체크,
서블릿패스를 map을 사용해서 DB에서 가져오기



=======


게시판 팀 프로젝트

깃허브 https://github.com/202Team

팀원: 진군, 도현, 진택

