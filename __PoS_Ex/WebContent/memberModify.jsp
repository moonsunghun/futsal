<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="div-container">
	<div class="container" style="margin-left: 50px;height:700px;overflow: auto;">
		<h2>멤버 수정</h2>
		<form action="./pCtrl" method="post">
		<input type="hidden" name ="id" value="${param.id}">
		<input type="hidden" name ="flag" value="15">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>PW</th>
						<th>Grade</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>${param.id }</td>
							<td>
							<input type="text" name="pw" value="${param.pw }">
							</td>
							<td>
							<input type="text" name="grade" value="${param.grade }">
							</td>
						</tr>
				</tbody>
			</table>
			<button class="btn btn-warning" type="submit">수 정</button>
			</form>
	</div>
</div>
