<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
	
<style>

	thead{
		background-color:#2E2C8F;
	}
	
	th{
		color:white;
	}
	
	tr{
		border-bottom:1px solid lightgray;
	}
	#section{
		display:inline-block;
		overflow:auto;
		width:1075px;
		height:auto;
		background:white;
		position:absolute;
		top:150px;
		left:400px;		
		border-radius:20px;
	}
	
	.bluerect{
		display:inline-block;		
		width:15px;
		height:30px;
		background-color:#2E2C8F;
		position:relative;
		top:5px;
		left:20px;
	}	
	#retiredTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#retiredKind{
		float:right;	
	}
	
	#searchKind{
		position:absolute;
		left:30%;
	}
	
	#searchingBox {
		position:absolute;
		left:40%;
		bottom:	35px;
	}
	
	.boardTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}	
	
	.pageArea{
		position:absolute;
		/* left:25%; */
		/*  top:95%; */
		bottom:40px;
		width:100%;
	}
	
	 .pageBtn{
	 	text-decoration:none;
	 	color:white;
	 	background:#2E2C8F;
	 	margin:auto auto;
	 	border-radius:5px;
	 	display:inline-block;
	 	width:35px;
	 	text-align:center;
	 	
	 }
	
	.paperRequest{
		color:white;
		width:80px;
		height:30px;
		background-color:#2E2C8F;
		border-radius:5px;
	}
	
	.moveRequest{
		color:white;
		width:80px;
		height:30px;
		background-color:#2E2C8F;
		border-radius:5px;
	}
	
	#searchBtn{
		color:white;
		background-color:#2E2C8F;
		border-radius:5px;
		border:none;
	}
	
	/* button{
		color:white;
		width:150px;
		height:40px;
		background-color:#2E2C8F;
		border-radius:5px;
	} */
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
		<jsp:include page="/WEB-INF/views/common/aside.jsp" />
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="retiredTitle">퇴직자 리스트</span><br><br>
		<hr>
		<br><br>		
		<div align="cetner">
			<!-- <form action="leavingAccept.cr" method="post"></form> -->
			<table class="boardTable">
				<thead>
					<!-- empNoSeq,
					empNo
					enrollDate
					retireDate  
					empNameKor
					empPhone -->
					<th width="180">사원번호</th>
					<th width="150">입사일자</th>
					<th width="150">퇴사일자</th>
					<th width="100">요청자</th>
					<th width="150">연락처</th>
					<th width="80">퇴직증명서</th>
					<th width="80">퇴직금정산</th>
				</thead>
				<tbody>
					<c:forEach var="retired" items="${requestScope.list}" varStatus="status">
						<tr class="item">							
							<input type="hidden" class="seqNum" name="empNoSeq" value="${retired.empNoSeq}">
							<td>${retired.empNo}</td>
							<td>${retired.enrollDate}</td>
							<td name="crtfcStatus">${retired.retireDate}</td>
							<td name="requestEmp">${retired.empNameKor}</td>
							<td name="requestEnrollDate">${retired.empPhone}</td>
							<td><button class="paperRequest" onclick="moveLeavingAccept(this);">발급</button></td>
							<td><button class="moveRequest">이동</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>			
			<br><br>
			<div class="pageArea" align="center">								
				<c:if test="${ requestScope.pi.currentPage < 2 }">
					<a href="#" class="pageBtn" id="prevPage" style="pointer-events:none; cursor:default;">이전</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage > 1 }">
					<c:url var="blistCheck" value="selectRetiredList.em">
						<c:if test="${ requestScope.retiredName != null}">
								<c:param name="name" value="${requestScope.retiredName }"/>
						</c:if>
						<c:param name="currentPage" value="${requestScope.pi.currentPage - 1}"/>
					</c:url>
					<a href="${ blistCheck }" class="pageBtn" id="prevPage">이전</a>
				</c:if>
				
				<c:forEach var="page" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }">										
					<c:if test="${ requestScope.pi.currentPage eq page }">
						<a href="#" class="pageBtn" style="pointer-events:none; cursor:default;">${ page }</a>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage ne page }">
						<c:url var="blistCheck" value="selectRetiredList.em">
							<c:if test="${ requestScope.retiredName != null}">
								<c:param name="name" value="${requestScope.retiredName }"/>
							</c:if>
							<c:param name="currentPage" value="${ page }"/>
						</c:url>
						<a href="${ blistCheck }" class="pageBtn">${ page }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
					<a href="#" class="pageBtn" id="nextPage" style="pointer-events:none; cursor:default;">다음</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
					<c:url var="blistCheck" value="selectRetiredList.em">
						<c:if test="${ requestScope.retiredName != null}">
								<c:param name="name" value="${requestScope.retiredName }"/>
						</c:if>
						<c:param name="currentPage" value="${ requestScope.pi.currentPage + 1 }"/>
					</c:url>
						<a href="${ blistCheck }" class="pageBtn" id="nextPage">다음</a>
				</c:if>
			</div>
			<div align="center"><input type="text" id="searchBox" style="">&nbsp;<button type="button" id="searchBtn" onclick="search();">검색</button></div>
		</div>
	</div>
	
	<script>
		 /* $(function(){
			$(".item").click(function(){
				var seqNum = $(this).children(".seqNum").text();
				//var testNum = $(this).children(".testNum").text();
				
				//console.log(testNum);
				
				location.href="selectOne.cr?num=" + seqNum
				
			})
		}) */
	
		/* function changePaperKind(object){
			//location.href="${pageContext.request.contextPath}/selectList.cr";
			//var kind = $("paperKind").val();
			//var kind = object.val();
			
			console.log(object);
			
			location.href="${pageContext.request.contextPath}/selectList.cr?kind=" + object;
		} */
		
		function search(){
			var name = $("#searchBox").val();
			
			location.href="${pageContext.request.contextPath}/selectRetiredList.em?name=" + name;
		}
		
		function changePaperKind(object){
			//location.href="${pageContext.request.contextPath}/selectList.cr";
			//var kind = $("paperKind").val();
			//var kind = object.val();
			
			console.log(object);
			
			location.href="${pageContext.request.contextPath}/selectList.cr?kind=" + object;
		} 
		
		function moveLeavingAccept(object){
			var num = $(object).parents(".item").children(".seqNum").val();
			
			console.log(num);			
			
			location.href="${pageContext.request.contextPath}/selectRetiredEmp.em?num=" + num;
		}
	</script>
</body>
</html>