<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE - 관리자설정</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<style>
	.left-margin{
		margin-left: 20px;
		width: 100%;
	}
	.table-name{
		margin: 0 auto;
		padding: 0;
		background: #c4c4c4;
		height: inherit;
		vertical-align: middle;
		text-align: center;
	}
	.time-table{
		margin: 0 auto;
		width: 30px;
		height: 30px;
		background: #c4c4c4;
		border: 1px solid black;
	}
	#time-line td{
		padding: 0;
		margin: 0 auto;
		width: 100%;
	}
	#box-line td{
		padding: 0;
		margin: 0 auto;
	}
	section{
		width: 100%;
	}
	table tr{
		height: 40px;
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
	#pageTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/adminSetting/adminNav.jsp"/>
	
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/adminSetting/adminAside.jsp" />
		<section>
			<article>
				<div class="bluerect"></div><span id="pageTitle">기본 근태 정책 설정</span><br><br>
				<hr>
				<br><br><br>
				<form name="attendanceSetting" action="updateBaseSetting.att" method="post">
					<table style="margin: auto;">
						<tr id="근무테이블">
							<td class="table-name">
								근무 테이블
							</td>
							<td>
								<table class="left-margin">
									<tr id="time-line" style="text-align: center;">
										<td colspan="1">00</td>
										<td></td>
										<td colspan="2">02</td>
										<td colspan="2">04</td>
										<td colspan="2">06</td>
										<td colspan="2">08</td>
										<td colspan="2">10</td>
										<td colspan="2">12</td>
										<td colspan="2">14</td>
										<td colspan="2">16</td>
										<td colspan="2">18</td>
										<td colspan="2">20</td>
										<td colspan="2">22</td>
										<td></td>
										<td>24</td>
									</tr>
									<tr id="box-line">
										<td></td>
										<td><div class="time-table" id="00"></div></td>
										<td><div class="time-table" id="01"></div></td>
										<td><div class="time-table" id="02"></div></td>
										<td><div class="time-table" id="03"></div></td>
										<td><div class="time-table" id="04"></div></td>
										<td><div class="time-table" id="05"></div></td>
										<td><div class="time-table" id="06"></div></td>
										<td><div class="time-table" id="07"></div></td>
										<td><div class="time-table" id="08"></div></td>
										<td><div class="time-table" id="09"></div></td>
										<td><div class="time-table" id="10"></div></td>
										<td><div class="time-table" id="11"></div></td>
										<td><div class="time-table" id="12"></div></td>
										<td><div class="time-table" id="13"></div></td>
										<td><div class="time-table" id="14"></div></td>
										<td><div class="time-table" id="15"></div></td>
										<td><div class="time-table" id="16"></div></td>
										<td><div class="time-table" id="17"></div></td>
										<td><div class="time-table" id="18"></div></td>
										<td><div class="time-table" id="19"></div></td>
										<td><div class="time-table" id="20"></div></td>
										<td><div class="time-table" id="21"></div></td>
										<td><div class="time-table" id="22"></div></td>
										<td><div class="time-table" id="23"></div></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="근무시간">
							<td class="table-name">근무시간</td>
							<td>
								<table class="left-margin" id="근무시간">
									<tr>
										<td colspan="4">
											<p>* 기본 근무 시작 및 종료 시간을 입력하세요</p>
										</td>
									</tr>
									<tr style="text-align: center;">
										<td>
											<p>시작시간</p>
										</td>
										<td>
											<input name="workStart" type="time" value="${ AttendancePolicy.workStart }"/>
										</td>
										<td>
											<p>종료시간</p>
										</td>
										<td>
											<input name="workEnd" type="time" value="${ AttendancePolicy.workEnd }"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="식사시간">
							<td class="table-name">식사시간</td>
							<td>
								<table class="left-margin" id="식사시간">
									<tr>
										<td colspan="4">
											<p>* 식사 시작 및 종료 시간을 입력하세요</p>
										</td>
									</tr>
									<tr style="text-align: center;">
										<td>
											<p>시작시간</p>
										</td>
										<td>
											<input name="lunchStart" type="time" value="${ AttendancePolicy.lunchStart }"/>
										</td>
										<td>
											<p>종료시간</p>
										</td>
										<td>
											<input name="lunchEnd" type="time" value="${ AttendancePolicy.lunchEnd }"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="승인근로시간">
							<td class="table-name">승인 근로 시간</td>
							<td>
								<table class="left-margin" id="식사시간">
									<tr>
										<td colspan="4">
											<p>* 사전에 승인을 받은 경우 근로시간으로 인정하는 시간을 입력하세요</p>
										</td>
									</tr>
									<tr style="text-align: center;">
										<td>
											<p>시작시간</p>
										</td>
										<td>
											<input name="allowedWorkStart" type="time" value="${ AttendancePolicy.allowedWorkStart }"/>
										</td>
										<td>
											<p>종료시간</p>
										</td>
										<td>
											<input name="allowedWorkEnd" type="time" value="${ AttendancePolicy.allowedWorkEnd }"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="출퇴근 방식 설정">
							<td class="table-name">출퇴근 방식 설정</td>
							<td>
								<table class="left-margin" id="식사시간">
									<tr>
										<td>
											<input name="commuteWay" type="radio" value="unLmt" id="unLimit">
											<label for="unLimit"> 제한없음</label>
										</td>
										<td>
											<input name="commuteWay" type="radio" value="gps" id="gps">
											<label for="gps"> GPS 위치정보를 기반으로 출퇴근</label>
										</td>
									</tr>
									<tr>
										<td>
											<input name="commuteWay" type="radio" value="vrfIp" id="verifiedIp">
											<label for="verifiedIp"> WIFI 및 인증된 IP 정보를 기반으로 출퇴근</label>
										</td>
										<td>
											<input name="commuteWay" type="radio" value="qr" id="qr">
											<label for="qr"> QR코드를 기반으로 출퇴근</label>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr id="휴일 구분">
							<td class="table-name">휴일 구분</td>
							<td>
								<table class="left-margin" id="휴일구분">
									<tr>
										<td><input name="holidayYn" type="radio" value="div"> 구분</td>
										<td></td>
										<td style="text-align: center;"><input name="holidayYn" type="radio" value="undiv"> 미구분</td>
									</tr>
									<tr>
										<td style="text-align: center">토요일</td>
										<td>
											<select name="holidayFirst" id="holidayFirst">
												<option value="pay" selected>유급 휴일</option>
												<option value="unpay">무급 휴무일</option>
											</select>
										</td>
										<td style="text-align: center">일요일</td>
										<td>
											<select name="holidaySecond" id="holidaySecond">
												<option value="pay" selected>유급 휴일</option>
												<option value="unpay">무급 휴무일</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<br>
						<br>
						<input type="submit" value="저장하기" style="text-align: center;">
						<br>
						<br>
					</div>
				</form>
			</article>
		</section>
	</div>
	<script>
		$(function(){
			var workStart = "${ AttendancePolicy.workStart }".substring(0,2);
			var workEnd = "${ AttendancePolicy.workEnd }".substring(0,2);
			
			var lunchStart = "${ AttendancePolicy.lunchStart }".substring(0,2);
			var lunchEnd = "${ AttendancePolicy.lunchEnd }".substring(0,2);
			
			var allowedWorkStart = "${ AttendancePolicy.allowedWorkStart }".substring(0,2);
			var allowedWorkEnd = "${ AttendancePolicy.allowedWorkEnd }".substring(0,2);
			
			for(var i = workStart; i < workEnd; i++){
				$("#"+ (i)).css("background", "#2E2C8F");
			}
			for(var j = lunchStart; j < lunchEnd; j++){
				$("#"+ (j)).css("background", "#00FFFF");
			}
			for(var h = allowedWorkStart; h < allowedWorkEnd; h++){
				$("#"+ (h)).css("background", "#0000FF");
			}
			$("input:radio[name=commuteWay]:input[value=" + "${ AttendancePolicy.commuteWay }" + "]").attr("checked", true);
			$("input:radio[name=holidayYn]:input[value=" + "${ AttendancePolicy.holidayYn }" + "]").attr("checked", true);
			$("#holidayFirst > option[value=" + "${ AttendancePolicy.holidayFirst }" + "]").attr("selected", true);
			$("#holidaySecond > option[value=" + "${ AttendancePolicy.holidaySecond }" +"]").attr("selected", true);
		});
	</script>
</body>
</html>