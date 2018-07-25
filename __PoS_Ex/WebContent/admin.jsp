<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="css/menu.css" rel="stylesheet">
  
  
</head>
<body>

	<jsp:include page="navbar.jsp"/>
	<c:choose>
		<c:when test="${param.destPage.equals('menuList')}">
		<jsp:include page="menuList.jsp" />
	</c:when>
		<c:when test="${param.destPage.equals('memberList')}">
		<jsp:include page="memberList.jsp" />
	</c:when>
	<c:when test="${param.destPage.equals('menuModify')}">
		<jsp:include page="menuModify.jsp" />
	</c:when>
	<c:when test="${param.destPage.equals('memberModify')}">
		<jsp:include page="memberModify.jsp" />
	</c:when>
	<c:when test="${param.destPage.equals('sales')}">
		<jsp:include page="sales.jsp" />
	</c:when>
	</c:choose>

	</body>
</html>