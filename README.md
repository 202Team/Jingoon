# Jingoon
진군

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

