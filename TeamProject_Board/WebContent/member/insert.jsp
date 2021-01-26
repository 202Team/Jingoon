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
<title>회원가입</title>
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

	<div class="container">
		<div class="row">	
			<div class="col-md-9">
	        <div class="py-7">
	        	<div class="d-flex justify-content-center">
	            <img src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
	            </div>
	            <div class="text-center">
	            <h2>회원가입</h2>
	            <p class="lead">회원가입하세요. 가입하면 게시판 글쓰기를 할 수 있습니다</p>
	            </div>
	        </div>
	       
	        	<form action="/TeamProject_Board/member/insert.do" id="form" name="form" method="post">
	        	 
	        	 <div class="form-group">
		        	  <div class=".col-xs-12 .col-md-8">
					    <div class="input-group">
					      <span id="span1" class="input-group-addon"></span>
					     	 <input name="id" id="id" type="email" class="form-control" placeholder="@ email을 입력하세요">
					      <span class="input-group-btn">
					        <button id="btnID" class="btn btn-default" type="button">ID 중복체크</button>
					      </span>
					    </div><!-- /input-group -->
					  </div><!-- /.col-lg-6 -->
				  </div><!-- /.form-group -->
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span class="input-group-addon" id="pw1">비빌번호</span>
						  <input name="pw1" type="password" class="form-control"  placeholder="Password" aria-describedby="pw1">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span class="input-group-addon" id="pw2">비빌번호확인</span>
						  <input name="pw2" type="password" class="form-control"  placeholder="Password" aria-describedby="pw2">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span class="input-group-addon" id="name">이름</span>
						  <input name="name" type="text" class="form-control" required placeholder="이름을 입력하세요" aria-describedby="name">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span class="input-group-addon" id="nickname">닉네임</span>
						  <input name="nickname" type="text" class="form-control" required placeholder="닉네임을 입력하세요" aria-describedby="nickname">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">
						  <span class="input-group-addon" id="birth">생일</span>
						  <input name="birth" type="date" class="form-control" aria-describedby="birth">
						</div>
					</div>
				</div>
				
				<div class="form-group">
		        	  <div class=".col-xs-12 .col-md-8">
					    <div class="input-group">
					      <input name="address" id="address" type="text" class="form-control" placeholder="주소를 입력하세요">
					      <span class="input-group-btn">
					        <button id="addr" class="btn btn-default" type="button">주소검색</button>
					      </span>
					    </div>
					  </div>
				  </div>
			
				<div class="form-group">
					<div class=".col-xs-12 .col-md-8">
						<div class="input-group">	
							<input class="btn btn-primary" type="submit" value="가입">
						</div>
					</div>
				</div>
				</form>
				</div>
	        </div><!-- /.row -->
		</div><!--/.container  -->
        

  
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var a = false;// id중복체크 확인용
		$(document).ready(function(){
			$("#li_join").attr("class", "active");
			$("input[type=submit]").click(function(event) {

				var idn = $("input[name=id]").val();
				var pw1 = $("input[name=pw1]").val();
				var pw2 = $("input[name=pw2]").val();
				var namen = $("input[name=name]").val();
				var idspan = $("#span1").text();
				var ids = $.trim(idspan); // 공백 제거
				if(ids != "사용 가능합니다"){ // 아이디 중복체크 검사
					alert("id 중복체크를 해주세요");
					$("#id").select();
					event.preventDefault();
					return;
				} else if (!a) { //아이디 중복체크 
					alert("id 중복체크를 해주세요");
					$("#id").select();
					event.preventDefault();
					return;
				} else if (!idn) { //아이디 널체크
					alert("id를 입력해주세요");
					$("#id").select();
					event.preventDefault();
					return;
				} else if (pw1 != pw2) {//비밀번호 체크
					$("#pw1").focus(); // 커서가 깜박깜박
					$("#pw2").select(); // 드래그 선택됨 
					alert("비밀번호가 같지 않습니다.");
					event.preventDefault();// 1+2
					return;
				} else if (!pw1) {
					alert("비밀번호를 입력해주세요");
					$("#pw1").select();
					event.preventDefault();
					return;
				} else if(!namen){
					alert("이름을 입력해주세요");
					$("#name").select();
					event.preventDefault();
					return;
				} 
			
			});
			$("#btnID").click(function(event) {
				event.preventDefault(); // 버튼의 원래 이벤트 무효
				var idv = $("#id").val();/*중복체크할 아이디 입력값 */
				a = true;
				$.ajax({
					type : 'get', /*연결방식 get과 post중 하나*/
					url : 'idcheck.do', /* IdCheckCommand로 연결 */
					data : {
						id : idv
					/* $("input[name=id]").val()를 id에 대입(param으로 IdCheckCommand 에게 넘겨줌) */
					},
					dataType : 'text', /* 받아올 데이터 타입이 무엇인가. IdCheckCommand 에서 바인딩한 msg의 타입 (JSON이나 배열이될수도 있다.)  */
					success : function(result) { //연결이 성공했을때 이벤트 
						console.log(result); // 콘솔에 출력 
						ids = $("#span1").text(result); //span태그에 text 입력  
					},
					error : function(request, status, error) { /* 실패했을때의 이벤트(성공하면 사용안함) */
						console.log(error); /* 실패했을때 콘솔에 출력 */
					},
					complete : function(result) { /* 성공과 실패에 상관없이 실행하는 이벤트 */
					}
				});
			});
			
			$("#addr").click(function(e){
				e.preventDefault();
				goPopup();
			});
		});
	</script>
</body>
</html>