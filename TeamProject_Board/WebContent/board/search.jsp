<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<form action="search.do" class="navbar-form navbar-right" role="search">
  <div class="form-group">
  	<select class="btn btn-default dropdown-toggle" name="searchname">
		<option value="title">제목</option>
		<option value="author">작성자</option>
		<option value="content">내용</option>
	</select> 
    <input name="searchkeyword" type="text" class="form-control" placeholder="Search">
  </div>
  <button type="submit" class="btn btn-default">검색</button>
</form>











