<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="div-container">
	<div class="container" style="margin-left: 50px; width:1000px;height:700px;overflow: auto;">
		<h2>메뉴 리스트11</h2>
			<table class="table">
				<thead>
					<tr>
						<th>mNum</th>
						<th>name</th>
						<th>price</th>
						<th>Delete</th>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mvo" items="${mList}">
						<tr>
							<td>${mvo.mNum }</td>
							<td>${mvo.name }</td>
							<td>${mvo.price }</td>
							<td>
							<a href="./pCtrl?flag=9&mNum=${mvo.mNum}"><img src="img/trash2.png">
							</a>
							</td>
							<td>
							<a href="admin.jsp?destPage=menuModify&mNum=${mvo.mNum}&price=${mvo.price}&name=${mvo.name}">
								<img src="img/pencil.png">
							</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</div>
</div>
<div style="width:300px;height:400px;float:right;margin-right:50px; 
border-radius:25px; display:inline-block; background-color:#F8E0E6;">
	<div>
		<h1>메뉴 등록</h1>
		<form action="./pCtrl" method="post">
		<input type="hidden" name ="flag" value="8">
		<input type="hidden" name ="tNum" value="0">
		<input type="hidden" name ="status" value="empty">
		<div class="form-group">
    		<label>음식 종류</label>
    		<select class="form-control" name="mNum" >
			  			<option value="m">Main</option>
			  			<option value="s">Sub</option>
			  			<option value="d">Drink</option>
			 			<option value="e">Etc</option>
			</select>
  		</div>
 		 <div class="form-group">
   		 <label for="name">음식 이름</label>
   	 	<input type="text" class="form-control" id="name" name="name">
  		</div>
 		 <div class="form-group">
   		 <label for="price">가격</label>
   	 	<input type="text" class="form-control" id="price" name="price">
  		</div>
 		 <button type="submit" class="btn btn-default">메뉴 등록</button>
		</form>
		</div>
</div>

 