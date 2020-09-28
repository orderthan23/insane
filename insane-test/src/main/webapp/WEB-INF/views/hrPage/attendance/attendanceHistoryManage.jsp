<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 직원 근태 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
	
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

.table-fee {
	width: 93%;
}

.table-fee caption {
	text-align: left;
	font-size: 18pt;
	font-weight: bold;
}

.table-fee thead {
	background: #2E2C8F;
	color: white;
}

.month {
	
}

.unselected-btn {
	/* width: 80px;
	height: 80px; */
	background-color: rgb(46, 44, 143);
	border: 0px solid #ccc;
	border-radius: 50%;
	color: white;
	font-size: 15pt;
}

.unselected-btn:hover {
	background-color: rgb(0, 162, 323);
	transition: all linear 1s;
}

.selected-btn {
	/* width: 80px;
	height: 80px; */
	background-color: rgb(0, 162, 323);
	border: 0px solid #ccc;
	border-radius: 50%;
	color: white;
	font-size: 15pt;
}
.deptName{
	font-weight: bolder;
	font-size: 25px;
	margin-bottom: 20px;
}
section *{
	font-weight: normal;
}

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
				<a style="background:#524FE3; text-decoration:none; color:white;" href="selectAttendanceHistoryManage.att">출결 관리</a>
				<br>
				<a style="text-decoration:none; color:white;" href="selectVacationRequestList.att">휴가관리</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="noticeEdu.edu">출장 및 파견 관리</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="selectProvisionAndDeductionSetting.mp">지급 공제사항  설정</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="hrSalarySetting.mp">기본급 설정</a>
			
			</div>
		</aside>
		<section style="width: 100%;">
			<article id="personalFeeView">
				<div id="view-bg">
					<br>
					<canvas id="title-square"></canvas>
					<label id="personal" style="font-weight: bolder; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;출결 관리</label>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br> 
					<label>조회년도 : </label>&nbsp; <input id="thisYear" type="number" style="width: 75px; text-align: center;">&nbsp;
					<img alt="" src=""><br> <br>
						<table style="width: 80%; height: auto; text-align: center;">
							<tr>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="1월" onclick="selectMonth('01');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="2월" onclick="selectMonth('02');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="3월" onclick="selectMonth('03');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="4월" onclick="selectMonth('04');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="5월" onclick="selectMonth('05');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="6월" onclick="selectMonth('06');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="7월" onclick="selectMonth('07');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="8월" onclick="selectMonth('08');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="9월" onclick="selectMonth('09');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="10월" onclick="selectMonth('10');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="11월" onclick="selectMonth('11');">
								</td>
								<td class="month" style="width: 5%;">
									<input type="button" class="unselected-btn" value="12월" onclick="selectMonth('12');">
								</td>
							</tr>
						</table>
						<input id="print-btn" type="button" value="월 마감하기">
					<br> <br>
					<p>월간 근태 내역</p>
					<br><br>
					<div id="monthAtt" style="width:93%;">
					</div>
					<br> <br>
				</div>
			</article>
		</section>
	</div>
	<script type="text/javascript">
		var today = new Date();
		var first = new Date(today.getFullYear(), today.getMonth(),1);
		var monthList = [1,2,3,4,5,6,7,8,9,10,11,12];
		var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
		var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
		var pageFirst = first;
		var pageYear;
		if(first.getFullYear() % 4 === 0){
		    pageYear = leapYear;
		}else{
		    pageYear = notLeapYear;
		}
		
		$(function(){
			$("#thisYear").val(today.getFullYear());
		});
		
		$('.unselected-btn').click(function() {
			$('.selected-btn').addClass('unselected-btn');
			$('.selected-btn').removeClass('selected-btn');
			$(this).removeClass('unselected-btn');
			$(this).addClass('selected-btn');
		});
		
		function selectMonth(month){
			
			var thisYear = $("#thisYear").val();
			var thisMonth = month - 1;
			pageFirst = new Date(thisYear,thisMonth, 1);
			first = pageFirst;
			if(first.getFullYear() % 4 === 0){
	            pageYear = leapYear;
	        }else{
	            pageYear = notLeapYear;
	        }
	
			$.ajax({
				url:"selectAllMonthAtt.att",
				type:"post",
				data:{thisYear:thisYear, thisMonth:thisMonth},
				success:function(data){
					var monthAllAtt = JSON.parse(data);
					console.log(monthAllAtt);
					createMonthAtt(monthAllAtt, month);
				}
			});
		}
		
		function createMonthAtt(monthAllAtt, month){
			
			if(monthAllAtt.length == 0){
				alert("조회 결과가 없습니다");
				var monthAtt = $("#monthAtt");
				monthAtt.empty();
			} else {
				
		 		var monthAtt = $("#monthAtt");
				monthAtt.empty();
				
				for(var k = 0; k < monthAllAtt.length; k ++){
					
					var $deptdiv = $("<div>");
					var deptName = $('<p class="deptName">');
					deptName.text(monthAllAtt[k][0][0].deptName);
					deptName.css("font-size","50px;");
					$deptdiv.prepend(deptName);
					
					for(var a = 0; a < monthAllAtt[k].length; a++){
						
						var $name = $("<p>");
						var $table = $("<table>");
						$name.text(monthAllAtt[k][a][0].empName);
						var $tr1 = $("<tr>");
						var $tr1att = $("<tr>");
						var $tr2 = $("<tr>");
						var $tr2att = $("<tr>");
						$tr1.css("background", "#2E2C8F");
						$tr2.css("background", "#2E2C8F");
						var thisYear = $("#thisYear").val();
		
						pageFirst = new Date(thisYear, month-1, 1);
						first = pageFirst;
						if(first.getFullYear() % 4 === 0){
				            pageYear = leapYear;
				        }else{
				            pageYear = notLeapYear;
				        }
						var Code = [];
						
						for(var i = 0; i < pageYear[month-1]; i++){
							for(var j = 0; j < monthAllAtt[k][a].length; j++){
								if(monthAllAtt[k][a][j].attDateString.substring(8) == i+1){
									Code[i] = monthAllAtt[k][a][j].remark;
									break;
								} else {
									Code[i] = '-';
								}
							}
						}
						for(var j = 1; j <= pageYear[month-1]; j++){
							if(j <= 16){
								if(j < 10){
									$td1 = $("<td>", {text:j});
									$td1.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
									$td2 = $("<td>", {id:"0"+j});
									$td2.text(Code[j-1]);
									$td2.css({"text-align":"center", "width":"1%", "height":"20px"});
									$tr1.append($td1);
									$tr1att.append($td2);
								} else {
									$td1 = $("<td>", {text:j});
									$td1.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
									$td2 = $("<td>", {id:j});
									$td2.text(Code[j-1]);
									$td2.css({"text-align":"center", "width":"1%", "height":"20px"});
									$tr1.append($td1);
									$tr1att.append($td2);
								}
							} else {
								$td1 = $("<td>", {text:j});
								$td1.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
								$td2 = $("<td>", {id:j});
								$td2.text(Code[j-1]);
								$td2.css({"text-align":"center", "width":"1%", "height":"20px"});
								$tr2.append($td1);
								$tr2att.append($td2);
							}
						}
						$table.append($tr1);
						$table.append($tr1att);
						$table.append($tr2);
						$table.append($tr2att);
						$deptdiv.append($name); 
						$deptdiv.append($table);
						$deptdiv.append("<br><br>");
					}
					monthAtt.append($deptdiv);
					monthAtt.append("<br><br>");
				} 
			}
		}
	</script>
</body>
</html>