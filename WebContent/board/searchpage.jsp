<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${to.curPage > 1 }">
<a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=1" >처음</a>
</c:if>

<c:if test="${to.curPage > 1 }">
<a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${to.curPage - 1 }" >전</a>
</c:if>

<c:forEach var="line" begin="${to.beginLineNum}" end="${to.stopLineNum}">
<a class="${to.curPage == line ? 'curPage': null }" href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${line}">${line}</a>
</c:forEach>

<c:if test="${to.curPage < to.totalPage }">
<a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${to.curPage + 1 }">후</a>
</c:if>