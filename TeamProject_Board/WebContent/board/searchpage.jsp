<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<nav>
  <ul class="pagination">
  	<c:if test="${to.curPage > 1 }">
 	 <li>
      <a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=1" aria-label="Previous">
        <span aria-hidden="true">처음으로</span>
      </a>
    </li>
    </c:if>
    <li>
    <c:if test="${to.curPage > 1 }">
      <a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${to.curPage - 1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
      </c:if>
    </li>
    <c:forEach var="line" begin="${to.beginLineNum}" end="${to.stopLineNum}">
   	 <li class="${to.curPage == line ? 'active': '' }" ><a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${line}">${line}</a></li>
 	</c:forEach>
  	  <li>
    	<a href="search.do?searchname=${searchname}&searchkeyword=${searchkeyword}&curPage=${to.curPage < to.totalPage ? to.curPage + 1 : to.curPage }" aria-label="Next">
        <span aria-hidden="true">
        	<c:if test="${to.curPage < to.totalPage }"> &raquo;</c:if>
        </span>
        	<c:if test="${to.curPage == to.totalPage }">끝</c:if>
      </a>
    </li>
  </ul>
</nav>