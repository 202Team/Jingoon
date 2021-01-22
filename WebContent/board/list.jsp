<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>게시판</title>

<!-- 부트스트랩 -->
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="text-left">글번호</th>
					<th class="text-center">작성자</th>
					<th class="text-center">글제목</th>
					<th class="text-right">조회수</th>
					<th class="text-right">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.num }</td>
						<td class="text-center">${dto.author }</td>
						<td class="text-left"><c:forEach begin="1"
								end="${dto.repIndent }">
						&nbsp;
					</c:forEach> <c:if test="${dto.repIndent > 0}">re: </c:if> <a
							href="read.do?num=${dto.num}&curPage=${to.curPage}">${dto.title }</a>
						</td>
						<td class="text-right">${dto.readcnt }</td>
						<td class="text-right">${dto.writeday }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="text-right" href="${not empty login ? 'insertui.do':'/TeamProject_Board/loginui.do' }">
		<button class="btn btn-primary pull-right"><span ></span>${not empty login ? "글쓰기" :"로그인"}</button></a>
	</div>
	<%-- 페이지 목록 --%>
<div>
	<c:if test="${to.totalPage > 1}">
		<jsp:include page="page.jsp"/>
	</c:if>	
</div>

<div>
	<jsp:include page="search.jsp"/>
</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_list").attr("class", "active");
			$("#li_main").attr("class", "non");
			$("#btn_go").click(function(e){
				e.preventDefault();
				$("form_go").submit();
			})
		})
	</script>
</body>
</html>