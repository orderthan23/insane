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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#mainContent{
	    display: block;
	    order: 2;   
	    height : 100%;
	    padding: 2em;
	    margin-left: auto;
	    margin-right: auto;
	}
	#contentArea{
	    background : #ffffff;
	    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	    border-radius: 15px;
	    width: 1075px;
	    height: 820px;
	}
	#bluebox{
		display: inline-block;
		width: 11px;
		height: 21px;
		background-color: #2E2C8F;
		vertical-align: text-bottom;
	}
	#contentHeader{
		padding-top: 30px;
		padding-left: 30px;
		padding-right: 30px;
		font-size: 18px;
		font-weight: 700;
	}
	#headerLine{
		display: inline-block;
		width: 1015px;
		margin-left: 30px;
		height: 1px;
		background-color: black;
	}
	#btnArea{
		margin-top: 25px;
		margin-right: 30px;
		text-align: right;
	}
	.deptInsertBtn, #searchBtn{
		color: white;
		background-color: #2E2C8F;
		width: 100px;
		height: 25px;
		padding-top: 6px;
		padding-bottom: 6px;
		padding-left: 15px;
		padding-right: 15px;
		text-align: center;
		font-size: 13px;
	}
	.deptInsertBtn:hover, #searchBtn:hover{
		cursor: pointer;
	}
	#searchTableArea{
		display: table;
		width: 1015px;
		height: 50px;
		margin: 25px auto;
 		text-align: -webkit-center;
		border: 1px black solid;
		border-radius: 10px;
	}
	#searchForm{
		display:table-cell;
		vertical-align: middle;
		margin-top: auto;
		margin-bottom: auto;
	}
	#searchTable {
		text-align: center;
	}
	input[type=text] {
		width: 120px;
	}
	.searchBox {
		text-align: left;
	}
	#deptTable {
		width: 1015px;
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	#deptTable th {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-size: 15px;
	}
	#deptTable tbody td {
		font-size: 12px;
		text-align: center;
		padding: 10px;
		border-bottom: 1px solid black;
	}
	#deptTable tbody tr:hover {
		cursor: pointer;
		background: #2E2C8F;
		color: white;
	}
	#deptTableArea {
		display: inline-block;
		height: 580px;
		overflow: auto;
	}
	#deptTableArea::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#deptTableArea::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	#tableArea {
		text-align: -webkit-center;
	}
	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
		background-color: #fefefe;
		margin: 21% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		border-radius: 10px;
		width: 1000px; /* Could be more or less, depending on screen size */
		height: 250px;
	}
	
	/* The Close Button */
	.close {
		height: 21px;
		color: #aaa;
		float: right;
		font-size: 30px;
		font-weight: bold;
		text-align: right;
	}
	
	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	#modal-title{
		display: inline-block;
		height: 21px;
		line-height: 25px;
	}
	#model-headerLine{
		display: inline-block;
		width: 100%;
		height: 1px;
		background-color: black;
	}
	#insertTable {
		width: 100%;
		height: 200px;
		margin: 15px auto;
		text-align: center;
	}
	#insertTable .menuColumn {
		display: table-cell;
		vertical-align: middle;
		color: white;
		background-color: #2E2C8F;
		width: 120px;
		height: 20px;
		padding: 10px;
		text-align: center;
		font-size: 15px;
	}
	.menuTd{
		text-align: -webkit-center;
	}
	#insertTable .inputColumn {
		display: table-cell;
		border: 1px solid #c4c4c4;
		padding: 8px;
		width: 200px;
		text-align: left;
	}
	#insertTable .inputColumn input, #insertTable .inputColumn select {
		width: 150px;
	}
	#insertTable .inputColumn2 {
		display: table-cell;
		border: 1px solid #c4c4c4;
		padding: 10px;
		width: 1200px;
		text-align: left;
	}
	.submitBtn{
		display: table-cell;
		vertical-align:middle;
		color: white;
		background-color: #2E2C8F;
		width: 80px;
		height: 20px;
		padding: 6px 15px;
		text-align: center;
		font-size: 13px;
	}
	.submitBtn:hover{
		cursor: pointer;
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../../common/adminSetting/adminNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="../../common/adminSetting/adminAside.jsp" />
		<div id="mainContent">
	        <div id="contentArea">
				<div id="contentHeader">
					<div id="bluebox"></div>
					<label>부서 목록</label>
				</div>
				<div id="headerLine"></div>
				<div id="btnArea">
					<span id="insertBtn" class="deptInsertBtn">+&nbsp;&nbsp;부서추가</span>
					<span class="deptInsertBtn" style="background-color: orangered;">-&nbsp;&nbsp;부서삭제</span>
				</div>
				<div id="tableArea">
					<div id="searchTableArea">
						<form id="searchForm" action="">
							<table id="searchTable">
								<tr>
									<td width="100px">
										<label>부서코드 :</label>
									</td>
									<td class="searchBox" width="150px">
										<input type="text" placeholder="부서코드로 검색">
									</td>
									<td width="100px">
										<label>부서명 :</label>
									</td>
									<td class="searchBox" width="150px">
										<input type="text" placeholder="부서명으로 검색">
									</td>
									<td width="100px">
										<label>사용여부</label>
									</td>
									<td class="searchBox" width="100px">
										<select>
											<option>사용</option>
											<option>미사용</option>
										</select>
									</td>
									<td width="100px">
										<span id="searchBtn">검색하기</span>
									</td>
								</tr>
							</table>
						</form>
					</div>	<!-- searchTableArea -->
					
 					<div id="deptTableArea">
						<table id="deptTable">
							<thead>
								<tr>
									<th width="10px"><input type="checkbox"></th>
									<th width="120px">부서명</th>
									<th width="120px">상위 부서</th>
									<th width="70px">사용 여부</th>
									<th width="100px">생성일자</th>
									<th width="70px">정원</th>
									<th width="70px">현원</th>
									<th width="100px">부서 전화번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="d" items="${ list }">
									<tr>
										<td><input type="checkbox"></td>
										<input type="hidden" value="${ d.deptCodeSeq }">
										<td><c:out value="${ d.deptName }" /></td>
										<td><c:out value="${ d.upperDeptName }" /></td>
										<td><c:out value="${ d.usageStatus }" /></td>
										<td><c:out value="${ d.genDate }" /></td>
										<td><c:out value="${ d.deptLimit }" /></td>
										<td><c:out value="${ d.deptPresent }" /></td>
										<td><c:out value="${ d.deptTel }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
 					</div>
					
				</div>	<!-- tableArea End -->
			</div>  <!--   contentArea End -->
		</div>  <!--   mainContent End -->
	</div>	<!-- contentWrapper -->
	
	<!-- modal -->
	<div id="insertDept" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<div id="bluebox"></div>
				<h3 id="modal-title">부서 등록</h3>
				<div class="close">&times;</div>
				<div id="model-headerLine"></div>
			</div>	<!-- modal-header end -->
			<div class="modal-body">
				<form id="insertDeptInfoForm" action="insertDept.or" method="post">
					<table id="insertTable">
						<tr>
							<td class="menuTd" width="150px">
								<span class="menuColumn">부서명 설정</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<input id="deptName" type="text" name="deptName">
								</span>
							</td>
							<td class="menuTd" width="150px">
								<span class="menuColumn">상위 부서코드 설정</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<select id="upperDeptCode" name="upperDeptCode" style="height: 22px; width: 157px;">
										<option value="" selected>선택</option>
										<c:forEach var="up" items="${ list }">
											<option value="${ up.deptCodeSeq }">${ up.deptName }</option>
										</c:forEach>
									</select>
								</span>
							</td>
							<td class="menuTd" width="150px">
								<span class="menuColumn">생성일자</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<input id="genDate" type="date" name="genDate" style="width: 152px;">
								</span>
							</td>
						</tr>
						<tr>
							<td class="menuTd">
								<span class="menuColumn">사용여부 설정</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<select id="usageStatus" name="usageStatus" style="height: 22px; width: 157px;">
										<option value="">==선택==</option>
										<option value="Y">사용</option>
										<option value="N">미사용</option>
									</select>
								</span>
							</td>
							<td class="menuTd">
								<span class="menuColumn">기준 정원 수</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<input id="deptLimit" type="text" name="deptLimit">
								</span>
							</td>
							<td class="menuTd">
								<span class="menuColumn">전화번호</span>
							</td>
							<td class="inputTd">
								<span class="inputColumn">
									<input id="deptTel" type="text" name="deptTel">
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6" style="text-align: -webkit-right;">
								<input id="deptCodeSeq" type="hidden" name="deptCodeSeq">
								<input type="hidden" name="deptStep" value="0">
								<div id="insertSubmitBtn" class="submitBtn">등록하기</div>
								<div id="updateSubmitBtn" class="submitBtn">부서 정보 수정</div>
							</td>
						</tr>
					</table>
				</form>
			</div>	<!-- modal-body -->
		</div>	<!-- modal-content end -->
	</div>	<!-- modal end -->
	
<script type="text/javascript">

	var modal = document.getElementById("insertDept");
	var outModal = document.getElementsByClassName("close")[0];
	
	$(document).on("click", "#insertBtn", function() {
		modal.style.display = "block";
		
		$("#modal-title").html("");
		$("#modal-title").html("부서 등록");
		
		$("#deptName").val("");
		$("#upperDeptCode").val("").prop("selected", true);
		$("#genDate").val("");
		$("#usageStatus").val("").prop("selected", true);
		$("#deptLimit").val("");
		$("#deptTel").val("");
		
		$("#insertSubmitBtn").show();
		$("#updateSubmitBtn").hide();
	});
	
	outModal.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	$("#insertSubmitBtn").click(function() {
		
		var upper = $("#upperDeptCode").val();
		
		console.log("upper : " + upper);
		
		$("#insertDeptInfoForm").submit();
	});
	
	$(document).on("click", "#deptTable td", function() {
		var num = $(this).parent().children("input").val();
		console.log("num : " + num);
		
		/* companyNo은 세션에서 뺴와서 data에 넣을 것. */
		$.ajax({
			url: "selectOneDept.or",
			type: "post",
			data: {
				num: num
			},
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modal-title").html("");
				$("#modal-title").html("부서 정보");
				
				$("#updateSubmitBtn").show();
				$("#insertSubmitBtn").hide();
				
				$("#deptCodeSeq").val(data.dept.deptCodeSeq);
				$("#deptName").val(data.dept.deptName);
				$("#upperDeptCode").val(data.dept.upperDeptCode).prop("selected", true);
				$("#genDate").val(data.dept.genDate);
				$("#usageStatus").val(data.dept.usageStatus).prop("selected", true);
				$("#deptLimit").val(data.dept.deptLimit);
				$("#deptTel").val(data.dept.deptTel);
				
			},
			error: function() {
				console.log("Ajax Failed")
			}
		});
	});
	
	$("#updateSubmitBtn").click(function() {
		
		var upper = $("#upperDeptCode").val();
		
		console.log("upper : " + upper);
		
		$("#insertDeptInfoForm").attr("action", "updateDeptInfo.or");
		$("#insertDeptInfoForm").submit();
	});
	
</script>
</body>
</html>

















