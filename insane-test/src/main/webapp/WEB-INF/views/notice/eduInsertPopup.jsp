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
		border-bottom:1px solid black;
	}
	
	#top{
		position:relative;
		top:0px;
	}
	
	#bottom{
		position:relative;
		bottom:10px;
	}
	
	#section{
		display:inline-block;
		overflow:hidden;
		width:500px;
		height:auto;
		background:white;
		position:absolute;
	}
	
	#secHead{
		display:inline-block;
		width:100%;
		height:50px;
		background-color:#2E2C8F;
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
	#pageTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	.memberTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}	
	
	.searchTable{
		margin:auto auto;
		text-align:center;
		line-height:2;
	}
	
	.pageArea{
		position:absolute;
		left:25%;
		bottom:20px;
	}
	
	.bottomArea{
		position:absolute;
		left:25%;
		bottom:40px;
	}
	
	 .pageBtn{
	 	text-decoration:none;
	 	color:white;
	 	background:#2E2C8F;
	 	margin:auto auto;
	 	border-radius:5px;
	 	display:inline-block;
	 	font-size:13px;
	 	width:25px;
	 	text-align:center;
	 }
	 button{
	 	background:#2E2C8F;
	 	color:white;
	 	margin:auto auto;
	 	border-radius:5px;
	 }
	 
	 .btnArea{
	 	position:absolute;
		left:80%;
		bottom:40px;
	 }
	 
	 #insertBtn{
	 	position:absolute;
		left:35%;		
		bottom:0px;
		width:100px;
		height:30px;
	 }
	
	#cancleBtn{
		position:absolute;
		left:57%;
		bottom:0px;
		width:100px;
		height:30px;
	}
	
	#searchBtn{
		position:absolute;
		right:5px;
		top:14%;		
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
	<div id="section">
	<div id="secHead"></div>
		<br>
		<div class="bluerect"></div><span id="pageTitle">교육대상자 설정</span><br><br>
		<hr>
		<br><br>		
		<div align="cetner">
			<div>
				<button id="searchBtn" type="button"><img src="resources/images/lensBtn.png">검색</button>
				<table class="searchTable">
				<tr>
					<td width="100">사원명</td>
					<td><input type="text" style="width:150px"></td>
					<td width="100">부서명</td>
					<td><input type="text" style="width:150px"></td>
				</tr>
				<tr>
					<td>사원번호</td>
					<td><input type="text" style="width:150px"></td>
					<td>직급명</td>
					<td><input type="text" style="width:150px"></td>
				</tr>
				</table>
				<br><br>
			</div>
			<div id="top">
				<table class="memberTable">
				<thead>
					<th><input type="checkbox" name="selectAll" class="selectAll"></th>
					<th width="80">번호</th>
					<th width="200">사원번호</th>
					<th width="100">사원명</th>
					<th width="100">직급명</th>
					<th width="100">직책</th>
					<th width="200">부서명</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>										
				</tbody>
			</table>
			<br>
			<div class="btnArea">
				<button class="addBtn" type="button">추가</button>
				<button class="deleteBtn" type="button">삭제</button>
			</div>
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
			
			<br><hr><br>
			<div id="bottom">
			<table class="memberTable">
				<thead>
					<th><input type="checkbox" name="selectAll" class="selectAll"></th>
					<th width="80">번호</th>
					<th width="200">사원번호</th>
					<th width="100">사원명</th>
					<th width="100">직급명</th>
					<th width="100">직책</th>
					<th width="200">부서명</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="selected" class="selected"></td>
						<td>1</td>
						<td>200002</td>
						<td>린가드</td>
						<td>대표이사</td>
						<td>임원</td>
						<td>경영지원팀</td>
					</tr>										
				</tbody>
			</table>
			<br><br><br><br>			
			<div class="bottomArea">
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
				<button id="insertBtn">확인</button>
				<button id="cancleBtn">취소</button>			
			</div>
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