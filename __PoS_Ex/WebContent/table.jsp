<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="java.util.*, java.text.*"  %>

	<div style="border: 1px solid; width:47%;hight:1000px;float:left; padding-right:0;padding-left:0;">
		
			<style>
				.status 
				{	text-align :center; 
					color :#fff; width:30%;
					height:250px;
					float:left;padding-left:5px;
					 margin-right:5px;
					 border: 1px solid;
				}
			</style>
			
			<a href="./pCtrl?tNum=1&status=${status1}&flag=1">
			<c:choose>
			<c:when test="${status1 eq 'empty' || status1 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status1 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</c:when>
			<c:when test="${status1 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블1<br>
				${status1}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=2&status=${status2}&flag=1">
			<c:choose>
			<c:when test="${status2 eq 'empty' || status2 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status2 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status2 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블2<br>
				${status2}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=3&status=${status3}&flag=1">
			<c:choose>
			<c:when test="${status3 eq 'empty' || status3 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status3 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status3 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블3<br>
				${status3}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=4&status=${status4}&flag=1">
			<c:choose>
			<c:when test="${status4 eq 'empty' || status4 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status4 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status4 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블4<br>
				${status4}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=5&status=${status5}&flag=1">
			<c:choose>
			<c:when test="${status5 eq 'empty' || status5 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status5 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status5 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블5<br>
				${status5}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=6&status=${status6}&flag=1">
			<c:choose>
			<c:when test="${status6 eq 'empty' || status6 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status6 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status6 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블6<br>
				${status6}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=7&status=${status7}&flag=1">
			<c:choose>
			<c:when test="${status7 eq 'empty' || status7 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status7 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status7 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블7<br>
				${status7}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=8&status=${status8}&flag=1">
			<c:choose>
			<c:when test="${status8 eq 'empty' || status8 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status8 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status8 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블8<br>
				${status8}
			</div>
			</a>
			
			<a href="./pCtrl?tNum=9&status=${status9}&flag=1">
			<c:choose>
			<c:when test="${status9 eq 'empty' || status9 eq null}">
				<div class="status" style="background-color: skyblue;">
			</c:when>
			<c:when test="${status9 eq 'Reserves' }">
				<div class="status" style="background-color: #92a8d1;">
			</style>
			</c:when>
			<c:when test="${status9 eq 'use' }">
				<div class="status" style="background-color: gray;">
			</c:when>
			</c:choose>
				테이블9<br>
				${status9}
			</div>
			</a>
			
		</div>
		
			
			
			
			
		
