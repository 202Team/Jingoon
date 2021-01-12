<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록입니다.</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<c:choose>
		<c:when test="${empty login}">
			<a href="loginui.do">로그인</a>
		</c:when>
		<c:otherwise>
			${login.nickname}님, 환영합니다. <a href="logout.do">로그아웃</a>
			<a href="board/insertui.do">글쓰기</a>
		</c:otherwise>
	</c:choose>

<h1>글 목록</h1>

<table>
	<thead>
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>글제목</th>
			<th>조회수</th>
			<th>작성날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.num }</td>
				<td>${dto.author }</td>
				<td>
					<c:forEach begin="1" end="${dto.repIndent }">
						&nbsp;
					</c:forEach>
					<a href="wread.do?num=${dto.num}">${dto.title }</a>
				</td>
				<td>${dto.readcnt }</td>
				<td>${dto.writeday }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>