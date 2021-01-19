<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>HOME 화면</h1>
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
		<c:if test="${login.master eq 1 }">
			<a href="member.do"><button>관리자 메뉴</button></a>
		</c:if>
		<a href="http://localhost:8089/TeamProject_Board/board/list.do"><button>글목록보기</button></a>
</body>
</html>