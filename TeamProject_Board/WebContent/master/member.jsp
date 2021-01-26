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
<title>회원관리</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="container">
	<c:if test="${login.master eq 1 }">
		<div>
			<h1>회원목록</h1>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center">정보</th>
						<th class="text-center">회원번호</th>
						<th class="text-center">관리자</th>
						<th class="text-center">아이디</th>
						<th class="text-center">비밀번호</th>
						<th class="text-center">이름</th>
						<th class="text-center">닉네임</th>
						<th class="text-center">주소</th>
						<th class="text-center">회원가입일</th>
						<th class="text-center">생일</th>
						<th class="text-center">나이</th>
						<th class="text-center">수정</th>
						<th class="text-center">탈퇴</th>
						<th class="text-center">복구</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="mdto">
						<tr>
							<td><input type="button" class="checkBtn btn btn-info pull-center pull-middle" value="정보출력" /></td>
							<td>${mdto.num }</td>
							<td>
								<c:if test="${mdto.master >= 0}">
								${mdto.master eq 1 ? "관리자" : "회원" }</c:if>
								<c:if test="${mdto.master < 0}">
								${mdto.master eq -1 ? "탈퇴회원" : "미설정" }</c:if>
							</td>
							
							<td>${mdto.id }</td>
							<td>${mdto.pw }</td>
							<td>${mdto.name }</td>
							<td>${mdto.nickname }</td>
							<td>${mdto.address }</td>
							<td>${mdto.day }</td>
							<td>${mdto.birth }</td>
							<td>${mdto.age}</td>
							<td><a class="btn btn-warning pull-center" href="member/updateui.do?num=${mdto.num}">수정</a></td>
							<td><a class="btn btn-danger pull-center" id="del" href="member/delete.do?num=${mdto.num}">블록</a></td>
							<td><a class="btn btn-primary pull-center" id="back" href="rollbackdelete.do?num=${mdto.num}">복구</a></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<%--반복문을 이용해 출력한 테이블 선택하기 test --%>
		<div class="col-lg-12" id="ex2_Result1" ></div> 
		<div class="ex2_Result2"></div>
	</c:if>
	</div>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#li_member").attr("class", "active");
			$(".checkBtn").click(function(){ 
				
				var str = ""
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $(this);
				
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn.parent().parent();
				var td = tr.children();
				
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
				
				var no = td.eq(0).text();
				
				// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
				td.each(function(i){	
					tdArr.push(td.eq(i).text());
				});
				
				console.log("배열에 담긴 값 : "+tdArr);
				str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no ;
				
				$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());		
				$("#ex2_Result2").html(str);	
			})
		});
	</script>
</body>
</html>