<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;	
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #555;
    color: white;
}
</style>

<div>
<div style="margin-left:50px; float:left;border-radius:25px;height:400px; width:230px; background-color: #F8E0E6;">
<div>
	<h1>&nbsp;&nbsp;관리자 메뉴</h1>
<ul>
  <li><a href="./pCtrl?flag=7">메뉴 등록</a></li>
  <li><a href="./pCtrl?flag=10">사원 추가</a></li>
  <li><a href="admin.jsp?destPage=sales">매출 확인</a></li>
</ul>
<br>
<div align="center">
	<a href="./pCtrl?flag=6&tNum=0&status=empty">
	<div class="btn btn-primary">
	뒤로 가기	
	</div>
	</a>
</div>
</div>
</div>
</div>
