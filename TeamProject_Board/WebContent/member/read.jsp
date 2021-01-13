<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<a href="http://localhost:8089/TeamProject_Board/main.jsp"><button>홈으로</button></a>

<h1> ${dto.name} 님의 회정 정보</h1>
회원 번호: ${dto.num} <br>
회원 가입일: ${dto.day} <br>
회원 id(email): ${dto.id} <br>
회원 이름: ${dto.name} <br>
회원 닉네임: ${dto.nickname} <br>
회원 주소: ${dto.address} <br>

<a id="update.do" href="updateui.do?num=${dto.num}">회원정보수정</a>
<a id="delete.do" href="delete.do?num=${dto.num}">회원탈퇴(추후 2차인증))</a>

<script type="text/javascript">
$(document).ready(function(){
	$("delete").click(function(event){
		event.preventDefault();
		var chooce = confirm("정말 삭제 하시겠습니까?");
		if(choose){
			location.assign("delete.do?id=${dto.id}")
		}
	});
	
});


</script>

</body>
</html>