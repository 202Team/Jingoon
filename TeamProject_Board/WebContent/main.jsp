<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>HOME</title>

<!-- 부트스트랩 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<!--네비게이션바 추가-->
	<jsp:include page="/header.jsp"/>

	<c:if test="${not empty login}">
	<div class="alert alert-success" role="alert">
        <strong><font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;">${login.nickname } </font></font></strong>
        <font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;">님 환영합니다.
      </font></font></div>
     </c:if>
     <c:if test="${empty login}">
     <div class="alert alert-info" role="alert">
        <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><a href="/TeamProject_Board/loginui.do">로그인</a>! </font></font></strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이 필요합니다.
      </font></font></div>
     </c:if>


	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>