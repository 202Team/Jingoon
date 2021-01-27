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
<script type="text/javascript">

function goPopup(){
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		document.form.address.value = roadFullAddr;
}
</script>
</head>
<body>
	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"/>

	<div class="jumbotron">
		<div class="container">
		<div class="row">	
		<div class="col-md-9">
	        <div class="py-5 text-center">
	            <h2>개인 정보 수정</h2>
	        </div>
	       
	        	<form action="/TeamProject_Board/member/update.do" id="form" name="form" method="post">
	        	 
	        	<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="num" class="input-group-addon">회원번호</span>
						  <input name="num" value="${mdto.num}" readonly class="form-control" aria-describedby="num">
						</div>
					</div>
				</div>
	        	 
	        	 <div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="day" class="input-group-addon">회원 가입일</span>
						  <input name="day" value="${mdto.day}" readonly class="form-control" aria-describedby="day">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="id" class="input-group-addon">회원 ID</span>
						  <input name="id" value="${mdto.id}" readonly class="form-control" aria-describedby="id">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="name" class="input-group-addon">이름</span>
						  <input name="name" value="${mdto.name}" class="form-control" aria-describedby="name">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="nickname" class="input-group-addon">닉네임</span>
						  <input name="nickname" value="${mdto.nickname}" class="form-control" aria-describedby="nickname">
						</div>
					</div>
				</div>
				
				<div class="form-group">
		        	  <div class=".col-xs-12 .col-md-8">
					    <div class="input-group">
					      <input name="address" id="address" type="text" class="form-control" value="${mdto.address}">
					      <span class="input-group-btn">
					        <button id="addr" class="btn btn-default" type="button">주소검색</button>
					      </span>
					    </div>
					  </div>
				  </div>
				  
				  <div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span id="birth" class="input-group-addon">생일</span>
						  <input name="birth" type="date" value="${mdto.birth}" class="form-control" aria-describedby="birth">
						</div>
					</div>
				</div>
	  			
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">	
							<input class="btn btn-primary" type="submit" value="완료">
						</div>
					</div>
				</div>
				</form>
			
			<div class=".col-xs-12 .col-md-8">
				<a id="pwc" href="passwordChangeui.do">
				<button id="pwcbtn" class="btn btn-warning pull-right"><span>비밀번호 변경</span></button></a>
				<a id="delete" href="delete.do?num=${mdto.num}">
				<button class="btn btn-danger pull-right"><span>회원탈퇴</span></button></a>
			</div>
		</div><!-- col-md -->
		</div><!-- /.row -->
		</div><!--/.container  -->
	</div><!-- /.jumbotron -->

	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_member").attr("class", "active");
			$("#addr").click(function(e){
				e.preventDefault();
				goPopup();
			});
			$("#delete").click(function(e){
				e.preventDefault();
				var ch = confirm("탈퇴하시겠습니까?");
				if(ch){
					location.assign("delete.do?num=${mdto.num}");
				}
			});
			$("#pwcbtn").click(function(e){
				e.preventDefault();
				window.open("passwordChange.jsp","pop2","width=570,height=420, scrollbars=yes, resizable=yes");
			});
		});
	</script>
</body>
</html>