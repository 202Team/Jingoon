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
		<h1>게시글 쓰기</h1>
		<div class="row">
			<form
				action="http://localhost:8089/TeamProject_Board/board/insert.do"
				method="post">
				<input name="id" value="${login.id}" type="hidden">

				<div class="form-group">
					<div class="col-xs-7">
						<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">작성자</span> <input
								type="text" class="form-control" readonly
								aria-describedby="basic-addon1" name="author"
								value="${login.nickname}">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-7">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="제목을 입력하세요"
								aria-describedby="basic-addon2" name="title" autofocus required maxlength="70"> <span
								class="input-group-addon" id="basic-addon2">제목</span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<textarea class="form-control bg-warning" rows="20" cols="70"
						name="content" required></textarea>
				</div>

				<div class="form-group">
					<label for="filename">파일 업로드</label>
					<input name="filename" type="file" id="filename">
					<p class="help-block">여기에 블록레벨 도움말 예제</p>
				</div>

				<div class="form-group text-right">
					<input class="btn btn-default" id="sub" type="submit" value="저장">
					<a class="btn btn-default" href="list.do">취소</a>
				</div>
			</form>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_write").attr("class", "active");
			$("#sub").click(function(event){
				var file = $("#filename").val();
				if(file){// 업로드 파일이 있을때 폼태그의 전송 타입을 변경
					$("form").attr("action", "http://localhost:8089/TeamProject_Board/fieload/fileupload.do");
					$("form").attr("enctype", "multipart/form-data");
					$("form").submit();
					return;
				}
			})
		})
	</script>
</body>
</html>