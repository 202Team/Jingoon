<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	table tbody, td{
		border: solid 1px;
	}

</style>
</head>
<body>
	<c:if test="${login.master eq 1 }">
		<div>
			<h1>회원목록</h1>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>관리자</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>주소</th>
						<th>회원가입일</th>
						<th>생일</th>
						<th>나이</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.num }</td>
							<td>${dto.master eq 1 ? "Master" : "no" }</td>
							<td>${dto.id }</td>
							<td>${dto.pw }</td>
							<td>${dto.name }</td>
							<td>${dto.nickname }</td>
							<td>${dto.address }</td>
							<td>${dto.day }</td>
							<td>${dto.birth }</td>
							<td>${dto.age}<td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		
	</c:if>
	<c:if test="${login.master ne 1 }">
		<p>정상적인 경로로 접속 바랍니다<p>
	</c:if>

</body>
</html>