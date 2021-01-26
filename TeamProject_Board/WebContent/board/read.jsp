<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"/>

	<div class="jumbotron">
		<div class="container">
			<div>
				<h1>${dto.title}</h1>
				<p>글번호: ${dto.num }</p>
    			<p>작성자: ${dto.author}</p>
    			<p>작성일 : ${dto.writeday}</p>
			</div>
		  <div class="alert alert-success">
		 	 <p >${dto.content }</p>
		  </div>
		  
		<div>
		<button class="btn btn-default">첨부파일</button> 
		<a href="filedownload.do?sysFileName=${dtoFile.sysFileName}&fileNum=${dtoFile.num}"> ${dtoFile.orgFileName}</a>
		<c:if test="${empty dtoFile}">
			첨부파일이 없습니다.
		</c:if>
		</div>
		
		<div class="text-right">
			<div class="${not empty login ? 'btn' : 'hidden' } ">
		  		<c:if test="${login.id eq dto.id}">
				  		<a href="updateui.do?num=${dto.num}">
						<button class="btn btn-primary pull-right"><span>수정</span></button></a>
						<a id="del" href="delete.do?num=${dto.num}">
						<button class="btn btn-primary pull-right"><span>삭제</span></button></a>
				</c:if>
					<a class="text-right" href="replyui.do?num=${dto.num}">
					<button class="btn btn-primary pull-right"><span>답글</span></button></a>
 			</div>
 			<div class="btn">
		  		<a href="/TeamProject_Board/board/list.do?curPage=${curPage}">
		  		<button class="btn btn-primary pull-right"><span>목록으로</span></button></a>
		  	</div>
		  	<div class="${empty login ? 'btn' : 'hidden' } ">
	 				<a href="../loginui.do">
					<button class="btn btn-primary pull-right" title="로그인을 하면 글쓰기를 할 수 있습니다"><span>로그인</span></button></a>
		  	</div>
		</div>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_write").attr("class", "active");
			$("#del").click(function(event){
				event.preventDefault();
				var ch = confirm("게시글을 삭제 하시겠습니까?");
				if(ch) location.assign("delete.do?num=${dto.num}");
			
			});
		});
	</script>
</body>
</html>