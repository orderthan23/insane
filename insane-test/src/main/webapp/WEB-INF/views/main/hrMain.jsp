<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<style>
section {
	width: 100%;
	height: 100%;
}

#sideMenu {
	width: 100%;
	text-align: center;
}

#sideMenu p {
	font-size: 20px;
	font-weight: bolder;
	margin-bottom: 10px;
}

.iconBox {
	width: 51px;
	height: 47px;
	background: #2A36A4;
	border-radius: 10px;
	text-align: center;
}

.titleHeaders {
	width: 164px;
	height: 47px;
	background: #c4c4c4;
	border-radius: 10px;
	display: table;
}

section {
	width: 100%;
	height: 100%;
}

article {
	width: 90%;
	height: 90%;
	margin-left: auto;
	margin-right: auto;
}

#mainTitle {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

.subTitleMenues tr {
	height: 30px;
	vertical-align: middle;
}

.subTitleMenues {
	width: 164px;
	background: rgba(196, 196, 196, 0.2);
	border-radius: 10px;
	background: rgba(196, 196, 196, 0.2);
}
a{
	text-decoration: none;
 	color: black;
 	font-weight: normal;
 	font-family: 'nanumSquare';
 	font-size: 17px;
}

article a:hover{
 color: #2A36A4;
 font-weight: bolder;
}
</style>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<title>Home</title>
</head>
<body>
	<c:if test="${!fn:contains(auth,'MP1') }">
			<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
	</c:if>
	<c:if test="${fn:contains(auth,'MP1') }">
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp" />
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp" />
	
	
	<div id="contentWrapper">
		<aside style="">
			<div id="profileZone">
				<c:if test="${empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
        	</c:if>
        	<c:if test="${!empty companyInfo.companyLogoImgPath }">
        	<img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
        	</c:if>
            <br><br>
            <p style="font-size: 17px;">${companyInfo.companyName }</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">${companyInfo.businessBigType}</p>
        </div>
			<br> <br>
			<div id="sideMenu">
				<p style="font-size: 25px;">INSANE</p>
				<p style="font-size: 15px; font-weight:normal;">인사업무</p>
				<p style="font-size: 15px; font-weight:normal;">통합 시스템</p>
			</div>
		</aside>
		<section>
			<article>
				<br> <br>
				<div id="mainTitle">
					<div style="display: table; width: 30%;">
						<img
							src="<%=request.getContextPath()%>/resources/images/INSANE.png"
							width="30px" height="30px"
							style="display: table-cell; vertical-align: middle;">
						<p
							style="display: table-cell; vertical-align: middle; font-size: 30px; color: #2E2C8F;">
							QUICK <label style="color: black;">MENU</label>
						</p>
					</div>
				</div>

				<br> <br>
				<table style="width: 90%; margin-left: auto; margin-right: auto;">
					<tr>
						<td>
							<div class="titleHeaders">

								<div class="iconBox" style="display: table-cell;">
									<span class="iconify" data-inline="false"
										data-icon="carbon:category-new-each"
										style="color: #ffffff; font-size: 40px; line-height: 47px;"></span>


								</div>
								&nbsp;&nbsp;
								<p
									style="display: table-cell; vertical-align: middle; font-size: 25px; font-weight:bolder;">채용관리</p>

							</div>

							<table class="subTitleMenues">
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>인원증감
											동의 내역</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>채용공고
											결재내역</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>지원자
											서류 내역</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>채용승인
											결재내역</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>채용기준
											관리</a></td>
								</tr>
							</table>
						</td>

						<td>
							<div class="titleHeaders">

								<div class="iconBox" style="display: table-cell;">
									<span class="iconify" data-inline="false"
										data-icon="clarity:alarm-clock-outline-alerted"
										style="color: #ffffff; font-size: 40.168067932128906px; line-height: 47px;"></span>

								</div>
								&nbsp;&nbsp;
								<p
									style="display: table-cell; vertical-align: middle; font-size: 25px; line-height: 47px; font-weight:bolder;">근태관리</p>

							</div>

							<table class="subTitleMenues">
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectVacationRequestList.att">휴가관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectAttendanceHistoryManage.att">출결관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>출장
											파견관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a>연장근무관리</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</td>

						<td>
							<div class="titleHeaders">

								<div class="iconBox" style="display: table-cell;">
									<span class="iconify" data-inline="false"
										data-icon="carbon:education"
										style="color: #ffffff; font-size: 41.03004455566406px; line-height: 47px; "></span>


								</div>
								&nbsp;&nbsp;
								<p
									style="display: table-cell; vertical-align: middle; font-size: 25px; font-weight:bolder;">교육관리</p>

							</div>

							<table class="subTitleMenues">
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="Edulist.edu">교육일정관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="moveEduAssessment.edu">교육이수관리</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>

				</table>
				<br> <br> <br>

				<table style="width: 90%; margin-left: auto; margin-right: auto;">
					<tr>
						<td>
							<div class="titleHeaders">

								<div class="iconBox" style="display: table-cell;">
									<span class="iconify" data-inline="false"
										data-icon="mdi:human-capacity-increase"
										style="color: #ffffff; font-size: 40px; line-height: 47px;"></span>

								</div>
								&nbsp;&nbsp;
								<p
									style="display: table-cell; vertical-align: middle; font-size: 25px; font-weight:bolder;">인사관리</p>

							</div>

							<table class="subTitleMenues">
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="organizationChart.or">조직도관리</a></td>
								</tr>
								
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="hrInfoManagementList.em">사원 목록 조회</a></td>
								</tr>
							
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectList.cr">증명서 발급 내역</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</td>

						<td>
							<div class="titleHeaders">

								<div class="iconBox" style="display: table-cell;">
									<span class="iconify" data-inline="false"
										data-icon="mdi:currency-usd-circle-outline"
										style="color: #ffffff; font-size: 40px; line-height: 47px;"></span>


								</div>
								&nbsp;&nbsp;
								<p
									style="display: table-cell; vertical-align: middle; font-size: 25px; font-weight:bolder;">보상관리</p>

							</div>

							<table class="subTitleMenues">
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectEmpListForSalary.sal">급여관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectSeveranceManagement.sal">퇴직금 관리</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="selectProvisionAndDeductionSetting.mp">지급공제사항</a></td>
								</tr>
								<tr>
									<td><label style="color: #2E2C8F;">●</label>&nbsp; <a href="hrSalarySetting.mp">기본급여설정</a></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
						<td style="visibility: none; display:hidden;" >
							<table style="visibility: none; display:hidden; opacity:0;">
								<tr style="visibility:none; display:hidden; opacity:0;">
									<td class="titleHeaders" style="visibility: none; display:hidden; opacity:0;"></td>
								</tr>
								<tr>
									<td class="subTitleMenues" style="visibility: none; display:hidden;"></td>
								</tr>

							</table>
						</td>
					</tr>

				</table>


			</article>

			
		</section>
	</div>
	</c:if>


</body>
</html>
