<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${to.curPage > 1 }">
<a href="list.do?curPage=1" >처음</a>
</c:if>

<c:if test="${to.curPage > 1 }">
<a href="list.do?curPage=${to.curPage - 1 }" >전</a>
</c:if>

<c:forEach var="line" begin="${to.beginLineNum}" end="${to.stopLineNum}">
<a class="${to.curPage == line ? 'curPage': null }" href="list.do?curPage=${line}">${line}</a>
</c:forEach>

<c:if test="${to.curPage < to.totalPage }">
<a href="list.do?curPage=${to.curPage + 1 }">후</a>
</c:if>

<form action="list.do?curPage=${line}">
<input name="curPage" type="number" placeholder="이동할 페이지입력">
<input type="submit" value="이동">
</form>