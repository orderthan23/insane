<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.insane.employee.model.vo.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
	
<style>
	#section{
		display:inline-block;
		overflow:auto;
		width:1000px;
		height:780px;
		background:white;
		position:absolute;
		top:150px;
		left:300px;		
		border-radius:20px;
		font-weight: normal;
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
	
	.paperArea {
		/* border:2px solid black; */
		dispaly:inline-block;
		width:500px;
		height:482px;
		position:absolute;
		left: 250px;
		bottom:135px;
	}
	
	.titleArea{
		/* border:2px solid black; */
		border-bottom:2px solid black;
		dispaly:inline-block;
		width:500px;
		height:50px;
		position:absolute;
		left: 250px;
	}
	
	#paperTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#paperTable{
		border-collapse:collapse;
		/* border-spacing:0 80px; */
		width: 100%;
		line-height:2;
	}
	
	#paperTable td{
		border-bottom: 1px solid lightgray;
		height: 40px;
	}
	
	button{
		color:white;
		width:150px;
		height:40px;
		background-color:#2E2C8F;
		border-radius:5px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
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
				<p style="font-size:20px;">서류 발급</p>
				<br><br>
				
				<a style=" text-decoration:none; color:white;" href="selectListEmp.cr">나의 요청</a>
				<br>
				<a style=" background:#524FE3; text-decoration:none; color:white;" href="requestPage.cr?type=경력">경력 증명서</a>
				<br>
				<a style=" text-decoration:none; color:white;" href="requestPage.cr?type=재직">재직 증명서</a>
				<br>
			
			</div>
		</aside>
	
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle" style="font-weight: bolder;">경력증명서</span><br><br>
		<hr>
		<br><br>
		<div class="titleArea" align="center">			
			<h3>경력증명서</h3>			
		</div>
		
		<form action="insertCareer.cr" method="post">
			<input type="hidden" name="pageType" value="경력">
			<input type="hidden" name="userNo" value="${sessionScope.loginUser.empNoSeq}">
			<input type="hidden" name="companyNo" value="${sessionScope.loginUser.companyNo}">
			<div class="paperArea" align="center">
			<table id="paperTable">		
			<tr>
				<td>신청매수</td>
				<td><input type="text" name="requestCount" style="width:30px;"></td>
			</tr>
			<tr>
				<td>성명</td>
				<td colspan="4"><input type="text" value="${ sessionScope.loginUser.empNameKor }" readonly></td>
			</tr>
			<tr>
				<!-- JSTL에서인지 EL&STL에서인지 문자열 나누는게 있었음. -->
				<td><span>주민번호</span></td>
				<td colspan="3"><input type="text" value="${ fn:substring(sessionScope.loginUser.empResidentNo, 0, 6) }" readonly> - <input type="text" value="${ fn:substring(sessionScope.loginUser.empResidentNo, 7, 14) }" readonly></td>
			</tr>
			<tr>
				<td><span>연락처</span></td>
				<td colspan="3"><input type="text" value="${ sessionScope.loginUser.empPhone }" readonly></td>
			</tr>
			<tr>
				<input type="hidden" name="deptCode" value="${ sessionScope.loginUser.empDeptCode }">
				<td><span>업무부서</span></td>
				<td><input type="text" value="${ requestScope.crtfc.empDeptName }" readonly></td>
				<input type="hidden" name="positionCode" value="${ sessionScope.loginUser.empPositionCode }">
				<td>직급</td>
				<td><input type="text" value="${ requestScope.crtfc.positionName }" readonly></td>
			</tr>
			<tr>				
				<td><span>주소</span></td>
				<td colspan="3"><input type="text" value="${ sessionScope.loginUser.empAddress }" readonly></td>
			</tr>
			<tr>
				<td><span>재직기간</span></td>
				<td colspan="3"><input type="text" value="${ fn:substring(sessionScope.loginUser.enrollDate, 0, 10) }" readonly>&nbsp;~&nbsp;<input type="text" value="${ fn:substring(sessionScope.loginUser.retireDate, 0, 10) }" readonly></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td colspan="3"><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>소재지</span></td>
				<td colspan="3"><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>대표이사</span></td>
				<td><input type="text" readonly></td>
				<td><span>연락처</span></td>
				<td><input type="text" readonly></td>
			</tr>
		</table>			
		<br><br>
		<button class="btnRequest">발급요청</button>	
		<button class="btnCancle">취소</button>
		</div>
		</form>
	</div>
</body>
</html>