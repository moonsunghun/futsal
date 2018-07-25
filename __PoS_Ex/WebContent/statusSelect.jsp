<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div style = "width:50%; float:left; font-size: 50px;">
				<div>
					<div align ="center" style = "width :50%; border: 1px solid; float:left; padding:10px;">
					테이블 번호 : ${tNum}
					</div>
					<div align ="center" style = "width :50%; border: 1px solid; float:left; padding:10px;">	
						상태 : ${status }
					</div>
					</div>
					<div>
				<c:choose>
				<c:when test="${status eq 'empty' && tNum ne 0}">
				<a href="./pCtrl?status=order&tNum=${tNum}&flag=3"><button class="btn btn-info">
					사용
				</button></a>
					<a href="./pCtrl?status=Reserves&tNum=${tNum }&flag=4"><button class="btn btn-success">예약</button></a>
				</c:when>
				<c:when test="${status eq 'Reserves'}">
					<a href="./pCtrl?status=order&tNum=${tNum }&flag=3"><button class="btn btn-info" >사용</button></a>
					<a href="./pCtrl?status=empty&tNum=${tNum }&flag=4"><button class="btn btn-success">예약 취소</button></a>
				</c:when>
				
				</c:choose>
		</div>
				</div>
				
			