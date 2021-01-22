<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="text-center">
<nav>
  <ul class="pagination">
  	<c:if test="${to.curPage > 1 }">
 	 <li>
      <a href="list.do?curPage=1" aria-label="Previous">
        <span aria-hidden="true">처음으로</span>
      </a>
    </li>
    </c:if>
    <li>
      <a href="list.do?curPage=${to.curPage > 1 ? to.curPage - 1 : to.curPage }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach var="line" begin="${to.beginLineNum}" end="${to.stopLineNum}">
   	 <li class="${to.curPage == line ? 'active': '' }" ><a href="list.do?curPage=${line}">${line}</a></li>
 	</c:forEach>
  	  <li>
    	<a href="list.do?curPage=${to.curPage < to.totalPage ? to.curPage + 1 : to.curPage }" aria-label="Next">
        <span aria-hidden="true">
        	<c:if test="${to.curPage < to.totalPage }"> &raquo;</c:if>
        </span>
        	<c:if test="${to.curPage == to.totalPage }">끝</c:if>
      </a>
    </li>
  </ul>
</nav>
</div>
<form action="list.do?curPage=${line}">
<input name="curPage" type="number" placeholder="이동할 페이지입력">
<input type="submit" value="이동">
</form>



<div class="row">
  <div class="col-md-3">
    <div class="input-group">
    <form id="form_go" action="list.do?curPage=${line}">
      <input name="curPage" type="number" class="form-control" placeholder="Search for...">
    </form>
      <span class="input-group-btn">
        <button id="btn_go" class="btn btn-default" type="button">Go!</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->










