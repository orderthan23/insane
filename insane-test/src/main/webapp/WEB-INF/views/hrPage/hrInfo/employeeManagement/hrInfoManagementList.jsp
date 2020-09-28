<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hrInfoLayout.css">
<meta charset="UTF-8">
<title>개인 인사정보 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#mainContent{
		display: block;
		order: 2;   
		height : 100%;
		padding: 2em;
		margin-left: auto;
		margin-right: auto;
		font-family: 'NanumSquare';
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
	#empInsertBtn{
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
	#empInsertBtn:hover{
		cursor: pointer;
	}
	/* on/off 버튼 start */
	#switchArea{
		padding-left: 30px;
		padding-right: 30px;
	}
	.switch {
		position: relative;
		display: inline-block;
		width: 50px;
		height: 22px;
		vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {
		display:none;
	}
	
	/* The slider */
	.slider {
		position: absolute;
		cursor: pointer;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #ccc;
		-webkit-transition: .4s;
		transition: .4s;
	}
	
	.slider:before {
		position: absolute;
		content: "";
		height: 18px;
		width: 18px;
		left: 4px;
		bottom: 2px;
		background-color: white;
		-webkit-transition: .4s;
		transition: .4s;
	}
	
	input:checked + .slider {
		background-color: #2E2C8F;
	}
	
	input:focus + .slider {
		box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
		-webkit-transform: translateX(26px);
		-ms-transform: translateX(26px);
		transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
		border-radius: 34px;
	}
	
	.slider.round:before {
		border-radius: 50%;
	}
	
	.onoffSwitch {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
	/* on/off 버튼 end */
	#tableArea {
		margin-top: 10px;
		margin-bottom: 10px;
		padding-left: 30px;
		padding-right: 30px;
		height: 80%;
	}
	#tableArea input[type=checkbox] {
		vertical-align: middle;
	}
	#searchTable {
		width: 100%;
		text-align: center;
		border-collapse: collapse;
		border-top: 1px solid #D9D5EC;
	}
	#listArea {
		height: 88%;
	}
	#listTable {
		width: 100%;
		text-align: center;
		border-collapse: collapse;
	}
	#searchTable td, #listTable th, #listTable td {
		border-bottom: 1px solid #D9D5EC;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	#listTable th {
		background: #2E2C8F;
		color: white;
		font-size: 16px;
	}
	#listTable td {
		font-size: 13px;
	}
	#listTable tbody tr:hover {
		cursor: pointer;
		background: #B3B3CD;
	}
	.searchText1, .column1 {
		width: 60px;
		height: 20px;
	}
	.searchText2, .column2 {
		width: 100px;
		height: 20px;
	}
	.pageBtn {
		border: 2px solid #2E2C8F;
		border-radius: 8px;
		padding: 8px;
		font-size: 12px;
		display: inline-block;
		width: 30px;
		height: 12px;
	}
	.numBtn {
		width: 12px;
	}
	.checkBtn {
		background: #2E2C8F;
		color: white;
	}
	.pageBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../../../common/header.jsp" />
	<jsp:include page="../../../common/hrPage/hrNav.jsp" />
	<div id="contentWrapper">
		<aside>
            <div id="profileZone">
            <c:if test="${empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
            </c:if>
            <c:if test="${!empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
            </c:if><br><br>
            <p style="font-size: 17px;">${companyInfo.companyName }</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">${companyInfo.businessBigType}</p>
            </div>
            <br> <br>
            <div id="sideMenu" align="center">
                <p style="font-size:20px;">인사정보 관리</p>
                <br><br>
                <a style=" text-decoration:none; color:white;" href="organizationChart.or">조직도 관리</a>
                <br>
                <a style=" background:#524FE3; text-decoration:none; color:white;" href="hrInfoManagementList.em">사원 목록 조회</a>
                <br>
                <a style=" text-decoration:none; color:white;" href="selectList.cr">증명서 발급 내역</a>
                <br>
            </div>
        </aside>
   		<div id="mainContent">
		<div id="contentArea">
			<div id="contentHeader">
				<div id="bluebox"></div>
				<label>사원정보조회</label>
			</div>	<!-- contentHeader End -->
			<div id="headerLine"></div>
				<div id="btnArea">
					<span id="empInsertBtn">+&nbsp;&nbsp;직원추가</span>
			</div>
			
			<div id="switchArea">
				<label class="switch">
					<input type="checkbox">
					<span class="slider round"></span>
				</label>
				<p class="onoffSwitch">비활성화된 직원 보기</p>
				<p class="onoffSwitch" style="display:none;">활성화된 직원만 보기</p>
			</div>	<!-- switchArea End -->
			<div id="tableArea">
				<form id="searchEmployeeForm" name="searchEmployeeForm">
					<table id="searchTable">
						<tr>
							<td width="80px"><input class="searchText1" type="text" name="empNo" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="empNameKor" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="empForm" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="locationName" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="deptName" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="positionName" placeholder="검색.."></td>
							<td width="80px"><input class="searchText1" type="text" name="rspofcName" placeholder="검색.."></td>
							<td width="120px"><input class="searchText2" type="text" name="empOfficeTel" placeholder="검색.."></td>
							<td width="120px"><input class="searchText2" type="text" name="empPhone" placeholder="검색.."></td>
							<td width="120px"><input class="searchText2" type="text" name="enrollDate" placeholder="검색.."></td>
						</tr>
					</table>
				</form>
				<div id="listArea">
					<table id="listTable">
						<thead>
							<tr>
								<th width="80px"><span class="column1">사원번호</span></th>
								<th width="80px"><span class="column1">이름</span></th>
								<th width="80px"><span class="column1">직원유형</span></th>
								<th width="80px"><span class="column1">근무지역</span></th>
								<th width="80px"><span class="column1">근무부서</span></th>
								<th width="80px"><span class="column1">직급</span></th>
								<th width="80px"><span class="column1">직책</span></th>
								<th width="120px"><span class="column2">내선번호</span></th>
								<th width="120px"><span class="column2">휴대전화번호</span></th>
								<th width="120px"><span class="column2">입사일</span></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="emp" items="${ list }">
								<tr>
									<input type="hidden" value="${ emp.empNoSeq }">
									<td><c:out value="${ emp.empNo }" /></td>
									<td><c:out value="${ emp.empNameKor }" /></td>
									<td><c:out value="${ emp.empForm }" /></td>
									<td><c:out value="${ emp.locationName }" /></td>
									<td><c:out value="${ emp.deptName }" /></td>
									<td><c:out value="${ emp.positionName }" /></td>
									<td><c:out value="${ emp.rspofcName }" /></td>
									<td><c:out value="${ emp.empOfficeTel }" /></td>
									<td><c:out value="${ emp.empPhone }" /></td>
									<td><c:out value="${ emp.enrollDate }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>	<!-- listArea End -->
				<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						<span class="pageBtn textBtn">이전</span>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="empListBack" value="hrInfoManagementList.em">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<span class="pageBtn textBtn checkBtn" onclick="location.href='${ empListBack }'">이전</span>
					</c:if>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<span class="pageBtn numBtn checkBtn">${ p }</span>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="empListCheck" value="hrInfoManagementList.em">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<span class="pageBtn numBtn" onclick="location.href='${ empListCheck }'">${ p }</span>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<span class="pageBtn textBtn">다음</span>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="empListEnd" value="hrInfoManagementList.em">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<span class="pageBtn textBtn checkBtn" onclick="location.href='${ empListEnd }'">다음</span>
					</c:if>
				</div>
			</div>	<!-- tableArea End -->
		</div>  <!--   contentArea End -->
		</div>  <!--   mainContent End -->
	</div>
