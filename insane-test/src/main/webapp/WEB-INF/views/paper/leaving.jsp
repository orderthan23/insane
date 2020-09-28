<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<style>
	#section{
		display:inline-block;
		overflow:auto;
		width:400px;
		height:760px;
		background:white;
		position:absolute;
		border-radius:20px;
		font-weight: normal;
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
	
	.paperArea {
		/* border:2px solid black; */
		dispaly:inline-block;
		width:400px;
		height:482px;
		/* position:absolute;
		left: 250px;
		bottom:135px; */
	}
	
	.titleArea{
		/* border:2px solid black; */
		border-bottom:2px solid black;
		dispaly:inline-block;
		width:400px;
		height:50px;
		
	}
	
	#paperTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#retireTable{
		border-collapse:collapse;
		/* border-spacing:0 80px; */
		width:100%;
		line-height:2;		
		/* margin:auto auto; */
		text-align:center;
	}
	
	thead{
		background-color:#2E2C8F;
	}
	
	th{
		color:white;
	}
	
	tr{
		border-bottom:1px solid lightgray;
	}
	
	button{
		color:white;
		width:150px;
		height:40px;
		background-color:#2E2C8F;
		border-radius:5px;
	}
	
	#paperTable textarea{
		margin-top:5px;
	}
</style>
</head>
<body>
	
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle" style="font-weight: bolder;">퇴직증명서</span><br><br>
		<br>
		<div class="titleArea" align="center">
			<h3>퇴직인원 목록</h3>
		</div>
		<br>
		<form action="insertCareer.cr" method="post">
			<%-- <input type="hidden" name="userNo" value="${sessionScope.loginUser.empNoSeq}">
			<input type="hidden" name="companyNo" value="${sessionScope.loginUser.companyNo}"> --%>
		<div class="paperArea">
			<table id="retireTable">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${fn:contains(auth,'CT2')}">
					<c:forEach var="emp" items="${ requestScope.list }">
						<tr class="empTr">
							<input class="empSeq" name="empSeq" type="hidden" value="${emp.empNoSeq}">
							<input class="positionCode" name="positionCode" type="hidden" value="${emp.empPositionCode}">
							<input class="deptCode" name="deptCode" type="hidden" value="${emp.empDeptCode}">
							<td>${emp.empNo}</td>
							<td>${emp.empNameKor}</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>									
			</table>			
		<br><br>		
<!-- 		<button class="btnRequest">발급요청</button>	
		<button class="btnCancle">취소</button> -->
		</div>
		</form>
	</div>
	<script>
	$(function() {
		$(".empTr").click(function(){			
			var empSeq = $(this).children(".empSeq").val();
			var positionCode = $(this).children(".positionCode").val();
			var deptCode = $(this).children(".deptCode").val();
		
			window.opener.location.href="${pageContext.request.contextPath}/insertLeaving.cr?empSeq=" + empSeq + "&positionCode=" + positionCode + "&deptCode=" + deptCode;
			self.close();
		});
	});	
	</script>
	
</body>
</html>