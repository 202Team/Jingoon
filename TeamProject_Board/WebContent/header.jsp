<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<nav style="border-radius: 0px" class="navbar navbar-inverse ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="https://github.com/202Team" title="소스코드: https://github.com/202Team">TeamProject_Board</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li id="li_main"><a href="/TeamProject_Board/main.jsp">Home</a></li>
					
					<li id="li_list"><a href="/TeamProject_Board/board/list.do">게시판</a></li>
					<c:if test="${empty login}">
						<li id="li_login"><a href="/TeamProject_Board/loginui.do">로그인</a></li>
						<li id="li_join"><a href="/TeamProject_Board/member/insertui.do">회원가입</a></li>
					</c:if>
					<c:if test="${not empty login}">
						<li id="li_write" ><a href="/TeamProject_Board/board/insertui.do">글쓰기</a></li>
				
						<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false">${login.nickname} 님<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								
								<li><a href="/TeamProject_Board/member/read.do?num=${login.num}">개인정보 확인</a></li>
								<li><a href="/TeamProject_Board/member/updateui.do?num=${login.num}">개인정보 수정</a></li>
								<li><a href="/TeamProject_Board/logout.do">로그아웃</a></li>
								<c:if test="${login.master eq 1 }">
								<li class="divider"></li>
								<li class="dropdown-header">관리자 메뉴</li>
									<li><a href="/TeamProject_Board/member.do">회원목록</a></li>
									<c:if test="${not empty dto.num}">
									<li><a href="/TeamProject_Board/member/read.do?id=${dto.id}">작성자 정보</a></li>
									<li><a href="/TeamProject_Board/board/updateui.do?num=${dto.num}">게시글 수정</a></li>
									<li><a href="/TeamProject_Board/board/delete.do?num=${dto.num}">게시글 삭제</a></li>
									</c:if>
								</c:if>
							
							</ul>					
							</li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	