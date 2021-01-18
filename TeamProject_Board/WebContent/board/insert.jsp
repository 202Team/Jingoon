<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#sub{
	<%--위치 이동 예정 --%>
	}
</style>
</head>
<body>

<h1>글 작성 화면</h1>

<form action="http://localhost:8089/TeamProject_Board/board/insert.do" method="post">
	<input name="id" value="${login.id}" type="hidden">
	작성자:<input name="author" value="${login.nickname}" readonly><br>
	제목: <input name="title"><br>
	내용:<br>	
	<textarea rows="5" name="content"></textarea>
	<br>
	<%-- 파일 업로드 추가 --%>
	<input id="filename" name="filename" type="file">
	<input id="sub" type="submit" value="저장">
</form>


<a href="list.do"><button>취소</button></a>

<script type="text/javascript">
$(document).ready(function(){
	$("#sub").click(function(event){
		var file = $("#filename").val();
		if(file){
			$("form").attr("action", "http://localhost:8089/TeamProject_Board/fieload/fileupload.do");
			$("form").attr("enctype", "multipart/form-data");
			$("form").submit();
			return;
		}
	//	alert("파일 없이 업로드");// 테스트용
	})
});

</script>

</body>
</html>