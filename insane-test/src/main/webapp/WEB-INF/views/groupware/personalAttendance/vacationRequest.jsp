<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<style>
body {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

article{
		height: 750px;  
		overflow-y: auto;
		overflow-x: hidden;
		}

button{
	 	display:inline-block;
		color:white;
		width:100px;
		height:30px;
		top:81px;
		background-color:#2E2C8F;
		border-radius:10px;
		}

#view-bg {
	width: 100%;
	height: 900px;
	margin-left: 50px;
}

#title-square {
	width: 12px;
	height: 20px;
	background: #2E2C8F;
}

#print-btn {
	background: #2E2C8F;
	color: white;
	border: 0px;
	border-radius: 3px;
	margin-right: 7%;
	float: right;
	height: 27px;
}

.table-title, .table-content {
	font-weight: bolder;
	font-size: 20pt;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>근태기록</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../../common/nav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="../../common/aside.jsp" />
		<section style="width: 100%;">
			<article id="vacationRequireFor">
				<div id="view-bg">
					<br>
					<canvas id="title-square"></canvas>
					<label id="personal" style="font-weight: bolder; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;휴가 신청</label>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
						<table style="width: 93%; margin-bottom: 30px; vertical-align: middle;">
							<tr>
								<td>
									<jsp:include page="/WEB-INF/views/common/calendar.jsp"/>
								</td>
								<td></td>
								<td>
									<article style="height: 360px; padding-top: 20px;">
										<table style="width: 100%; text-align: center; height: 70px;">
											<tr style="background: #2E2C8F; color: white;">
												<td>신청 휴가 목록</td>
												<td>휴가 종류</td>
												<td>반차 여부</td>
												<td>휴가 시작일자</td>
												<td>휴가 종료일자</td>
												<td>승인 여부</td>
											</tr>
											<c:forEach var="ev" items="${ vacHisList }" varStatus="s">
												<tr>
													<td><c:out value="${ s.count }"/></td>
													<td><c:out value="${ ev.vacationName }"/></td>
													<c:if test="${ ev.ampm == 'none' }">
													<td>연차</td>
													</c:if>
													<c:if test="${ ev.ampm == 'amvac' }">
													<td>오전 반차</td>
													</c:if>
													<c:if test="${ ev.ampm == 'pmvac' }">
													<td>오후 반차</td>
													</c:if>
													<td><c:out value="${ ev.vacStartDateString }"/></td>
													<td><c:out value="${ ev.vacEndDateString }"/></td>
													<c:if test="${ ev.processStatus == 'Y' }">
													<td>승인 완료</td>
													</c:if>
													<c:if test="${ ev.processStatus == 'D' }">
													<td>반려</td>
													</c:if>
												</tr>
											</c:forEach>
										</table>
									</article>
								</td>
							</tr>
						</table>
					<label>잔여 휴가 일자</label>
					<table id="leftVacation" style="width:93%;">
					</table>
					<br><br><br><br>
					<form id="insertVac" action="insertVacationRequest.att" method="post">
						<table id="vacationInfo" style="width:93%;" align="center">
							<tr>
								<td>
									<label>휴가 시작 일자</label>
								</td>
								<td style="text-align: left;">
									<input type="date" name="vacStartDate">
								</td>
								<td>
									<label>휴가 종료 일자</label>
								</td>
								<td>
									<input type="date" name="vacEndDate">
								</td>
							</tr>
							<tr>
								<td>
									<label>반차 여부</label>
								</td>
								<td style="text-align: left;">
									<select name="ampm">
										<option value="none" selected>해당 없음</option>
										<option value="amvac">오전 반차</option>
										<option value="pmvac">오후 반차</option>
									</select>
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td><label>휴가 선택</label></td>
								<td id="vacationSelect"></td>
								<td>
									<label>휴가 사유</label>
								</td>
								<td>
									<input type="text" name="vacReason" style="width: 90%;">
								</td>
							</tr>
						</table>
					</form>
					<br> <br>
					<div style="text-align: center; width: 80%">
						<button id="vacSub" type="button">휴가 신청</button>
					</div>
				</div>
			</article>
		</section>
	</div>
	<script type="text/javascript">
		
		var vacationList = [];
	
		<c:forEach items="${ empVacationList }" var="ev">
			vacationList.push({seq:"${ ev.vacationSeq }", name:"${ ev.vacationName }", amount:"${ ev.totalAmount }"})
		</c:forEach>
	
		if(vacationList.length != 0){
			var vacTb = $("#leftVacation");
			var $headtr = $("<tr>");
			$headtr.css("background", "#2E2C8F");
			var $amounttr = $("<tr>");
			
			var selecttd = $("#vacationSelect");
			var selectbox = $("<select>");
			selectbox.attr({"name":"vacationSeq"});
			var option = [];
			
			for(var i = 0; i < vacationList.length; i++){
				var nametd = $("<td>");
				nametd.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
				var amounttd = $("<td>");
				amounttd.css({"text-align":"center", "width":"1%", "height":"20px"});
				nametd.text(vacationList[i].name);
				amounttd.text(vacationList[i].amount);
				
				$headtr.append(nametd);
				$amounttr.append(amounttd);
				
				option.push("<option value=" + vacationList[i].seq + ">" + vacationList[i].name + "</option>");
			}
			
			selectbox.append(option);
			selecttd.append(selectbox);

			vacTb.append($headtr);
			vacTb.append($amounttr);
		};
		
		$("#vacSub").click(function(){
			$("#insertVac").submit();
		});
	</script>
</body>
</html>
