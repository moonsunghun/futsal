<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="div-container">
	<div class="container" style="margin-left: 50px; width:1000px; height:700px;overflow: auto;">
		<h2>멤버 리스트</h2>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>PW</th>
						<th>Grade</th>
						<th>Delete</th>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mvo" items="${mList}">
						<tr>
							<td>${mvo.id }</td>
							<td>${mvo.pw }</td>
							<td>${mvo.grade }</td>
							<td>
							<a href="./pCtrl?flag=11&id=${mvo.id}"><img src="img/trash2.png">
							</a>
							</td>
							<td>
								<a href="admin.jsp?destPage=memberModify&id=${mvo.id}&pw=${mvo.pw}&grade=${mvo.grade}">
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
		<h1>멤버 등록</h1>
		<form action="./pCtrl" method="post">
		<input type="hidden" name ="flag" value="12">
		<input type="hidden" name ="tNum" value="0">
		<input type="hidden" name ="status" value="empty">
 		 <div class="form-group">
   		 <label for="id">ID</label>
   	 	<input type="text" class="form-control" id="id" name="id">
  		<span id="checkid"></span>
  		</div>
 		 <div class="form-group">
   		 <label for="pw">PW</label>
   	 	<input type="text" class="form-control" id="pw" name="pw">
  		</div>
 		 <div class="form-group">
   		 <label for="grade">Grade</label>
   	 	<input type="text" class="form-control" id="grade" name="grade">
  		</div>
 		 <button type="submit" class="btn btn-default">멤버 등록</button>
		</form>
		</div>
</div>

 <script>
    $("#id").blur(
    	function(){
    		$.post("../__PoS_Ex/pCtrl",
    				{'id':$('#id').val(),
    				'flag' : '13'
    				},
    				function(data)
    				{
    					if(data == '0')
    						{
    							$('#checkid').html("you can use this Email").css("color","green");
    						}
    					else
    						{
    							$('#checkid').html("someone is already using it").css("color","red");
    							$('#id').focus();
    						}
    				});
    	});
    </script>