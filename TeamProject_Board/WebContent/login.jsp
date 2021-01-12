<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1>로그인 화면 입니다</h1>

<form action="login.do" method="post">
아이디: <input name="id" type="email" placeholder="@이메일을 입력하세요"><br>
PASSWORD: <input name="pw" type="password" placeholder="********"><br>
<input type="submit" value="로그인">
</form>

</body>
</html>