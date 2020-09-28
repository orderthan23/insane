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
	#empUpdateCompleteBtn{
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
	#empUpdateCompleteBtn:hover{
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
		overflow: auto;
	}
	#includeContentArea::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#includeContentArea::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
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
		border: 2px solid #2E2C8F;
		border-radius: 10px;
		width: 400px; 
		height: 500px;
	}
	.modal-content2 {
		background-color: #fefefe;
		margin: 10% auto; /* 15% from the top and centered */
		border: 2px solid #2E2C8F;
		border-radius: 10px;
		width: 1000px; 
		height: 500px;
	}
	.close:hover, .close:focus, .close2:hover, .close2:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	.joinBtn:hover {
		cursor: pointer;
		color: red;
		font-weight: bolder;
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
		<form id="updateEmpInfoForm" action="updateEmpInfo.em" method="post" enctype="multipart/form-data">
			<div id="contentHeader">
				<div id="bluebox"></div>
				<label>사원 정보 수정</label>
			</div>	<!-- contentHeader End -->
			<div id="headerLine"></div>
				<table id="btnArea">
					<tr>
						<td><span id="subTitle">기초 자료 수정</span></td>
						<td style="text-align: right;" ><span id="empUpdateCompleteBtn">+&nbsp;&nbsp;수정하기</span></td>
					</tr>
				</table>
				
			<div id="tableArea">
				<table id="basicEmpInfo">
					<tr>
						<td rowspan="5" colspan="2" style="padding-top: 10px; padding-bottom: 10px;">
							<span id="empImgArea">
								<span id="empImg">
									<!-- 사진들어갈공간 -->
									<c:if test="${ hmap.profile eq null }">
										<img id="profileImg">
									</c:if>
									<c:if test="${ hmap.profile ne null }">
										<img id="profileImg" src="/insane${ hmap.profile.filePath }${ hmap.profile.changeName }">
									</c:if>
									<input type="file" id="profileImgFile" name="profileImgFile" onchange="loadImg(this)">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">*사원번호</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="empNoSeq" name="empNoSeq" value="${ hmap.emp.empNoSeq }">
								<input type="text" id="empNo" name="empNo" readonly="readonly" value="${ hmap.emp.empNo }">&nbsp;
							</span>
						</td>
						<td class="tdType1"><span class="column1">*성명(한글)</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="text" name="empNameKor" value="${ hmap.emp.empNameKor }">
							</span>
						</td>
						<td class="tdType1"><span class="column1">*입사일자</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="date" id="enrollDate" name="enrollDate" readonly="readonly" value="${ hmap.emp.enrollDate }">
							</span>
						</td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">영문성명</span></td>
						<td class="tdType2"><span class="column2"><input type="text" name="empNameEng" value="${ hmap.emp.empNameEng }"></span></td>
						<td class="tdType1"><span class="column1">*주민등록번호</span></td>
						<td class="tdType2"><span class="column2"><input type="text" name="empResidentNo" readonly="readonly" value="${ hmap.emp.empResidentNo }"></span></td>
						<td class="tdType1"><span class="column1">최종승진일</span></td>
						<td class="tdType2"><span class="column2"><input type="date" readonly="readonly" value="${ hmap.app.gvofodDate }"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">근무지역</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="locationSeq" name="empLocationCode" value="${ hmap.emp.empLocationCode }">
								<input type="text" id="empLocationCode" readonly="readonly" value="${ hmap.emp.locationName }">&nbsp;
								<span class="box" id="locationBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">근무부서</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="deptCodeSeq" name="empDeptCode" value="${ hmap.emp.empDeptCode }">
								<input type="text" id="empDeptCode" readonly="readonly" value="${ hmap.emp.deptName }">&nbsp;
								<span class="box" id="deptBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">최종발령일</span></td>
						<td class="tdType2"><span class="column2"><input type="date" readonly="readonly" value="${ hmap.app.gvofodDate }"></span></td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">직급</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="positionSeq" name="empPositionCode" value="${ hmap.emp.empPositionCode }">
								<input type="text" id="empPositionCode" readonly="readonly" value="${ hmap.emp.positionName }">&nbsp;
								<span class="box" id="positionBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">직책</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="rspofcSeq" name="empRspofcCode" value="${ hmap.emp.empRspofcCode }">
								<input type="text" id="empRspofcCode" readonly="readonly" value="${ hmap.emp.rspofcName }">&nbsp;
								<span class="box" id="rspofcBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">퇴직일자</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="date" id="retireDate" name="retireDate" readonly="readonly" value="${ hmap.emp.retireDate }">
							</span>
						</td>
					</tr>
					<tr>
						<td class="tdType1"><span class="column1">호봉</span></td>
						<td class="tdType2">
							<span class="column2">
								<input type="hidden" id="payStepSeq" name="payStepCode" value="${ hmap.emp.payStepCode }">
								<input type="text" id="payStepCode" readonly="readonly" readonly="readonly" value="${ hmap.emp.payStep }호봉">&nbsp;
								<span class="box" id="payStepBox">
									<img class="lens" src="<%=request.getContextPath()%>/resources/images/lensBtn.png">
								</span>
							</span>
						</td>
						<td class="tdType1"><span class="column1">주소</span></td>
						<td class="tdType2" colspan="3">
							<span class="column2" style="width: 415px;">
								<input type="text" id="empAddress" name="empAddress" style="width: 384px;" value="${ hmap.emp.empAddress }">
							</span>
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
	
	<div id="modalPage2" class="modal">
			<jsp:include page="modalPage/familyManagementPage.jsp"/>
			<jsp:include page="modalPage/academyManagementPage.jsp"/>
			<jsp:include page="modalPage/healthManagementPage.jsp"/>
			<jsp:include page="modalPage/careerManagementPage.jsp"/>
			<jsp:include page="modalPage/licenseManagementPage.jsp"/>
			<jsp:include page="modalPage/appointmentManagementPage.jsp"/>
			<jsp:include page="modalPage/rewardPunishManagementPage.jsp"/>
			<jsp:include page="modalPage/hrReviewManagementPage.jsp"/>
			<jsp:include page="modalPage/payStepManagementPage.jsp"/>
	</div>

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
		
		$.ajax({
			url: "selectInsInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				if(data != null){
					$("#hltIns").children("td").eq(1).html(data.fourIns.enrollDate);
					$("#accIns").children("td").eq(1).html(data.fourIns.enrollDate);
					$("#empIns").children("td").eq(1).html(data.fourIns.enrollDate);
					$("#ntnIns").children("td").eq(1).html(data.fourIns.enrollDate);
	
					$("#hltIns").children("td").eq(2).html(data.fourIns.hltLimitDate);
					$("#accIns").children("td").eq(2).html(data.fourIns.etcLimitDate);
					$("#empIns").children("td").eq(2).html(data.fourIns.etcLimitDate);
					$("#ntnIns").children("td").eq(2).html(data.fourIns.etcLimitDate);
					
					$("#hltIns").children("td").eq(3).html(data.fourIns.hltEnrollDate);
					$("#accIns").children("td").eq(3).html(data.fourIns.accEnrollDate);
					$("#empIns").children("td").eq(3).html(data.fourIns.empEnrollDate);
					$("#ntnIns").children("td").eq(3).html(data.fourIns.ntnEnrollDate);
				}

			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#famInfo").click(function() {
		$("#includeTableNav #famInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #famInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#famInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #famInfoTable")).hide();
		
		$.ajax({
			url: "selectFamInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#famInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$relation = $("<td>").text(data.list[key].relation);
					$famName = $("<td>").text(data.list[key].famName);
					$resiNo = $("<td>").text(data.list[key].residentNo);
					var basic;
					switch(data.list[key].basicDeductionYN){
						case "0" : basic = "해당없음"; break;
						case "1" : basic = "본인"; break;
						case "2" : basic = "배우자"; break;
						case "3" : basic = "직계존속"; break;
						case "4" : basic = "직계비속, 입양자"; break;
						case "5" : basic = "형제, 자매"; break;
						case "6" : basic = "기타 부양가족"; break;
					}
					$basic = $("<td>").text(basic);
					$hshldr = $("<td>").text(data.list[key].hshldrYN);
					$womenHsh = $("<td>").text(data.list[key].womenHshldrYN);
					$one = $("<td>").text(data.list[key].onePrntYN);
					$dis = $("<td>").text(data.list[key].disorderYN);
					$older = $("<td>").text(data.list[key].olderYN);
					$ageSix = $("<td>").text(data.list[key].ageSixYN);
					$child = $("<td>").text(data.list[key].childAdoptYN);
					
					$tr.append($relation);
					$tr.append($famName);
					$tr.append($resiNo);
					$tr.append($basic);
					$tr.append($hshldr);
					$tr.append($womenHsh);
					$tr.append($one);
					$tr.append($dis);
					$tr.append($older);
					$tr.append($ageSix);
					$tr.append($child);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#acaInfo").click(function() {
		$("#includeTableNav #acaInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #acaInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#acaInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #acaInfoTable")).hide();
		
		$.ajax({
			url: "selectAcaInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#acaInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$insti = $("<td>").text(data.list[key].institutionName);
					$major = $("<td>").text(data.list[key].major);
					$sMajor = $("<td>").text(data.list[key].subMajor);
					$eDate = $("<td>").text(data.list[key].entscDate);
					$gDate = $("<td>").text(data.list[key].graduDate);
					$gYN = $("<td>").text(data.list[key].graduYN);
					$degree = $("<td>").text(data.list[key].degree);
				
					
					$tr.append($insti);
					$tr.append($major);
					$tr.append($sMajor);
					$tr.append($eDate);
					$tr.append($gDate);
					$tr.append($gYN);
					$tr.append($degree);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#miliInfo").click(function() {
		$("#includeTableNav #miliInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #miliInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#miliInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #miliInfoTable")).hide();
		
		$.ajax({
			url: "selectMiliInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				if(data.military != null){
					$("#endsType").attr("readonly", "readonly").val(data.military.endsType);
					$("#milPosition").attr("readonly", "readonly").val(data.military.milPosition);
					$("#milSpecies").attr("readonly", "readonly").val(data.military.milSpecies);
					$("#lastClass").attr("readonly", "readonly").val(data.military.lastClass);
					$("#servStartDate").attr("readonly", "readonly").val(data.military.servStartDate);
					$("#servEndDate").attr("readonly", "readonly").val(data.military.servEndDate);
					$("#exmpReason").attr("readonly", "readonly").val(data.military.exmpReason);					
				} 
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#healthInfo").click(function() {
		$("#includeTableNav #healthInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #healthInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#healthInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #healthInfoTable")).hide();
		
		$.ajax({
			url: "selectHealthInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#healthInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$date = $("<td>").text(data.list[key].healthCheckDate);
					$insti = $("<td>").text(data.list[key].institutionName);
					$height = $("<td>").text(data.list[key].height);
					$weight = $("<td>").text(data.list[key].weight);
					$bType = $("<td>").text(data.list[key].bloodType);
					$sight = $("<td>").text(data.list[key].leftSight + "/" + data.list[key].rightSight);
					$hear = $("<td>").text(data.list[key].leftHear + "/" + data.list[key].rightHear);
					$presure = $("<td>").text(data.list[key].bloodPresureType);
					$color = $("<td>").text(data.list[key].colorBlindYN);
					$recheck = $("<td>").text(data.list[key].recheckYN);
					$disorder = $("<td>").text(data.list[key].disorderStep);
				
					
					$tr.append($date);
					$tr.append($insti);
					$tr.append($height);
					$tr.append($weight);
					$tr.append($bType);
					$tr.append($sight);
					$tr.append($hear);
					$tr.append($presure);
					$tr.append($color);
					$tr.append($recheck);
					$tr.append($disorder);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#careerInfo").click(function() {
		$("#includeTableNav #careerInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #careerInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#careerInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #careerInfoTable")).hide();
		
		$.ajax({
			url: "selectCareerInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#careerInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$companyName = $("<td>").text(data.list[key].lastCompanyName);
					$eDate = $("<td>").text(data.list[key].enrollDate);
					$rDate = $("<td>").text(data.list[key].retireDate);
					$recog = $("<td>").text(data.list[key].recogMonths);
					$job = $("<td>").text(data.list[key].job);
					$posi = $("<td>").text(data.list[key].lastPosition);
					$retire = $("<td>").text(data.list[key].retireReason);
					
					$tr.append($companyName);
					$tr.append($eDate);
					$tr.append($rDate);
					$tr.append($recog);
					$tr.append($job);
					$tr.append($posi);
					$tr.append($retire);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#liInfo").click(function() {
		$("#includeTableNav #liInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #liInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#licenseInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #licenseInfoTable")).hide();
		
		$.ajax({
			url: "selectLicenseInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#licenseInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$lDate = $("<td>").text(data.list[key].licenseAcqDate);
					$lName = $("<td>").text(data.list[key].licenseName);
					$lNo = $("<td>").text(data.list[key].licenseNo);
					$lIssue = $("<td>").text(data.list[key].licenseIssued);
					
					$tr.append($lDate);
					$tr.append($lName);
					$tr.append($lNo);
					$tr.append($lIssue);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#appointInfo").click(function() {
		$("#includeTableNav #appointInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #appointInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#appointmentInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #appointmentInfoTable")).hide();
		
		$.ajax({
			url: "selectAppointInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#appointmentInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$aDate = $("<td>").text(data.list[key].gvofodDate);
					$aName = $("<td>").text(data.list[key].codeName);
					$lName = $("<td>").text(data.list[key].locationName);
					$dName = $("<td>").text(data.list[key].deptName);
					$rName = $("<td>").text(data.list[key].repofcName);
					$pName = $("<td>").text(data.list[key].positionName);
					$remark = $("<td>").attr("class", "remarkTd").text(data.list[key].remark);
					
					$tr.append($aDate);
					$tr.append($aName);
					$tr.append($lName);
					$tr.append($dName);
					$tr.append($rName);
					$tr.append($pName);
					$tr.append($remark);
					
					$tableBody.append($tr);
				}
				$("#appointmentInfoTable tbody .remarkTd").attr("style", "text-align: left;")
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#rpInfo").click(function() {
		$("#includeTableNav #rpInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #rpInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#rpInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #rpInfoTable")).hide();
		
		$.ajax({
			url: "selectRPInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#rpInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$rpType = $("<td>").text(data.list[key].rwrdPnshType);
					$rpDate = $("<td>").text(data.list[key].pnshStartDate);
					$endDate = $("<td>").text(data.list[key].pnsgEndDate);
					$rpReason = $("<td>").text(data.list[key].rpReason);
					$rpContent = $("<td>").text(data.list[key].rpContent);
					
					$tr.append($rpType);
					$tr.append($rpDate);
					$tr.append($endDate);
					$tr.append($rpReason);
					$tr.append($rpContent);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#HRreviewInfo").click(function() {
		$("#includeTableNav #HRreviewInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #HRreviewInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#hrReviewInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #hrReviewInfoTable")).hide();
		
		$.ajax({
			url: "selectHRreviewInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#hrReviewInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$type = $("<td>").text(data.list[key].exmType);
					$grade = $("<td>").text(data.list[key].exmResult);
					$opnion = $("<td>").text(data.list[key].exmOpnion);
					
					$tr.append($type);
					$tr.append($grade);
					$tr.append($opnion);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#eduInfo").click(function() {
		$("#includeTableNav #eduInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #eduInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#educationInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #educationInfoTable")).hide();
		
		$.ajax({
			url: "selectEducationInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#educationInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$sDate = $("<td>").text(data.list[key].eduStartDate);
					$eDate = $("<td>").text(data.list[key].eduEndDate);
					$eTitle = $("<td>").text(data.list[key].eduTitle);
					if(data.list[key].remark != null) {
						$eRemark = $("<td>").text(data.list[key].remark);
					} else {
						$eRemark = $("<td>").text("-");
					}
					
					$tr.append($sDate);
					$tr.append($eDate);
					$tr.append($eTitle);
					$tr.append($eRemark);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$("#payStepInfo").click(function() {
		$("#includeTableNav #payStepInfo").css({"background-color":"#2E2C8F", "color":"white"});
		$("#includeTableNav td").not($("#includeTableNav #payStepInfo")).css({"background-color":"#F3F3F3", "color":"black"});
		$("#payStepInfoTable").show();
		$("#includeContentArea table").not($("#includeContentArea #payStepInfoTable")).hide();
		
		$.ajax({
			url: "selectPayStepInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#payStepInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$pName = $("<td>").text(data.list[key].positionName);
					$payStep = $("<td>").text(data.list[key].payStep + "호봉");
					$reason = $("<td>").text(data.list[key].reason);
					
					$tr.append($pName);
					$tr.append($payStep);
					$tr.append($reason);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
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
	
	$("#empUpdateCompleteBtn").click(function() {
		$("#updateEmpInfoForm").submit();
	});
	
	var modal = document.getElementById("modalPage");
	var modal2 = document.getElementById("modalPage2");
	
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