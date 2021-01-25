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

	<div class="container">
		<h1>${dto.num} 번 글의 수정화면</h1>
		<div class="row">
			<form
				action="update.do"
				method="post">
				<input name="num" value="${dto.num }" type="hidden">
				<input name="author" value="${login.nickname}" type="hidden" readonly="readonly">
				<div class="form-group">
					<div class="col-xs-7">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">작성자</span> <input
								type="text" class="form-control" readonly
								aria-describedby="basic-addon1" 
								value="${dto.author}">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-xs-7">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">작성시간</span> <input
								type="text" class="form-control" readonly
								aria-describedby="basic-addon1"
								value="${dto.writeday}">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-7">
						<div class="input-group">
							<input type="text" class="form-control" value="${dto.title}"
								aria-describedby="basic-addon2" name="title" autofocus required maxlength="70"> <span
								class="input-group-addon" id="basic-addon2">제목</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<textarea class="form-control bg-warning" rows="20" cols="70"
						name="content" required>${dto.content}</textarea>
				</div>

				<div class="form-group text-right">
					<input class="btn btn-default" type="submit" value="수정완료">
					<a class="btn btn-default" href="read.do?num=${dto.num}">취소</a>
				</div>
			</form>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>