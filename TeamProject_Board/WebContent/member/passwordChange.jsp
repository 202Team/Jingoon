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
<title>비밀번호 변경</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			
  			<div class="text-center"><h1>비밀번호 변경</h1></div>
  			
			<form class="form-horizontal" action="passwordChange.do" method="post">
			  <div id="divo" class="form-group has-success has-feedback">
			    <label class="control-label col-sm-3" for="oripw">현재 비밀번호</label>
			    <div class="col-sm-9">
			      <input type="password" class="form-control" id="oripw" name="oripw" aria-describedby="inputSuccess3Status" >
			      <span id="spano" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
			      <span id="inputSuccess3Status" class="sr-only">(success)</span>
			    </div>
			  </div>
			  
			  <div id="div1" class="form-group">
			   <label class="control-label col-sm-3" for="pw1">변경 후 비밀번호</label>
			    <div class="col-sm-9">
			      <div class="input-group">
			        <span id="span1t" class="input-group-addon">@</span>
			        <input type="password" class="form-control" id="pw1" name="pw1" aria-describedby="inputGroupSuccess2Status">
			      </div>
			      <span id="span1" class="" aria-hidden="true"></span>
			      <span id="inputGroupSuccess2Status" class="sr-only">(success)</span>
			    </div>
			  </div>
			  
			  <div id="div2" class="form-group">
			   <label class="control-label col-sm-3" for="pw2">변경 후 비밀번호 확인</label>
			    <div class="col-sm-9">
			      <div class="input-group">
			        <span id="span2t" class="input-group-addon">@</span>
			        <input type="password" class="form-control" id="pw2" name="pw2" aria-describedby="inputGroupSuccess2Status">
			      </div>
			      <span id="span2" class="glyphicon" aria-hidden="true"></span>
			      <span id="inputGroupSuccess2Status" class="sr-only">(success)</span>
			    </div>
			  </div>
				<div class="form-group text-center">
					<input class="btn btn-default" id="sub" type="button" value="변경">
					<a class="btn btn-default" href="read.do?num=${login.num}">취소</a>
				</div>
			</form>

		</div>
	</div><!-- container -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#sub").click(function(e){
				e.preventDefault();
				var pw1 = $("#pw1").val();
				var pw2 = $("#pw2").val();
				var oripw = $("#oripw").val();
				console.log(pw1)
				console.log(pw2)
				if(oripw != ""){
					$("#spano").attr("class", "glyphicon glyphicon-ok form-control-feedback")
					$("#divo").attr("class", "form-group has-success has-feedback")
				}else{
					$("#oripw").attr("placeholder","비밀번호를 입력해주세요")
					$("#oripw").focus();
					$("#spano").attr("class", "glyphicon glyphicon-error-sign form-control-feedback")
					$("#divo").attr("class", "form-group has-error has-feedback")
					return;
				}
				if(pw1 !=""){
					$("#span1").attr("class", "glyphicon glyphicon-ok form-control-feedback")
					$("#div1").attr("class", "form-group has-success has-feedback")
				}else {
					$("#span1t").text("비밀번호를 입력해주세요")
					$("#span1").attr("class", "glyphicon glyphicon-error-sign form-control-feedback")
					$("#div1").attr("class", "form-group has-error has-feedback")
					$("#pw1").attr("placeholder","비밀번호를 입력해주세요")
					$("#pw1").focus();
					return;
				}
				if((pw1 != pw2)){
					$("#span2").attr("class", "glyphicon glyphicon-error-sign form-control-feedback")
					$("#div2").attr("class", "form-group has-error has-feedback")
					$("#span2t").text("비밀번호가 다릅니다.")
					$("#pw2").attr("placeholder","비밀번호를 입력해주세요")
					$("#pw2").focus();
					return;
				}else{
					$("#span2").attr("class", "glyphicon glyphicon-ok-sign form-control-feedback")
					$("#div2").attr("class", "form-group has-success has-feedback")
					$("#span2t").text("@")
					$("form").submit();
					window.colse();
				}
			})
		});
	
	</script>
</body>
</html>