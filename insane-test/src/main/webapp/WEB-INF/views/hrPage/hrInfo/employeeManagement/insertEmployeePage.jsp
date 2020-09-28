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
		margin-top: 15px;
		margin-bottom: 15px;
		padding-left: 30px;
		padding-right: 30px;
		width: 100%;
	}
	#subTitle{
		color: white;
		background-color: #2E2C8F;
		width: 130px;
		height: 40px;
		padding: 15px 30px;
		text-align: center;
		font-size: 13px;
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
	#tableArea {
		padding-left: 30px;
		padding-right: 30px;
		height: 40%
	}
	#basicEmpInfo {
		width: 100%;
		height: 100%;
	}
	#basicEmpInfo input[type=text] {
		width: 100px;
		height: 20px;
		font-family: 'NanumSquare';
	}
	#basicEmpInfo input[type=date] {
		width: 130px;
	}
	#basicEmpInfo td {
		text-align: -webkit-center;
	}
	.column1 {
		display: table-cell;
		vertical-align: middle;
		width: 80px;
		height: 40px;
		font-size: 13px;
		text-align: center;
		background: #F3F3F3;
	}
	.column2 {
		display: table-cell;
		vertical-align: middle;
		width: 150px;
		height: 40px;
		font-size: 13px;
		text-align: left;
		border: 1px solid #F3F3F3;
		padding-left: 10px;
		
	}
	.tdType1 {
		width: 100px;
	}
	.tdType2 {
		width: 160px;
		text-align: left;
	}
	#empImgArea{
		display: table-cell;
		vertical-align: middle;
		width: 205px;
		height: 304px;
		background: #f3f3f3;
	}
	.box {
		display: inline-block;
		width: 20px;
		height: 20px;
		background: #2E2C8F;
		color: white;
		vertical-align: middle;
		margin-bottom: 3px;
		border-radius: 4px;
	}
	.box .lens {
		width: 20px;
		height: 20px;
	}
	.box .lens:hover {
		cursor: pointer;
	}
	#empImg {
		display: inline-block;
		width: 180px;
		height: 240px;
		background: #c4c4c4;
	}
	input:focus {
		outline: none;
	}
	#includeTableArea {
		padding-left: 33px;
		padding-right: 33px;
		margin-top: 15px;  
		margin-bottom: 15px;  
	}
	#includeTableNav {
		width: 100%;
		text-align: center;
	}
	#includeTableNav td {
		height: 40px;
		background: #F3F3F3;
		color: black;
		font-size: 13px;
	}
	#includeTableNav td:hover {
		cursor: pointer;
		background: #2E2C8F;
		color: white;
	}
	#includeTableNav #detailInfo {
		background: #2E2C8F;
		color: white;
	}
	#includeContentArea{
		height: 250px;
		margin-left: -3px;
		margin-right: -3px;
		padding-top: 10px;
		text-align: -webkit-center;
	}
	#profileImg {
		width: 100%;
		height: 100%;
	}
	#profileImg:hover {
		cursor: pointer;
	}
	#profileImgFile {
		display: none;
	}
	
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0); /* Black w/ opacity */
	}
	.modal-content {
		background-color: #fefefe;
		margin: 10% auto; /* 15% from the top and centered */
/* 		padding: 20px; */
		border: 2px solid #2E2C8F;
		border-radius: 10px;
		width: 400px; 
		height: 500px;
	}

	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
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
                <a style=" background:#524FE3;  text-decoration:none; color:white;" href="hrInfoManagementList.em">사원 목록 조회</a>
                <br>
                <a style=" text-decoration:none; color:white;" href="selectList.cr">증명서 발급 내역</a>
                <br>
            </div>
        </aside>
   		<div id="mainContent">
		<div id="contentArea">
		<!-- form autocomplete="off" <- 해주기  -->
		<form id="insertEmpInfoForm" action="insertEmpInfo.em" method="post" enctype="multipart/form-data">
			<div id="contentHeader">
				<div id="bluebox"></div>
				<label>사원등록</label>
			</div>	<!-- contentHeader End -->
			<div id="headerLine"></div>
				<table id="btnArea">
					<tr>
						<td><span id="subTitle">기초자료입력</span></td>
						<td style="text-align: right;" ><span id="empInsertBtn">+&nbsp;&nbsp;직원추가</span></td>
					</tr>
				</table>
				
			<div id="tableArea">
				<table id="basicEmpInfo">
					<tr>
						<td rowspan="5" colspan="2" style="padding-top: 10px; padding-bottom: 10px;">
							<span id="empImgArea">
								<span id="empImg">
									<!-- 사진들어갈공간 -->
									<img id="profileImg">
									<input type="file" id="profileImgFile" name="profileImgFile" onchange="loadImg(this)">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">*사원번호</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="empNoSeq" name="empNoSeq">
								<input type="text" id="empNo" name="empNo" readonly="readonly">&nbsp;
								<span class="box" id="empNoBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">*성명(한글)</span></td>
						<td class="tdType2"><span class="column2"><input type="text" name="empNameKor"></span></td>
						<td class="tdType1"><span class="column1">*입사일자</span></td>
						<td class="tdType2"><span class="column2"><input type="date" name="enrollDate"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">영문성명</span></td>
						<td class="tdType2"><span class="column2"><input type="text" name="empNameEng"></span></td>
						<td class="tdType1"><span class="column1">*주민등록번호</span></td>
						<td class="tdType2"><span class="column2"><input type="text" name="empResidentNo"></span></td>
						<td class="tdType1"><span class="column1">최종승진일</span></td>
						<td class="tdType2"><span class="column2"><input type="date"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">근무지역</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="locationSeq" name="empLocationCode">
								<input type="text" id="empLocationCode" readonly="readonly">&nbsp;
								<span class="box" id="locationBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">근무부서</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="deptCodeSeq" name="empDeptCode">
								<input type="text" id="empDeptCode" readonly="readonly">&nbsp;
								<span class="box" id="deptBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">최종발령일</span></td>
						<td class="tdType2"><span class="column2"><input type="date"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">직급</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="positionSeq" name="empPositionCode">
								<input type="text" id="empPositionCode" readonly="readonly">&nbsp;
								<span class="box" id="positionBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">직책</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="rspofcSeq" name="empRspofcCode">
								<input type="text" id="empRspofcCode" readonly="readonly">&nbsp;
								<span class="box" id="rspofcBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">퇴직일자</span></td>
						<td class="tdType2"><span class="column2"><input type="date" id="retireDate" name="retireDate"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">호봉</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="payStepSeq" name="payStepCode">
								<input type="text" id="payStepCode" readonly="readonly">&nbsp;
								<span class="box" id="payStepBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">주소</span></td>
						<td class="tdType2" colspan="3"><span class="column2" style="width: 415px;">
							<input type="text" id="empAddress" name="empAddress" style="width: 384px;"></span>
						</td>
					</tr>
				</table>
			</div>	<!-- tableArea End -->
			
			<div id="includeTableArea">
				<table id="includeTableNav">
					<tr>
						<td id="detailInfo" width="100px">상세정보</td>
						<td id="insInfo" width="100px">4대 보험</td>
						<td id="famInfo" width="100px">가족</td>
						<td id="acaInfo" width="100px">학력</td>
						<td id="miliInfo" width="100px">병역</td>
						<td id="healthInfo" width="100px">신체</td>
						<td id="careerInfo" width="100px">경력</td>
						<td id="liInfo" width="100px">자격/면허</td>
						<td id="appointInfo" width="100px">발령</td>
						<td id="rpInfo" width="100px">포상/징계</td>
						<td id="HRreviewInfo" width="100px">인사고과</td>
						<td id="eduInfo" width="100px">교육</td>
						<td id="payStepInfo" width="100px">정기승호</td>
					</tr>
				</table>	<!-- includeTableNav End -->
				
				<div id="includeContentArea">
					<jsp:include page="detailInfoPage.jsp" />
					<jsp:include page="insInfoPage.jsp" />
					<jsp:include page="familyInfoPage.jsp" />
					<jsp:include page="academyInfoPage.jsp" />
					<jsp:include page="militaryInfoPage.jsp" />
					<jsp:include page="healthInfoPage.jsp" />
					<jsp:include page="careerInfoPage.jsp" />
					<jsp:include page="licenseInfoPage.jsp" />
					<jsp:include page="appointmentInfoPage.jsp" />
					<jsp:include page="rewardPunishInfoPage.jsp" />
					<jsp:include page="hrReviewInfoPage.jsp" />
					<jsp:include page="educationInfoPage.jsp" />
					<jsp:include page="payStepInfo.jsp" />
				</div>	<!-- includeContentArea End -->
				
			</div>	<!-- includeTableArea End -->
		</form>	
		
		</div>  <!--   contentArea End -->
		</div>  <!--   mainContent End -->
	</div>

	<!-- modal -->
	<div id="modalPage" class="modal">
			<jsp:include page="modalPage/findEmpNoModal.jsp"/>
			<jsp:include page="modalPage/findLocationCodeModal.jsp"/>
			<jsp:include page="modalPage/findDeptCodeModal.jsp"/>
			<jsp:include page="modalPage/findPositionCodeModal.jsp"/>
			<jsp:include page="modalPage/findRspofcCodeModal.jsp"/>
			<jsp:include page="modalPage/findPayStepCodeModal.jsp"/>
	</div>	<!-- modal end -->


