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
					<label id="personal" style="font-weight: bolder; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;부서 근태 기록</label>
					<label id="department"><a href="selectMyAttReport.att" style="color: black">&nbsp;&nbsp;&nbsp;&nbsp;개인 근태 기록</a></label> <br> 
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
			url:"selectDeptMonthAtt.att",
			type:"post",
			data:{thisYear:thisYear, thisMonth:thisMonth},
			success:function(data){
				var monthDeptAtt = JSON.parse(data);
				createMonthAtt(monthDeptAtt, month);
			}
		});
	}
	
	function createMonthAtt(monthDeptAtt, month){
		
		if(monthDeptAtt.length == 0){
			alert("조회 결과가 없습니다");
			var monthAtt = $("#monthAtt");
			monthAtt.empty();
		} else {
			
			for(var key in monthDeptAtt){
				console.log(monthDeptAtt[key]);
				console.log(monthDeptAtt)
			}
			console.log(monthDeptAtt[0][0]);
			console.log(monthDeptAtt[0][0].empName);
			
	 		var monthAtt = $("#monthAtt");
			monthAtt.empty();
			
			for(var k = 0; k < monthDeptAtt.length; k ++){
				var $name = $("<p>");
				var $table = $("<table>");
				$name.text(monthDeptAtt[k][0].empName);
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
					for(var j = 0; j < monthDeptAtt[k].length; j++){
						if(monthDeptAtt[k][j].attDateString.substring(8) == i+1){
							Code[i] = monthDeptAtt[k][j].remark;
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
				monthAtt.append($name); 
				monthAtt.append($table);
				monthAtt.append("<br><br>");
			} 
		}
	}
	</script>
</body>
</html>
