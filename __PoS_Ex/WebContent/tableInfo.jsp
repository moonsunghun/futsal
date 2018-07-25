                                                                       <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
			<div style = "width:50%; float:left;border: 1px solid;height:751px;">
				<div style="font-size: 50px;width:100%; height:20%;">
					<div align ="center" style = "width :50%; border:solid 1px; float:left;  padding:10px;">
					테이블 번호 : ${tNum}
					</div>
					<div align ="center" style = "width :50%;border:solid 1px; float:left; padding:10px;">	
						상태 : ${status }
					</div>
				</div>
				
				<div class="container" style="font-size:20px;width:100%;height:40%;overflow: auto;">
					<table class="table table-striped">
						<thead>
						<tr>
							<th>No</th>
							<th>상품명</th>
							<th>수량</th>
							<th>가격</th>
							<th>주문취소</th>
						</tr>
						</thead>
						<tbody >
						<c:set var ="sum" value="0" />
						<c:set var ="count" value="1" />
						<c:forEach var="pvo" items="${ptList}">
							<tr>
								<td>${count}</td>
								<td>${pvo.name}</td>
								<td>${pvo.count}</td>
								<td>${pvo.price}</td>
								<td>
								<c:choose>
									<c:when test="${status eq 'order'}">
									<a href="./pCtrl?flag=5&tNum=${pvo.tNum}&name=${pvo.name}&status=${pvo.status}">
									</c:when>
									<c:otherwise>
									<a href="./pCtrl?flag=5&tNum=${pvo.tNum}&name=${pvo.name}&status=use">
									</c:otherwise>
								</c:choose>
								<img src="img/trash2.png">
								</a>
								</td>
							</tr>
							
							<c:set var ="sum" value = "${sum + pvo.price*pvo.count }" />
							<c:set var ="count" value="${count +1 }" />
						</c:forEach>
						</tbody>
					</table>
				</div>
				<h1> 총 금액 : ${sum}</h1>
				<c:choose>
				<c:when test="${status eq 'order' }">
				<div style="height:30%; ">
				<a href="./pCtrl?flag=1&status=use&tNum=${tNum}">
					<div class="btn btn-primary" style="width:100%; height:100%">
						주문 완료
					</div>
				</a>
				</div>
				</c:when>
				<c:otherwise>
				<div style="height:30%; ">
				<a href="./pCtrl?status=order&tNum=${tNum}&flag=3">
					<div class="btn btn-primary" style="width:33%; height:100%">
						추가 주문
					</div>
				</a>
				<a href=# data-toggle="modal" data-target="#cash-modal">
					<div class="btn btn-warning" style="width:33%; height:100%">
						현금 결제
					</div>
				</a>
				<a href=# data-toggle="modal" data-target="#card-modal">
					<div class="btn btn-danger" style="width:33%; height:100%">
						카드 결제
					</div>
				</a>
				</div>
				</c:otherwise>
				</c:choose>
			</div>
			
			 <div class="modal fade" id="cash-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">현금 결제</h4>
                    </div>
                    <div class="modal-body">
                        <form action="./pCtrl" method="post">
                        <input type="hidden" name="flag" value="0">
                        <input type="hidden" name="tNum" value=${tNum }>
                            <div class="form-group">
                            	<h4>총 금액   : ${sum}</h4>
                            </div>
                            <div class="form-group">
                            	<h4>받은금액 : <input type="text" id="money" name="money" style="width:150px;"> </h4>
                            </div>
                            	<span id="change"></span>
                            	<br>
                            	<br>
                            	 <p class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> 결 제</button>
                              </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
			
			 <div class="modal fade" id="card-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
            <div class="modal-dialog modal-sm">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="Login">카드 결제</h4>
                    </div>
                    <div class="modal-body">
                        <form action="./pCtrl" method="post">
                        <input type="hidden" name="flag" value="0">
                        <input type="hidden" name="tNum" value=${tNum }>
                            <div class="form-group">
                            	<h4>총 금액   : ${sum}</h4>
                            </div>
                             <p class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> 결 제</button>
                              </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
			
<script>
	$("#money").blur(
		function()
		{
			var money = parseInt($('#money').val());
			var sum = parseInt("${sum}")
			if( money < sum)
				{
					$('#change').html("받은 금액이 모자 랍니다.<br> 모자란 금액은 : " + (sum-money));
				}
			else 
				{
					$('#change').html("잔돈 : " + (money - sum));
				}
		}
	)
	
</script>	