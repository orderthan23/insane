<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	td{
		font-size:14px;
		font-weight:normal;
	}
	
	#section{
		display:inline-block;
		overflow:hidden;
		width:1075px;
		height:auto;
		background:white;
		position:absolute;
		top:150px;
		left:350px;		
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
	
	#dateSetting{
		position:absolute;
		top:100px;
		left:140px;
	}
	
	#pageTitle{
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
		left:28%;
		bottom:40px;
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
	 
	 .noticeBtn{
	 	background:#2E2C8F;
	 	color:white;
	 	margin:auto auto;
	 	border-radius:5px;
	 }
	 
	 .btnArea{
	 	position:absolute;
		left:73%;
		bottom:40px;
	 }
	 
	 button{
		color:white;
		width:100px;
		height:25px;
		position:absolute;
		left:64%;
		top:81px;
		background-color:#2E2C8F;
		border-radius:5px;
	 }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<jsp:include page="../common/aside.jsp" />
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="pageTitle">휴가내역</span><br><br>
		<hr>
		<br><br><br>
		<div align="cetner">
			<div id="dateSetting">
				<label>년월선택</label> <input type="date">
			</div>
			<table class="boardTable">
				<thead>					
					<th width="80">사번</th>
					<th width="100">사원명</th>
					<th width="80">부서</th>
					<th width="80">직급</th>
					<th width="150">휴가구분</th>
					<th width="150">시작일자</th>
					<th width="150">종료일자</th>
				</thead>
				<tbody>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
					</tr>
					<tr>
						<td>100201</td>
						<td>린가드</td>
						<td>개발</td>
						<td>대표이사</td>
						<td>평생휴가</td>						
						<td>2020-08-19</td>
						<td>2999-12-31</td>
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
			<br><br>
		</div>
	</div>
</body>
</html>