<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container" style="width:50%; float:left;">
  <h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Main</a></li>
    <li><a data-toggle="tab" href="#menu1">Sub</a></li>
    <li><a data-toggle="tab" href="#menu2">Drink</a></li>
    <li><a data-toggle="tab" href="#menu3">Etc</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Main</h3>
      <c:forEach var ="pvo" items="${pList }">
      <a href="./pCtrl?status=order&tNum=${tNum }&name=${pvo.name}&flag=2">
      	<div class="btn btn-primary">
      		${pvo.name }
      	</div>
      </a>
      
      </c:forEach>
       <jsp:include page="paging.jsp">
					<jsp:param value ="${paging.prevBlock }" name="prevBlock" />
					<jsp:param value ="${paging.startNo }" name="startNo" />
					<jsp:param value ="${paging.totalPage }" name="totalPage" />
					<jsp:param value ="${paging.cPage }" name="cPage" />
					<jsp:param value ="${paging.endNo }" name="endNo" />
					<jsp:param value ="${paging.nextBlock }" name="nextBlock " />
					</jsp:include>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Sub</h3>
 		<c:forEach var ="sub" items="${subList}">
     	 <a href="./pCtrl?status=order&tNum=${tNum}&name=${sub.name}&flag=2">
      		<div class="btn btn-primary">
      		${sub.name}
      		</div>
      	</a>
      	</c:forEach>    
      </div>
   		 <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
		<c:forEach var ="drink" items="${drinkList}">
     	 <a href="./pCtrl?status=order&tNum=${tNum}&name=${drink.name}&flag=2">
      		<div class="btn btn-primary">
      		${drink.name}
      		</div>
      	</a>
      	</c:forEach>      </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
		<c:forEach var ="etc" items="${etcList}">
     	 <a href="./pCtrl?status=order&tNum=${tNum}&name=${etc.name}&flag=2">
      		<div class="btn btn-primary">
      		${etc.name}
      		</div>
      	</a>
      	</c:forEach>      </div>
      
     
  </div>
</div>
