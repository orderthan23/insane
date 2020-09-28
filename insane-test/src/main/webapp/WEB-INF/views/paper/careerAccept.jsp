<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width:100%;
		line-height:2;
	}
	
	#paperTable td{
		border-bottom: 1px solid lightgray;
		height:40px;
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
				<p style="font-size:20px;">인사정보 관리</p>
				<br><br>
				
				<a style=" text-decoration:none; color:white;" href="organizationChart.or">조직도 관리</a>
				<br>
				<a style="  text-decoration:none; color:white;" href="hrInfoManagementList.em">사원 목록 조회</a>
				<br>
				<a style="background:#524FE3; text-decoration:none; color:white;" href="selectList.cr">증명서 발급 내역</a>
				<br>
				<a style=" text-decoration:none; color:white;" href="requestPage.cr?type=퇴직">퇴직 증명서</a>
				<br>			
			
			</div>
		</aside>
	<c:if test="${!fn:contains(auth,'CT1') }">
			<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
	</c:if>
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle" style="font-weight: bolder;">경력증명서</span><br><br>
		<hr>
		<br><br>
		<div class="titleArea" align="center">
			<h3>경력증명서</h3>
		</div>
		<div class="paperArea" align="center">
			<form id="paperForm" method="post">
			<input type="hidden" name="pageType" value="경력">
				<table id="paperTable">		
			<input type="hidden" name="crtfcSeq" value="${ requestScope.crtfc.crtfcSeq }">
			<tr>
				<!-- <td>문서번호</td>
				<td><input type="text"></td> -->
				<td>매수</td>
				<td><input type="text" style="width:30px;" readonly></td>
			</tr>
			<tr>
				<td>성명</td>
				<!-- <td colspan="4"><input type="text" readonly></td> -->
				<td colspan="4"><input type="text" value="${ requestScope.crtfc.empName }" readonly></td>
			</tr>
			<tr>
				<td><span>주민번호</span></td>
				<td colspan="3"><input type="text" value="${ fn:substring(requestScope.crtfc.residentNo, 0, 6) }" readonly> - <input type="text" value="${ fn:substring(requestScope.crtfc.residentNo, 7, 14) }" readonly></td>
			</tr>
			<tr>
				<td><span>연락처</span></td>
				<td colspan="3"><input type="text" value="${ requestScope.crtfc.phone }" readonly></td>
			</tr>
			<tr>
				<td><span>업무부서</span></td>
				<input type="hidden" name="deptCode" value="${ requestScope.crtfc.empDeptCode }">
				<td><input type="text" value="${ requestScope.crtfc.empDeptName }" readonly></td>
				<td>직급</td>
				<input type="hidden" name="empPositionCode" value="${ requestScope.crtfc.empPositionCode }">
				<td><input type="text" value="${ requestScope.crtfc.positionName }" readonly></td>
			</tr>
			<tr>
				<td><span>주소</span></td>
				<td colspan="3"><input type="text" value="${ requestScope.crtfc.address }" readonly></td>
			</tr>
			<tr>
				<td><span>퇴사 사유</span></td>
				<td colspan="3"><input type="text" readonly></td>
			</tr>
			<tr>
				<td><span>재직기간</span></td>
				<!--  value="${ requestScope.requestor.enrollDate } -->
				<td colspan="3"><input type="text" value="${ fn:substring(requestScope.crtfc.empEnrollDate, 0, 10) }" readonly>~<input type="text" value="${ fn:substring(requestScope.crtfc.empRetireDate, 0, 10) }" readonly></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td colspan="3"><input type="text" value="${ requestScope.crtfc.companyName }" readonly></td>
			</tr>
			<tr>
				<td><span>소재지</span></td>
				<td colspan="3"><input type="text" value="${ requestScope.crtfc.businessAddress }" readonly></td>
			</tr>
			<tr>
				<td><span>대표이사</span></td>
				<td><input type="text" value="${ requestScope.crtfc.ceoName }" readonly></td>
				<td><span>연락처</span></td>
				<td><input type="text" value="${ requestScope.crtfc.ceoPhone }" readonly></td>
			</tr>
			<tr>
				<td>발급일</td>
				<c:if test="${ !empty requestScope.crtfc.issueDate }">
					<td><input type="text" value="${ requestScope.crtfc.issueDate }" readonly></td>
				</c:if>
				<c:if test="${ empty requestScope.crtfc.issueDate }">
					<td><input type="text" readonly></td>
				</c:if>
			</tr>
			<tr>
				<td>발급자</td>
				<td><input type="text" value="${ requestScope.crtfc.issueName }" readonly></td>
				<td>직책</td>
				<td><input type="text" value="${ requestScope.crtfc.issuePositionName }" readonly></td>
			</tr>
			<tr>
				<td>발급부서</td>
				<td><input type="text" value="${ requestScope.crtfc.issueDeptName }" readonly></td>
				<td>연락처</td>
				<td><input type="text"  value="${ requestScope.crtfc.issuePhone }" readonly></td>
			</tr>			
				</table>			
				<br><br>
				<c:if test="${fn:contains(auth,'CT1')}">
					<button class="btnAccept" type="button" onclick="acceptClick();">승낙</button>	
					<button class="btnCancle" type="button" onclick="cancleClick();">취소</button>
				</c:if>
			</form>
		</div>
	</div>
	<script>
		function acceptClick(){
			//action="accept.cr"
			$(".btnAccept").click(function (){
				$("#paperForm").attr("action", "accept.cr");
				$("#paperForm").submit();
			});
		}
		function cancleClick(){
			$(".btnCancle").click(function (){
				$("#paperForm").attr("action", "updateCancle.cr");
				$("#paperForm").submit();
			});
		}
	</script>
</body>
</html>