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

	thead{
		background-color:#2E2C8F;
	}
	
	th{
		color:white;
	}
	
	tr{
		border-bottom:1px solid black;
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
	#paperTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	.boardTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}	
	
	.pageArea{
		position:absolute;
		left:25%;
		top:95%;
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
	
	<jsp:include page="../common/aside.jsp" />
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle">경력증명서</span><br><br>
		<hr>
		<br><br>		
		<div align="cetner">
			<table class="boardTable">
				<thead>
					<th width="80">번호</th>
					<th width="200">요청분류</th>
					<th width="100">상태</th>
					<th width="100">요청자</th>
					<th width="200">요청일자</th>
					<th width="200">처리일자</th>
				</thead>
				<tbody>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
					<tr>
						<td>50151</td>
						<td>경력증명서발급</td>
						<td>대기중</td>
						<td>723912</td>
						<td>2020-08-20</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<br><br><br>
			<div class="pageArea">
				<a href="#" class="pageBtn" id="nextPage">이전</a>
				<a href="#" class="pageBtn">1</a>
				<a href="#" class="pageBtn">2</a>
				<a href="#" class="pageBtn">3</a>
				<a href="#" class="pageBtn">4</a>
				<a href="#" class="pageBtn">5</a>
				<a href="#" class="pageBtn">6</a>
				<a href="#" class="pageBtn">7</a>
				<a href="#" class="pageBtn">8</a>
				<a href="#" class="pageBtn">9</a>
				<a href="#" class="pageBtn">10</a>
				<a href="#" class="pageBtn" id="prevPage">다음</a>
			</div>			
		</div>
	</div>
</body>
</html>