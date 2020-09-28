<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
	
<style>
	#section{
		display:inline-block;
		overflow:auto;
		width:1075px;
		height:780px;
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
	
	.paperArea {
		/* border:2px solid black; */
		dispaly:inline-block;
		width:500px;
		height:482px;
		position:absolute;
		left: 250px;
		bottom:135px;
	}
	
	.titleArea{
		/* border:2px solid black; */
		border-bottom:2px solid black;
		dispaly:inline-block;
		width:500px;
		height:50px;
		position:absolute;
		left: 250px;
	}
	
	#paperTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#paperTable{
		border-collapse:collapse;
		/* border-spacing:0 80px; */
		line-height:2;
	}
	
	#paperTable td{
		border-bottom: 1px solid black;
	}
	
	button{
		color:white;
		width:150px;
		height:40px;
		background-color:#2E2C8F;
		border-radius:5px;
	}
	
	.paperDoc{
		width:400px;
		height:30px;
		margin:auto;
		display:block;
		border:none;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<jsp:include page="../common/aside.jsp" />
	
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle">근로계약서</span><br><br>
		<hr>
		<br><br>
		<div class="titleArea" align="center">
			<h3>근로계약서</h3>
		</div>
		<div class="paperArea" align="center">
			<table id="paperTable">		
			<tr>
				<td>사원명</td>
				<td colspan="4"><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>연락처</span></td>
				<td colspan="3"><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>업무부서</span></td>
				<td><input type="text" readonly></td>
				<td>직급</td>
				<td><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>보관기간</span></td>
				<td colspan="3"><input type="Date" readonly>~<input type="Date"></td>
			</tr>
			<tr>
				<td colspan="4"><button type="button" class="paperDoc">근로계약서 양식 저장</button></td>				
			</tr>
			<tr>
				<td colspan="4"><button type="button" class="paperDoc">근로계약서 양식 출력</button></td>
			</tr>
			<tr>
				<td colspan="4"><button type="button" class="paperDoc">근로계약서 사본 저장</button></td>
			</tr>
			<tr>
				<td>담당자</td>
				<td><input type="text" readonly></td>
				<td>직책</td>
				<td><input type="text" readonly></td>
			</tr>
			<tr>
				<td>담당부서</td>
				<td><input type="text" readonly></td>
				<td>연락처</td>
				<td><input type="text" readonly></td>
			</tr>			
		</table>			
		<br><br>
		<button class="btnAccept">저장</button>	
		<button class="btnCancle">취소</button>
		</div>
	</div>
</body>
</html>