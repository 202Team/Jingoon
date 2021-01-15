<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<a href="http://localhost:8089/TeamProject_Board/main.jsp"><button>홈으로</button></a>
<c:choose>
	<c:when test="${empty login}">
		<a href="http://localhost:8089/TeamProject_Board/loginui.do">로그인</a>
		<hr>
		<a href="http://localhost:8089/TeamProject_Board/member/insertui.do"><button>회원가입</button></a>
	</c:when>
	<c:otherwise>
		<a href="http://localhost:8089/TeamProject_Board/member/read.do?num=${login.num}">${login.nickname}님 환영합니다,</a>
		<a href="http://localhost:8089/TeamProject_Board/logout.do">로그아웃</a>
		<hr>
		<a href="http://localhost:8089/TeamProject_Board/board/insertui.do"><button>글쓰기</button></a>
	</c:otherwise>
</c:choose>
		<c:if test="${login.num eq 0 }">
			<a href="">관리자 메뉴 추가하기</a>
		</c:if>
		<a href="http://localhost:8089/TeamProject_Board/board/list.do?curPage=${curPage}"><button>글목록보기</button></a>
		
<h1>제목 : ${dto.title}</h1>
글번호 : ${dto.num }<br>
작성자 : ${dto.author}<br>
작성일 : ${dto.writeday}<br>
내용: <br>
${dto.content }<br>

<hr>

<c:choose>
	<c:when test="${empty login}">
<!-- 로그인 안했을 때 추가할 내용  -->
	<a href="http://localhost:8089/TeamProject_Board/loginui.do">로그인</a>
	</c:when>
	<c:otherwise>
		<c:if test="${login.id eq dto.id }">
			<a href="updateui.do?num=${dto.num}">수정</a>
			<a id="del" href="delete.do?num=${dto.num}">삭제</a>
		</c:if>
		<a href="replyui.do?num=${dto.num}">답글</a>
		<a href="http://localhost:8089/TeamProject_Board/board/insertui.do"><button>글쓰기</button></a>
	</c:otherwise>
</c:choose>	

	
<script type="text/javascript">
$(document).ready(function(){
	$("#del").click(function(event){
		event.preventDefault();
		var ch = confirm("게시글을 삭제 하시겠습니까?");
		if(ch) location.assign("delete.do?num=${dto.num}");
	
	});
});

</script>

</body>
</html>