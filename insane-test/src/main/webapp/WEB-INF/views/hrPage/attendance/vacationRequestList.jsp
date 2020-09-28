<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 휴가 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
	
<style>
#articleWrap{
	width: 95%;
	margin-left: auto;
	margin-right: auto;
​
}
#blueBox{
	
	width: 10px;
	height: 25px;
	background: #2E2C8F;
	margin-right: 5px;
}
#boardTable{
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
​
	
}
#boardTable *{
	font-weight: normal;
}
#boardTable td{
	height: 25px;
	border-bottom: 1px solid lightgray;
	font-weight: normal;
	color: black;
	font-size: 10px;
}
#headerTr{
 	border-collapse: collapse;
 	background: #2E2C8F;
 	color: white;
 	border: none;
 	height: 45px;
​
 
 	
}
#headerTr th{
	border-collapse: collapse;
	border: none;
	
	font-weight: bolder;
	background: #2E2C8F;
	font-size: 13px;
}
article{
	width: 90%;
	height: 750px;
	margin-left: auto;
	margin-right: auto;
}
#deleteBtn,
#writeBtn{
	color: white;
	background: #2E2C8F;
	border-radius: 3px;
	border: none;
	width: 60px;
	height: 30px;
​
}
#btnZone td{
	border-bottom: none;
}
​
​
​
#fixedTable{
​
	width: 100%;
	height : 600px;
	margin-left: auto;
	margin-right: auto;
	overflow-y:auto; 
	
}
aside{
	width: 300px;
	
}
#sideMenu{
	width: 100%;
}
​		<c:if test="${!fn:contains(auth,'AS1') }">
			<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
		</c:if>
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp"/>
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
				<p style="font-size:20px;">근태 관리</p>
				<br><br>
				<a style="text-decoration:none; color:white;" href="selectAttendanceHistoryManage.att">출결 관리</a>
				<br>
				<a style="background:#524FE3; text-decoration:none; color:white;" href="selectVacationRequestList.att">휴가관리</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="noticeEdu.edu">출장 및 파견 관리</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="selectProvisionAndDeductionSetting.mp">지급 공제사항  설정</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="hrSalarySetting.mp">기본급 설정</a>
			
			</div>
		</aside>
	<section>
		<article>
			<div id="articleWrap">
				<br><br>
				<span id="blueBox">`</span><label style="font-size:20px;">휴가 내역</label>
				<br><br>
				<div id="fixedTable">
				<table id="boardTable">
					
					<tr id="headerTr">
						
						
						<th width="1%">-</th>
						<th width="10%">부서</th>
						<th width="5%">직급</th>
						<th width="5%">이름</th>
						<th width="5%">휴가구분</th>
						<th width="5%">반차구분</th>
						<th width="5%">시작일자</th>
						<th width="5%">종료일자</th>
						<th width="5%">휴가차감일수</th>
						<th width="5%">작성일자</th>
						<th width="10%">사유</th>
						<th width="10%">상태</th>
					</tr>
				
				
					<c:forEach var="e" items="${ allEmpVacReqList }" varStatus="count">
					<tr>
						<td class="info"><c:out value="${ fn:length(allEmpVacReqList) - count.index }"/></td>
						<td><c:out value="${ e.deptName }"/></td>
						<td><c:out value="${ e.positionName }"/></td>
						<td><c:out value="${ e.vacationName }"/></td>
						<td><c:out value="${ e.empNameKor }"/></td>
						<c:if test="${ e.ampm == 'none' }">
						<td>연차</td>
						</c:if>
						<c:if test="${ e.ampm == 'amvac' }">
						<td>오전 반차</td>
						</c:if>
						<c:if test="${ e.ampm == 'pmvac' }">
						<td>오후 반차</td>
						</c:if>
						<td><c:out value="${ e.vacStartDateString }"/></td>
						<td><c:out value="${ e.vacEndDateString }"/></td>
						<td><c:out value="${ e.decreaseDays }"/></td>
						<td><c:out value="${ e.reqDateString }"/></td>
						<td><c:out value="${ e.vacReason }"/></td>
						<c:if test="${ e.processStatus == 'N' }">
						<td><input type="hidden" value="${ e.vacHisSeq }">
						<c:if test="${fn:contains(auth,'AS2') }">
						<button onclick="approval(${ e.vacHisSeq });">승인</button>  <button onclick="denied(${ e.vacHisSeq });">반려</button>
						</c:if>
						</td>
						</c:if>
						<c:if test="${ e.processStatus == 'Y' }">
						<td>승인</td>
						</c:if>
						<c:if test="${ e.processStatus == 'D' }">
						<td>반려</td>
						</c:if>
					</tr>
					</c:forEach>
				</table>
				</div>
				<br><br><br>
		
		
			</div>
		</article>
	</section>
	
	
	
	</div>
	<script>
		$('.info').parent().hover(function(){
			$(this).css('background','#f1f1f1');
		},
		function(){
			$(this).css('background','white');
		}
		); 
		
		function approval(i){
			console.log(i);
			location.href = "updateVacHisApp.att?no=" + i;
		}
		
		function denied(i){
			console.log(i);
			location.href = "updateVacHisDen.att?no=" + i;
		}
	
	</script>
</body>
</html>