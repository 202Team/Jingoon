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
	table{
		border-collapse: collapse;
		width: 100%;
	}
	table th, td{
		text-align: center;
		border: 1px solid black;
		font-weight: bold;
	}
	table th{
		color: white;
		background-color: green;
	}
	a{
		text-decoration: none;
	}
	table tr:nth-of-type(even){
		background-color: gray;
		color: white;
	}
	iframe {
		border: none;
		width: 100%;
		height: 500px;
	}
</style>
</head>
<body>
<a href="http://localhost:8089/TeamProject_Board/main.jsp"><button>홈으로</button></a>
<a href="http://localhost:8089/TeamProject_Board/member/read.do?num=${login.num}">${login.nickname}님 환영합니다,</a>
<a href="http://localhost:8089/TeamProject_Board/logout.do">로그아웃</a>
<br>
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
							<td>
								<c:if test="${dto.master >= 0}">
								${dto.master eq 1 ? "관리자" : "회원" }</c:if>
								<c:if test="${dto.master < 0}">
								${dto.master eq -1 ? "탈퇴회원" : "미설정" }</c:if>
							</td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.id }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.pw }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.name }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.nickname }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.address }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.day }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.birth }</a></td>
							<td><a href="member/updateui.do?num=${dto.num}">${dto.age}</a><td>
							<td><a href="member/updateui.do?num=${dto.num}">수정</a><td>
							<td><a id="del" href="member/delete.do?num=${dto.num}">회원 탈퇴</a><td>
							<td><a href="rollbackdelete.do?num=${dto.num}">회원 복구</a><td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</c:if>
		<button id="p1">회원 추가</button>
		<button id="p2">게시글 목록</button>
		<hr>
	<iframe>추가추가 </iframe>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#p1").click(function(event){
				event.preventDefault();
				$("iframe").attr("src", "http://localhost:8089/TeamProject_Board/member/insert.jsp");
			})
			
		    $("#p2").click(function(event) {
		        event.preventDefault();
		        $("iframe").attr("src", "http://localhost:8089/TeamProject_Board/board/list.do")
		    });

		});
	</script>
</body>
</html>