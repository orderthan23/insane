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
			<article id="personalFeeView">
				<div id="view-bg">
					<br>
					<canvas id="title-square"></canvas>
					<label id="personal" style="font-weight: bolder; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;개인 근태 기록</label>
					<label id="department"><a href="selectDeptAtt.att" style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;부서 근태 기록</a></label> <br> 
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
						<input id="print-btn" type="button" value="명세서 출력">
					<br> <br>
					<p>월간 근태 내역</p>
					<table id="monthAtt" style="width:93%;">
					</table>
					<br> <br>
					<table id="totalWorkTime" style="width:93%;">
					</table>
					<br> <br>
				</div>
			</article>
		</section>
	</div>
	<script type="text/javascript">
	var today = new Date();
	var first = new Date(today.getFullYear(), today.getMonth(),1);
	var dayList = ['일','월','화','수','목','금','토'];
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
			url:"selectMonthAtt.att",
			type:"post",
			data:{thisYear:thisYear, thisMonth:thisMonth, dayRange:pageYear[thisMonth]},
			success:function(data){
				console.log(data);
				var monthAttList = JSON.parse(data);
				createMonthAtt(monthAttList, month);
			}
		});
	}
	
	function createMonthAtt(monthAttList, month){
		console.log(monthAttList.length);
		if(monthAttList.length == 0){
			alert("조회 결과가 없습니다");
			var monthAtt = $("#monthAtt");
			var totalWorkTime = $("#totalWorkTime");
			totalWorkTime.empty();
			monthAtt.empty();
		} else {
			var thisYear = $("#thisYear").val();
			console.log(thisYear + "-" + month);
			pageFirst = new Date(thisYear, month-1, 1);
			first = pageFirst;
			if(first.getFullYear() % 4 === 0){
	            pageYear = leapYear;
	        }else{
	            pageYear = notLeapYear;
	        }
			//console.log(monthAttList[0].attDateString);
			//console.log(monthAttList[1].attCode);
			var Code = [];
			var attCount = monthAttList[0].attCount;
			var totalWorkTimes = monthAttList[0].totalWorkTime;
			var normalTime = monthAttList[0].normalTime;
			var extraTime = monthAttList[0].extraTime;
			var nightTime = monthAttList[0].nightTime;
			var vacationDay = monthAttList[0].vacationDay;
			var lateCount = monthAttList[0].lateCount;
			var earlyLv = monthAttList[0].earlyLv;
			
			for(var i = 0; i < pageYear[month-1]; i++){
				for(var j = 0; j < monthAttList.length; j++){
					if(monthAttList[j].attDateString.substring(8) == i+1){
						Code[i] = monthAttList[j].remark;
						break;
					} else {
						Code[i] = '-';
					}
				}
			}
			
			console.log(Code);
			
			var monthAtt = $("#monthAtt");
			monthAtt.empty();
			var $tr1 = $("<tr>");
			var $tr1att = $("<tr>");
			var $tr2 = $("<tr>");
			var $tr2att = $("<tr>");
			$tr1.css("background", "#2E2C8F");
			$tr2.css("background", "#2E2C8F");
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
			monthAtt.append($tr1);
			monthAtt.append($tr1att);
			monthAtt.append($tr2);
			monthAtt.append($tr2att);
		}
		
		var totalWorkTime = $("#totalWorkTime");
		totalWorkTime.empty();
		var $tr3 = $("<tr>");
		var $tr4 = $("<tr>");
		$tr3.css("background", "#2E2C8F");
		
		var $td10 = $("<td>");
		$td10.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td10.text("출근 일수");
		var $td11 = $("<td>");
		$td11.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td11.text("전체 근무 시간");
		var $td12 = $("<td>");
		$td12.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td12.text("정상 근무 시간");
		var $td13 = $("<td>");
		$td13.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td13.text("연장 근무 시간");
		var $td14 = $("<td>");
		$td14.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td14.text("야간 근무 시간");
		var $td15 = $("<td>");
		$td15.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td15.text("전체 휴가 일수");
		var $td16 = $("<td>");
		$td16.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td16.text("전체 지각 횟수");
		var $td17 = $("<td>");
		$td17.css({"color":"white", "text-align":"center", "width":"1%", "height":"20px"});
		$td17.text("전체 조퇴 횟수");
		
		$tr3.append($td10).append($td11).append($td12).append($td13).append($td14).append($td15).append($td16).append($td17);
		
		var attCountTd = $("<td>");
		attCountTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		attCountTd.text(attCount);
		var totalTd = $("<td>");
		totalTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		totalTd.text(totalWorkTimes);
		var normalTd = $("<td>");
		normalTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		normalTd.text(normalTime);
		var extraTd = $("<td>");
		extraTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		extraTd.text(extraTime);
		var nightTd = $("<td>");
		nightTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		nightTd.text(nightTime);
		var vacationTd = $("<td>");
		vacationTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		vacationTd.text(vacationDay);
		var lateTd = $("<td>");
		lateTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		lateTd.text(lateCount);
		var earLvTd = $("<td>");
		earLvTd.css({"text-align":"center", "width":"1%", "height":"20px"});
		earLvTd.text(earlyLv);
		
		$tr4.append(attCountTd).append(totalTd).append(normalTd).append(extraTd).append(nightTd).append(vacationTd).append(lateTd).append(earLvTd);
		
		totalWorkTime.append($tr3);
		totalWorkTime.append($tr4);
		
	}
	</script>
</body>
</html>
