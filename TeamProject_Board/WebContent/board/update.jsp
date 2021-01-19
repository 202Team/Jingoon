<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>${dto.num} 번 글의 수정화면</h1>
작성자: ${dto.author}<br>
작성시간: ${dto.writeday}<br>

<form action="update.do" method="post">
<input name="num" value="${dto.num }" type="hidden"><br>
<input name="author" value="${login.nickname}" type="hidden" readonly="readonly"><br>
제목: <input name="title" value="${dto.title}"><br>
내용: <br>
<textarea name="content" wrap="soft" rows="10">${dto.content}</textarea>
<br>
<input type="submit" value="수정완료">
</form>
<a href="list.do"><button>취소</button></a>

</body>
</html>