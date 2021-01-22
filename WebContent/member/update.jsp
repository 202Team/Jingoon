<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1> ${dto.name}님의 회원 정보 수정 화면 입니다.</h1>
	<form action="update.do" method="post">
		<label for="num">회원 번호: </label>
		<input name="num" id="num" value="${dto.num}" readonly="readonly"><br>
		
		<label for="day">회원 가입일: </label>
		<input name="day" id="day" value="${dto.day}" readonly="readonly"><br>
		
		<label for="id">회원번호 ID: </label>
		<input name="id" id="id" type="email" value="${dto.id}" readonly="readonly"><br>

		<br>
		<label for="name">이름: </label>
		<input name="name" id="name" value="${dto.name}"><br>
		
		<label for="nickname">닉네임: </label>
		<input	name="nickname" id="nickname"value="${dto.nickname}"></input><br>
		
		<label for="address">주소: </label>
		<input name="address" id="address" value="${dto.address}"><br>
		
		<label for="birth">생일: </label>
		<input name="birth" id="birth" type="date" value="${dto.birth}"><br>
		
		<input type="submit" value="수정완료"><br>
	</form>

</body>
</html>