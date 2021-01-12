<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main WepApp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>메인 화면</h1>
<c:choose>
	<c:when test="${empty login}">
		<a href="loginui.do">로그인</a>
		<hr>
		<a href=" insertui.do"><button>회원등록</button></a>
	</c:when>
	<c:otherwise>
		<a href="read.do?id=${login.id}">${login.nickname}님 환영합니다,</a>
		<a href="logout.do">로그아웃</a>
		<hr>
		<a href="insertwriteui.do"><button>글쓰기</button></a>
		<a href="writelist.do"><button>글목록보기</button></a>
	</c:otherwise>
</c:choose>
</body>
</html>