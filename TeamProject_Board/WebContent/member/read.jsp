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
<title>회원 정보</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"/>

	<div class="jumbotron">
		<div class="container">
		  <h1>${mdto.name} 님의 가입정보</h1>

		  <div class="alert alert-success">
		  	<div>
			  <p class="text-danger">회원 번호: <span class="text-primary">${mdto.num }</span></p>
			  <p class="text-danger">회원 가입일: <span class="text-primary">${mdto.day}</span></p>
			  <p class="text-danger">회원 아이디: <span class="text-primary">${mdto.id}</span></p>
			  <p class="text-danger">회원 이름: <span class="text-primary">${mdto.name}</span></p>
			  <p class="text-danger">회원 닉네임: <span class="text-primary">${mdto.nickname}</span></p>
			  <p class="text-danger">회원 주소: <span class="text-primary">${mdto.address}</span></p>
			  <p class="text-danger">회원 생일: <span class="text-primary">${mdto.birth}</span></p>
			 </div>
		  </div>
		  <div class="btn-group">	
		  	<div class="btn">	
		  		<a href="updateui.do?num=${mdto.num}">
				<button class="btn btn-primary pull-right"><span>회원정보수정</span></button></a>
			</div>

		 </div>
		</div>
	</div>

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_member").attr("class", "active");
			$("#delete").click(function(event){
				event.preventDefault();
				var ch = confirm("회원정보를 삭제 하시겠습니까?");
				if(ch) location.assign("delete.do?num=${dto.num}");
			
			});
		});
	</script>
</body>
</html>