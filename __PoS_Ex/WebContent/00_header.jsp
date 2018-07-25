<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
 
<meta charset="UTF-8">
<title>첫 프로젝트1 </title>
</head>

<body>
		<div class="container" style="background-color:#F2F2F2; width:100%;">
  		<div style="max-width:2500px;">
    	<div style="background-color:#F8E0E6; width:30%; float:left; border-radius : 25px;">
     	  <h1 style ="text-align:center;"> 가게 이름 </h1>
    	</div>
   		 <div align ="center" style="background-color:#F8E0E6; border-radius : 25px;width:40%;float:left;">
	      <h1>
	      	<%
		 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
	 		String today = formatter.format(new java.util.Date());
	 		out.println(today);
			%>
	      </h1>
	     <a href="./pCtrl?flag=17">로그아웃</a>
     	 </div>
     	 	<c:if test="${grade eq '4' }">
	      	<div style="background-color:#F8E0E6; border-radius :25px;width:30%; float:left; ">
	    	  <h1 align ="center"><a href="admin.jsp">관리자 페이지</a></h1>
	    	</div>
	    	</c:if>
 	 	</div>
