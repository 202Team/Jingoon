<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.curPage{
		font-weight: bolder;
		color: red;
	}
	a{
		text-decoration: none;
	
	}
</style>
</head>
<body>
<a href="http://localhost:8089/TeamProject_Board/main.jsp"><button>홈으로</button></a>

	<c:choose>
		<c:when test="${empty login}">
			<a href="http://localhost:8089/TeamProject_Board/loginui.do">로그인</a>
		</c:when>
		<c:otherwise>
			<a href="http://localhost:8089/TeamProject_Board/member/read.do?num=${login.num}">${login.nickname}</a> 님, 환영합니다. 
			<a href="http://localhost:8089/TeamProject_Board/logout.do">로그아웃</a>
			<a href="http://localhost:8089/TeamProject_Board/board/insertui.do">글쓰기</a>
		</c:otherwise>
	</c:choose> 

<c:if test="${not empty list}"><h1>"${searchkeyword}" 검색 결과</h1></c:if>
<c:if test="${empty list}"><h1>"${searchkeyword}" 의 검색 결과가 없습니다.</h1></c:if>
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
					<c:if test="${dto.repIndent > 0}">re: </c:if>
					<a href="read.do?num=${dto.num}&curPage=${to.curPage}">${dto.title }</a>
				</td>
				<td>${dto.readcnt }</td>
				<td>${dto.writeday }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- 검색 페이지 목록 --%>
<div>
	<c:if test="${to.totalPage > 1}">
		<jsp:include page="searchpage.jsp"/>
	</c:if>
	
</div>
<%-- 검색 창 --%>
<div>
	<jsp:include page="search.jsp"/>
</div>


</body>
</html>