<script>

	$(function() {
		$("#infoDetailTable").show();
	});
	
	$("#detailInfo").click(function() {
		$("#includeTableNav td").not($("#includeTableNav #detailInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#includeTableNav #detailInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#infoDetailTable").show();
		$("#includeContentArea table").not($("#includeContentArea #infoDetailTable")).hide();
	});
	
	$("#insInfo").click(function() {
		$("#includeTableNav #insInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #insInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#insInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #insInfoTable")).hide();
	});
	
	$("#famInfo").click(function() {
		$("#includeTableNav #famInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #famInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#famInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #famInfoTable")).hide();
	});
	
	$("#acaInfo").click(function() {
		$("#includeTableNav #acaInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #acaInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#acaInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #acaInfoTable")).hide();
	});
	
	$("#miliInfo").click(function() {
		$("#includeTableNav #miliInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #miliInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#miliInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #miliInfoTable")).hide();
	});
	
	$("#healthInfo").click(function() {
		$("#includeTableNav #healthInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #healthInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#healthInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #healthInfoTable")).hide();
	});
	
	$("#careerInfo").click(function() {
		$("#includeTableNav #careerInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #careerInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#careerInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #careerInfoTable")).hide();
	});
	
	$("#liInfo").click(function() {
		$("#includeTableNav #liInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #liInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#licenseInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #licenseInfoTable")).hide();
	});
	
	$("#appointInfo").click(function() {
		$("#includeTableNav #appointInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #appointInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#appointmentInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #appointmentInfoTable")).hide();
	});
	
	$("#rpInfo").click(function() {
		$("#includeTableNav #rpInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #rpInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#rpInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #rpInfoTable")).hide();
	});
	
	$("#HRreviewInfo").click(function() {
		$("#includeTableNav #HRreviewInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #HRreviewInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#hrReviewInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #hrReviewInfoTable")).hide();
	});
	
	$("#eduInfo").click(function() {
		$("#includeTableNav #eduInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #eduInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#educationInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #educationInfoTable")).hide();
	});
	
	$("#payStepInfo").click(function() {
		$("#includeTableNav #payStepInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #payStepInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#payStepInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #payStepInfoTable")).hide();
	});
	
	$("#profileImg").click(function() {
		$("#profileImgFile").click();
	});
	
	function loadImg(value) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$("#profileImg").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(value.files[0]);
		} 
	}
	
	$("#empInsertBtn").click(function() {
		$("#insertEmpInfoForm").submit();
	});
	
	var modal = document.getElementById("modalPage");
	
	$("#empNoBox").click(function() {
		$.ajax({
			url: "findEmpNo.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findEmpNoModal")).hide();
				$("#findEmpNoModal").show();
				
				
				$tableBody = $("#findEmpNoModalTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "empNoSeq").attr("type", "hidden").attr("value", data.list[key].empNoSeq);
					$comTd = $("<td>").text(data.list[key].companyNo);
					$empTd = $("<td>").text(data.list[key].empNo);
					$statTd = $("<td>").text(data.list[key].empStatus);
					
					$tr.append($hiddenTd);
					$tr.append($comTd);
					$tr.append($empTd);
					$tr.append($statTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
	$("#locationBox").click(function() {
		$.ajax({
			url: "findLocationCode.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findLocationCodeModal")).hide();
				$("#findLocationCodeModal").show();
				
				
				$tableBody = $("#findLocationCodeModalTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "locationSeq").attr("type", "hidden").attr("value", data.list[key].locationSeq);
					$loNameTd = $("<td>").text(data.list[key].locationName);
					
					$tr.append($hiddenTd);
					$tr.append($loNameTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
	$("#deptBox").click(function() {
		$.ajax({
			url: "findDeptCode.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findDeptCodeModal")).hide();
				$("#findDeptCodeModal").show();
				
				
				$tableBody = $("#findDeptCodeModalTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "deptSeq").attr("type", "hidden").attr("value", data.list[key].deptCodeSeq);
					$deptNameTd = $("<td>").text(data.list[key].deptName);
					
					$tr.append($hiddenTd);
					$tr.append($deptNameTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
	$("#positionBox").click(function() {
		$.ajax({
			url: "findPositionCode.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findPosiCodeModal")).hide();
				$("#findPosiCodeModal").show();
				
				
				$tableBody = $("#findPosiCodeModalTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "posiSeq").attr("type", "hidden").attr("value", data.list[key].positionSeq);
					$posiNameTd = $("<td>").text(data.list[key].positionName);
					
					$tr.append($hiddenTd);
					$tr.append($posiNameTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
	$("#rspofcBox").click(function() {
		$.ajax({
			url: "findRspofcCode.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findRspofcCodeModal")).hide();
				$("#findRspofcCodeModal").show();
				
				$tableBody = $("#findRspofcCodeModalTable tbody");
				$tableBody.html('');
				
				$tr = $("<tr>");
				$hiddenTd = $("<input>").attr("id", "rspofcSeq").attr("type", "hidden").attr("value", "");
				$rspofcNameTd = $("<td>").text("없음");
				
				$tr.append($hiddenTd);
				$tr.append($rspofcNameTd);
				
				$tableBody.append($tr);
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "rspofcSeq").attr("type", "hidden").attr("value", data.list[key].rspofcSeq);
					$rspofcNameTd = $("<td>").text(data.list[key].rspofcName);
					
					$tr.append($hiddenTd);
					$tr.append($rspofcNameTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
	$("#payStepBox").click(function() {
		$.ajax({
			url: "findPayStepCode.em",
			type: "post",
			success: function(data) {
				console.log(data);
				
				modal.style.display = "block";
				$("#modalPage .modal-content").not($("#modalPage #findPayStepCodeModal")).hide();
				$("#findPayStepCodeModal").show();
				
				$tableBody = $("#findPayStepCodeModalTable tbody");
				$tableBody.html('');
				
				for(var key in data.list) {
					$tr = $("<tr>");
					$hiddenTd = $("<input>").attr("id", "payStepSeq").attr("type", "hidden").attr("value", data.list[key].payStepSeq);
					$payStepTd = $("<td>").text(data.list[key].payStep + "호봉");
					
					$tr.append($hiddenTd);
					$tr.append($payStepTd);
					
					$tableBody.append($tr);
					
				}
				
			},
			error: function() {
				console.log("에러!");
			}
		});
	});
	
</script>
</body>
</html>