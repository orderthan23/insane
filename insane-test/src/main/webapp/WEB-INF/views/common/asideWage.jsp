<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.sideBtn:hover {
	color: white;
}
</style>
</head>
<body>
	<aside>
		<div id="profileZone">
			<c:if test="${empty companyInfo.companyLogoImgPath }">
				<img src="<%=request.getContextPath()%>/resources/images/INSANE.png"
					id="companyProfile">
			</c:if>
			<c:if test="${!empty companyInfo.companyLogoImgPath }">
				<img
					src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}"
					id="companyProfile">
			</c:if>
			<br>
			<br>
			<p style="font-size: 17px;">${companyInfo.companyName }</p>
			<p style="margin-top: 5px; font-size: 13px; font-weight: normal;">${companyInfo.businessBigType}</p>
		</div>
		<br> <br>
		<div id="sideMenu" align="center">
			<p style="font-size: 20px;">보상 관리</p>
			<br>
			<br> <a
				style="background: #524FE3; text-decoration: none; color: white;"
				href="selectEmpListForSalary.sal">급여 관리</a> <br> <a
				style="text-decoration: none; color: white;"
				href="selectSeveranceManagement.sal">퇴직금 관리</a> <br> <a
				style="text-decoration: none; color: white;"
				href="selectProvisionAndDeductionSetting.mp">지급공제사항</a> <br> <a
				style="text-decoration: none; color: white;"
				href="hrSalarySetting.mp">기본급여설정</a> <br>
		</div>
	</aside>

	<script>
		
	</script>
</body>
</html>