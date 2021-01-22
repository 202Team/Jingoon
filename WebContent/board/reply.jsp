<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 화면 입니다.</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<h1>${param.oriNumS}번 글의 답글</h1>

<form action="reply.do" method="post">
	<input name="oriNum" value="${param.oriNumS}" type="hidden">
	<input name="id" value="${login.id}" type="hidden">
	작성자:<input name="author" value="${login.nickname}" readonly><br>
	제목: <input name="title"><br>
	내용:<br>	
	<textarea rows="5" name="content"></textarea>
	<br>
	<input type="submit" value="저장">
</form>
<a href="read.do?num=${param.oriNumS}"><button>취소</button></a>

</body>
</html>