<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="id" value="${id }" scope="session" />
	<c:set var="pw" value="${pw }" scope="session" />
	<c:set var="grade" value="${grade }" scope="session" />

	<meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	<c:choose>
		<c:when test="${status eq 'order'}">
			<c:set var="contentLeft" value="order.jsp" />
		</c:when>
		<c:when test="${param.status.equals('empty')}">
			<c:set var="contentLeft" value="table.jsp" />
		</c:when>
		<c:when test="${param.status eq 'Reserves'}">
			<c:set var="contentLeft" value="table.jsp" />
		</c:when>
		<c:when test="${param.status eq 'admin'}">
			<c:set var="contentLeft" value="admin.jsp" />
		</c:when>
		<c:otherwise>
			<c:set var="contentLeft" value="table.jsp" />
		</c:otherwise>
	
	</c:choose>
	<c:choose>
		<c:when test="${ param.destPage =='' || param.destPage ==null}">
			<c:set var="contentRight" value="tableInfo.jsp" />
		</c:when>
		<c:when test="${ param.destPage.equals('tableInfo')}">
			<c:set var="contentRight" value="tableInfo.jsp" />
		</c:when>
		<c:when test="${ param.destPage.equals('statusSelect')}">
			<c:set var="contentRight" value="statusSelect.jsp" />
		</c:when>
	</c:choose>
	
	<c:choose>
	<c:when test="${tNum eq null && param.tNum == null}">
	<div style="margin:0 auto; width:300px;height:400px;">
	<img src="img/dahyun2.jpg" style="background-repeat: no-repeat; width:100%; height:100%;" />
	
		<form action="./pCtrl" method="post">
		<input type="hidden" name ="flag" value="6">
		<input type="hidden" name ="tNum" value="0">
		<input type="hidden" name ="status" value="empty">
		<div class="form-group">
    		<label for="email">ID</label>
    		<input type="text" class="form-control" id="id" name="id">
  		</div>
 		 <div class="form-group">
   		 <label for="pwd">Password</label>
   	 	<input type="password" class="form-control" id="pw" name="pw">
  		</div>
 		 <button type="submit" class="btn btn-default">로그인</button>
		</form>
		</div>
	</c:when>
	
	
	<c:otherwise>
    <jsp:include page="00_header.jsp" />
    <jsp:include page="${contentLeft}" flush="true" />
    <jsp:include page="${contentRight }" />
    <jsp:include page="90_footer.jsp" />
    </c:otherwise>
    </c:choose>