<script>
	var check = $("input[type='checkbox']");
	check.click(function(){
		$(".onoffSwitch").toggle();
	});
	
	$("#empInsertBtn").click(function() {
		location.href="insertEmployeePage.em";
	});
	
	$(document).on("click", "#listTable td", function() {
		var num = $(this).parent().children("input").val();
		console.log(num);
		location.href="selectEmployeeInfo.em?num=" + num;
	});
	
	$(document).on("keyup", "#searchTable", function(key) {
		if(key.keyCode == 13){
// 			$("#searchEmployeeForm").submit();
			var formInfo = $("form[name=searchEmployeeForm]").serialize();
			
			$.ajax({
				url: "searchEmployeeList.em",
				type: "post",
				data: formInfo,
				success: function(data) {
					console.log(data);
					$tableBody = $("#listTable tbody");
					$tableBody.html('');
					
					for(var key in data.hmap.list){
						$tr = $("<tr>");
						
						$inputTd = $("<input>").attr("type", "hidden").attr("id", "empNoSeq").attr("name", "empNoSeq").val(data.hmap.list[key].empNoSeq);
						$eNo = $("<td>").text(data.hmap.list[key].empNo);
						$eName = $("<td>").text(data.hmap.list[key].empNameKor);
						$eForm = $("<td>").text(data.hmap.list[key].empForm);
						$lName = $("<td>").text(data.hmap.list[key].locationName);
						$dName = $("<td>").text(data.hmap.list[key].deptName);
						$pName = $("<td>").text(data.hmap.list[key].positionName);
						$rName = $("<td>").text(data.hmap.list[key].rspofcName);
						$eOff = $("<td>").text(data.hmap.list[key].empOfficeTel);
						$ePho = $("<td>").text(data.hmap.list[key].empPhone);
						$eDate = $("<td>").text(data.hmap.list[key].enrollDate);
					
						$tr.append($inputTd);
						$tr.append($eNo);
						$tr.append($eName);
						$tr.append($eForm);
						$tr.append($lName);
						$tr.append($dName);
						$tr.append($pName);
						$tr.append($rName);
						$tr.append($eOff);
						$tr.append($ePho);
						$tr.append($eDate);
						
						$tableBody.append($tr);
					}
					
					var currentPage = data.hmap.pi.currentPage;
					var listCount = data.hmap.pi.listCount;
					var limit = data.hmap.pi.limit;
					var maxPage = data.hmap.pi.maxPage;
					var startPage = data.hmap.pi.startPage;
					var endPage = data.hmap.pi.endPage;
					var pre = currentPage - 1;
					var lat = currentPage + 1;;
					var path = "searchEmployeeList.em?num=";
					
					$pagingArea = $("#pagingArea");
					$pagingArea.html('');
					
					var str = "";
					
					if(currentPage <= 1){
						str += '<span class="pageBtn textBtn searchBtn">이전</span> ';
					} else {
						str += '<span class="pageBtn textBtn checkBtn searchBtn"><input type="hidden" value="' + pre + '">이전</span> ';
					}
					for(var p = startPage; p <= endPage; p++){
						if(p == currentPage){
							str += '<span class="pageBtn numBtn checkBtn searchBtn"><input type="hidden" value="' + p + '">' + p + '</span> ';
						} else {
							str += '<span class="pageBtn numBtn searchBtn"><input type="hidden" value="' + p + '">' + p + '</span> '
						}
					}
					if(currentPage >= maxPage){
						str += '<span class="pageBtn textBtn searchBtn">다음</span> ';
					} else {
						str += '<span class="pageBtn textBtn checkBtn searchBtn"><input type="hidden" value="' + lat + '">다음</span> ';
					}
					
					$pagingArea.append(str);
					
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#pagingArea .searchBtn", function() {
		var num = $(this).children("input").val();
		console.log("num : " + num);
		
		var formInfo = $("form[name=searchEmployeeForm]").serialize() + "&num=" + num;
		
		$.ajax({
			url: "searchEmployeeList.em",
			type: "post",
			data: formInfo,
			success: function(data) {
				console.log(data);
				$tableBody = $("#listTable tbody");
				$tableBody.html('');
				
				for(var key in data.hmap.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "empNoSeq").attr("name", "empNoSeq").val(data.hmap.list[key].empNoSeq);
					$eNo = $("<td>").text(data.hmap.list[key].empNo);
					$eName = $("<td>").text(data.hmap.list[key].empNameKor);
					$eForm = $("<td>").text(data.hmap.list[key].empForm);
					$lName = $("<td>").text(data.hmap.list[key].locationName);
					$dName = $("<td>").text(data.hmap.list[key].deptName);
					$pName = $("<td>").text(data.hmap.list[key].positionName);
					$rName = $("<td>").text(data.hmap.list[key].rspofcName);
					$eOff = $("<td>").text(data.hmap.list[key].empOfficeTel);
					$ePho = $("<td>").text(data.hmap.list[key].empPhone);
					$eDate = $("<td>").text(data.hmap.list[key].enrollDate);
				
					$tr.append($inputTd);
					$tr.append($eNo);
					$tr.append($eName);
					$tr.append($eForm);
					$tr.append($lName);
					$tr.append($dName);
					$tr.append($pName);
					$tr.append($rName);
					$tr.append($eOff);
					$tr.append($ePho);
					$tr.append($eDate);
					
					$tableBody.append($tr);
				}
				
				var currentPage = data.hmap.pi.currentPage;
				var listCount = data.hmap.pi.listCount;
				var limit = data.hmap.pi.limit;
				var maxPage = data.hmap.pi.maxPage;
				var startPage = data.hmap.pi.startPage;
				var endPage = data.hmap.pi.endPage;
				var pre = currentPage - 1;
				var lat = currentPage + 1;;
				var path = "searchEmployeeList.em?num=";
				
				$pagingArea = $("#pagingArea");
				$pagingArea.html('');
				
				var str = "";
				
				if(currentPage <= 1){
					str += '<span class="pageBtn textBtn searchBtn">이전</span> ';
				} else {
					str += '<span class="pageBtn textBtn checkBtn searchBtn"><input type="hidden" value="' + pre + '">이전</span> ';
				}
				for(var p = startPage; p <= endPage; p++){
					if(p == currentPage){
						str += '<span class="pageBtn numBtn checkBtn searchBtn"><input type="hidden" value="' + p + '">' + p + '</span> ';
					} else {
						str += '<span class="pageBtn numBtn searchBtn"><input type="hidden" value="' + p + '">' + p + '</span> '
					}
				}
				if(currentPage >= maxPage){
					str += '<span class="pageBtn textBtn searchBtn">다음</span> ';
				} else {
					str += '<span class="pageBtn textBtn checkBtn searchBtn"><input type="hidden" value="' + lat + '">다음</span> ';
				}
				
				$pagingArea.append(str);
				
			},
			error: function() {
				console.log("error");
			}
		});
		
	});
</script>
</body>
</html>