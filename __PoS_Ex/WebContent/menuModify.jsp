<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="div-container">
	<div class="container" style="margin-left: 50px;height:700px;overflow: auto;">
		<h2>메뉴 리스트</h2>
			<form action="./pCtrl" method="post">
				<input type="hidden" name="mNum" value="${param.mNum }">
				<input type="hidden" name="flag" value="14">
				<table class="table">
					<thead>
						<tr>
						<th>mNum</th>
						<th>name</th>
						<th>price</th>
						</tr>
					</thead>
					<tbody>
					
						<tr>
							<td>
								${param.mNum}
							</td>
							<td>
							<input type="text" name="name" value="${param.name}">
							</td>
							<td>
							<input type="text" name="price" value="${param.price}">
							</td>
						</tr>
					</tbody>
				</table>
					<button type="submit"> 수정 </button>
			</form>
	</div>
</div>