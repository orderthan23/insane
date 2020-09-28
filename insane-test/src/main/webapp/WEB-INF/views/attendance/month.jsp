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

	.boardTable thead{
		background-color:#2E2C8F;
	}
	
	.boardTable th{
		color:white;
	}
	
	.boardTable tr{
		border-bottom:1px solid lightgray;
	}
	td{
		font-size:14px;
		font-weight:normal;
	}
	
	#section{
		display:inline-block;
		overflow:hidden;
		width:1300px;
		height:auto;
		background:white;
		position:absolute;
		top:150px;
		left:247px;		
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
	 
	 .item{
	 	display:inline-block;
	 	margin:auto;
	 }
	 
	 .circle{
	 	/* display:inline-block;*/
	 	display:table;
	 	border-radius:100%;
	 	width:50px;
	 	height:50px;	 	
	 	color:white;
	 	font-size:20px;	 	
	 }
	 
	 .num{
	 	display:inline-block;
	 	line-height:2.3;
	 }
	 
	 #items{
	 	display:inline-block;
	 	position:relative;
	 	left:18%;
	 }
	 
	 #total, #attendance, #etc{	 	
	 	background-color:#2E2C8F;
	 }
	 
	 #absence, #late{
	 	background-color:#E58983;
	 }
	 #early, #allday, #morning, #afternoon, #summer, #birth, #care{
	 	background-color:#93A3DA;
	 }
	 
	 #items table{
	 	text-align:center;
	 }	 
	 
	 #average{
	 	font-size:18px;
	 	font-weight:bold;
	 }
	 
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
	<jsp:include page="../common/aside.jsp" />
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="pageTitle">일일부서원 출결 현황</span><br><br>
		<hr>
		<br><br><br>
		<div align="cetner">
			<div id="dateSetting">
				<label>년월선택</label> <input type="date">
			</div>
			<br>
			<div id="items">
				<table align="center">
					<thead>
						<th width="140">평균 근무시간</th>
						<th width="140">평균 정상근무시간</th>
						<th width="140">평균 연장근무시간</th>
						<th width="140">평균 야간근무시간</th>
						<th width="140">전체 휴가일수</th>
						<th width="140">전체 지각횟수</th>
						<th width="140">전체 조퇴횟수</th>
					</thead>
					<tbody>
						<td  id="average">198:00</td>
						<td>160:00</td>
						<td>28:00</td>
						<td>10:00</td>
						<td>10.5일</td>
						<td>2회</td>
						<td>3회</td>
					</tbody>
				</table>				
			</div>
			<br><br>
			<table class="boardTable">
				<thead>					
					<th><input type="checkbox" name="selectAll" class="selectAll"></th>
					<th width="80">년월구분</th>
					<th width="80">직원코드</th>
					<th width="70">사원명</th>
					<th width="70">직급</th>
					<th width="50">부서</th>
					<th width="120">평균출근시간</th>
					<th width="120">평균퇴근시간</th>
					<th width="120">정상근무</th>
					<th width="120">연장근무</th>
					<th width="120">야간근무</th>
					<th width="120">주말출근</th>
					<th width="60">출근</th>
					<th width="60">휴가</th>
					<th width="50">지각</th>
					<th width="50">조퇴</th>
					<th width="50">비고</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>2020.08</td>
						<td>100201</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>개발</td>
						<td>08 : 53</td>						
						<td>88 : 88</td>
						<td>88 : 88</td>
						<td>-- : --</td>
						<td>-- : --</td>
						<td>88 : 88</td>
						<td>19.5</td>
						<td>1.5</td>
						<td> 1 </td>
						<td> 1 </td>
						<td> - </td>						
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
	<script>
		$(function() {
			$(".selectAll").click(function() {
				if($(".selectAll").prop("checked")){
					$(".selected").prop("checked, true");
				} else {
					$(".selected").prop("checked", false);
				}
			});
		})
	</script>
</body>
</html>