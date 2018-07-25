<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="./pCtrl">
<input type="hidden" name="flag" value="16"> 
<div style="border :1px solid; height:500px; width:1000px;float:left;">
<div style="width:30%;border :1px solid; float:left;">
	<h5>연도</h5> 
<select name="year">
	<option value="0"> - </option>
	<option value="2018" ${param.year eq 2018 ?"selected" : "" }> 2018 </option>
	<option value="2019"> 2019 </option>
</select>
</div>
<div style="width:30%;border :1px solid;float:left;">
	<h5>월</h5>
<select name="month">
	<option value="00"> - </option>
	<option value="01" ${param.month eq 01 ?"selected" : "" }> 1월 </option>
	<option value="02" ${param.month eq 02 ?"selected" : "" }> 2월 </option>
	<option value="03" ${param.month eq 03 ?"selected" : "" }> 3월 </option>
	<option value="04" ${param.month eq 04 ?"selected" : "" }> 4월 </option>
	<option value="05" ${param.month eq 05 ?"selected" : "" }> 5월 </option>
	<option value="06" ${param.month eq 06 ?"selected" : "" }> 6월 </option>
	<option value="07" ${param.month eq 07 ?"selected" : "" }> 7월 </option>
	<option value="08" ${param.month eq 08 ?"selected" : "" }> 8월 </option>
	<option value="09" ${param.month eq 09 ?"selected" : "" }> 9월 </option>
	<option value="10" ${param.month eq 10 ?"selected" : "" }> 10월 </option>
	<option value="11" ${param.month eq 11 ?"selected" : "" }> 11월 </option>
	<option value="12" ${param.month eq 12 ?"selected" : "" }> 12월 </option>
</select>
</div>
<div style="width:30%;border :1px solid;float:left;">
<h5>일</h5>
<select name="day">
	<option value="0"> - </option>
	<option value="0" ${param.day eq 0 ?"selected" : "" }> 전체 </option>
	<option value="01" ${param.day eq 01 ?"selected" : "" }> 01 </option>
	<option value="02" ${param.day eq 02 ?"selected" : "" }> 02 </option>
	<option value="03" ${param.day eq 03 ?"selected" : "" }> 03 </option>
	<option value="04" ${param.day eq 04 ?"selected" : "" }> 04 </option>
	<option value="05" ${param.day eq 05 ?"selected" : "" }> 05 </option>
	<option value="06" ${param.day eq 06 ?"selected" : "" }> 06 </option>
	<option value="07" ${param.day eq 07 ?"selected" : "" }> 07 </option>
	<option value="08" ${param.day eq 08 ?"selected" : "" }> 08 </option>
	<option value="09" ${param.day eq 09 ?"selected" : "" }> 09 </option>
	<option value="10" ${param.day eq 10 ?"selected" : "" }> 10 </option>
	<option value="11" ${param.day eq 11 ?"selected" : "" }> 11 </option>
	<option value="12" ${param.day eq 12 ?"selected" : "" }> 12 </option>
	<option value="13" ${param.day eq 13 ?"selected" : "" }> 13 </option>
	<option value="14" ${param.day eq 14 ?"selected" : "" }> 14 </option>
	<option value="15" ${param.day eq 15 ?"selected" : "" }> 15 </option>
	<option value="16" ${param.day eq 16 ?"selected" : "" }> 16 </option>
	<option value="17" ${param.day eq 17 ?"selected" : "" }> 17 </option>
	<option value="18" ${param.day eq 18 ?"selected" : "" }> 18 </option>
	<option value="19" ${param.day eq 19 ?"selected" : "" }> 19 </option>
	<option value="20" ${param.day eq 20 ?"selected" : "" }> 20 </option>
	<option value="21" ${param.day eq 21 ?"selected" : "" }> 21 </option>
	<option value="22" ${param.day eq 22 ?"selected" : "" }> 22 </option>
	<option value="23" ${param.day eq 23 ?"selected" : "" }> 23 </option>
	<option value="24" ${param.day eq 24 ?"selected" : "" }> 24 </option>
	<option value="25" ${param.day eq 25 ?"selected" : "" }> 25 </option>
	<option value="26" ${param.day eq 26 ?"selected" : "" }> 26 </option>
	<option value="27" ${param.day eq 27 ?"selected" : "" }> 27 </option>
	<option value="28" ${param.day eq 28 ?"selected" : "" }> 28 </option>
	<option value="29" ${param.day eq 29 ?"selected" : "" }> 29 </option>
	<option value="30" ${param.day eq 30 ?"selected" : "" }> 30 </option>
	<option value="31" ${param.day eq 31 ?"selected" : "" }> 31 </option>
</select>
</div>



<button type="submit"> 확인 </button>
</div>
</form>

<div style="float:left">
<c:choose>
<c:when test="${price ne null && day ne 0}">

<h1>${year}년 ${month }월 ${day}일  매출 금액</h1>
<h1>${price}</h1>
</c:when>
<c:when test="${price eq null && day eq 0}">
	<h1>${year }년 ${month }월</h1>
	<div>
	<table>                                                                                
	<thead>
	<tr>
		<th> 일  </th>
		<th> 매출</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="pvo" items= "${pList}">
		<tr>
		<c:choose>
		<c:when test="${pvo.day ne 0 }">
		<td>${pvo.day }일</td>
		</c:when>
		<c:otherwise>
		<td>총 매출</td>
		</c:otherwise>
		</c:choose>
		<td>${pvo.price}</td>
		</tr>	
		</c:forEach>
	</tbody>
	</table>
	</div>
</c:when>
</c:choose>
</div>
