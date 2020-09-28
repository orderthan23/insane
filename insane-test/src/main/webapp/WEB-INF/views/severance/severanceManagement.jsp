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

#empList {
	width: 35%;
	float: left;
}

#manageView {
	width: 64%;
	float: right;
}

.view-bg {
	width: 100%;
	height: 1100px;
	margin-left: 50px;
}

#title-square {
	width: 12px;
	height: 20px;
	background: #2E2C8F;
}

#nav-title {
	width: 30%;
}

#nav-blank {
	width: 26%;
}

.nav-content {
	width: 8%;
	font-size: 10pt;
	text-align: center;
}

.nav-divider {
	width: 1%;
}

.table-title, .table-content {
	font-weight: bolder;
	font-size: 20pt;
}

#emp-table-cover {
	width: 93%;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
	padding: 10px;
	border: 0;
	border-style: solid;
	border-color: #EBEBEB;
}

.emp-table {
	width: 87%;
	font-size: 10pt;
}

.emp-table thead {
	background: #2E2C8F;
	color: white;
}

.emp-table thead tr:first-child {
	width: 10px;
	text-align: center;
	height: 35px;
	background-color: #EEEEEE;
	color: #909090;
}

.td-start {
	height: 45px;
}

#specific-view {
	width: 93%;
	height: 25%;
	background: #EEEEEE;
	border-radius: 15px;
}

.mng-field-title {
	width: 15%;
}

.mng-field-content {
	width: 35%;
	text-align: ce
}

.date-input {
	width: 35px;
	text-align: center;
}

.btn-coloring {
	background: white;
	border-radius: 5px;
	border: 1px solid #48A7FF;
	margin-left: 10px;
}

/* 탭메뉴 스타일 */
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	color: #222;
}

.tab-content {
	width: 90%;
	display: none;
	background: #ededed;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
	border-bottom-left-radius: 15px;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Home</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp" />
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/asideWage.jsp" />
		<section style="width: 100%;">

			<article id="empList">
				<div class="view-bg">
					<br> <br>
					<canvas id="title-square"></canvas>
					<label id="title">&nbsp;&nbsp;&nbsp;&nbsp;직원 목록</label> <br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 80%;" size="1px">
					<br>
					<div id="emp-table-cover">
						<table class="emp-table">
							<thead>
								<tr>
									<td class="td-start">직원코드</td>
									<td>사원명</td>
									<td>직급</td>
									<td>근무부서</td>
									<td>주민등록번호</td>
								</tr>
							</thead>
							<tbody style="text-align: center; height: 35px;">
								<tr>
									<td class="td-start">416</td>
									<td>김진우</td>
									<td>평사원</td>
									<td>인사부</td>
									<td>950114-******</td>
								</tr>
								<tr>
									<td class="td-start">301</td>
									<td>박상철</td>
									<td>과장</td>
									<td>경영부</td>
									<td>880704-******</td>
								</tr>
								<tr>
									<td class="td-start">384</td>
									<td>남우연</td>
									<td>대리</td>
									<td>인사부</td>
									<td>940814-******</td>
								</tr>
								<tr>
									<td class="td-start">389</td>
									<td>최진영</td>
									<td>대리</td>
									<td>인사부</td>
									<td>921225-******</td>
								</tr>
								<tr>
									<td class="td-start">408</td>
									<td>이서영</td>
									<td>평사원</td>
									<td>인사부</td>
									<td>960504-******</td>
								</tr>
								<tr>
									<td class="td-start">411</td>
									<td>이주한</td>
									<td>평사원</td>
									<td>인사부</td>
									<td>961227-******</td>
								</tr>
							</tbody>
							<tfoot style="background: #F2F7FF;">
								<tr>
									<td colspan="13" style="height: 35px; width: 100%;"></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</article>

			<article id="manageView">
				<div class="view-bg">
					<br>
					<table style="width: 100%;">
						<tr>
							<td id="nav-title"><canvas id="title-square"></canvas> <label
								id="title">&nbsp;&nbsp;&nbsp;&nbsp;퇴직금산정관리</label></td>
							<td id="nav-blank"></td>
							<td class="nav-content"><input type="button" value="퇴직금정산조회"
								style="background: transparent; border: 0px;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button" value="퇴직금산정관리"
								style="background: transparent; border: 0px; color: #2E2C8F;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button" value="퇴직금산정조회"
								style="background: transparent; border: 0px;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button"
								value="퇴직금추계액명세서" style="background: transparent; border: 0px;"></td>
							<td style="width: 8%;"></td>
						</tr>
					</table>
					<br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
					<div id="specific-view">
						<table style="font-size: 10pt; width: 100%; height: 100%;">
							<tr>
								<td><label class="mng-field-title">1. 입사일/퇴사일</label></td>
								<td class="mng-field-content"><input type="date"
									value="2011-03-11"> ~ <input type="date"
									value="2017-07-14"></td>
								<td><label class="mng-field-title">2. 퇴직금 지급일</label></td>
								<td class="mng-field-content"><input type="date"
									value="2017-07-31"></td>
							</tr>
							<tr>
								<td><label class="mng-field-title">3. 퇴직 기준일</label></td>
								<td class="mng-field-content"><input type="date"
									value="2011-03-11"> ~ <input type="date"
									value="2017-07-14"></td>
								<td><label class="mng-field-title">4. 퇴직소득세근속기간</label></td>
								<td class="mng-field-content"><input type="date"
									value="2011-03-11"> ~ <input type="date"
									value="2017-07-31"></td>
							</tr>
							<tr>
								<td><label class="mng-field-title"> 5. 퇴직금근속기간 </label></td>
								<td class="mng-field-content"><input class="date-input"
									type="text" readonly="readonly" value="6"> 년 <input
									class="date-input" type="text" readonly="readonly" value="5">
									월 <input class="date-input" type="text" readonly="readonly"
									value="0"> 일 ( <input style="width: 55px;" type="text"
									readonly="readonly" value="2345"> 일 )</td>
								<td><label class="mng-field-title">6. 퇴직소득세근속연수</label></td>
								<td class="mng-field-content"><input class="date-input"
									type="text" readonly="readonly" value="6"> 년 <input
									class="date-input" type="text" readonly="readonly" value="5">
									월 <input class="date-input" type="text" readonly="readonly"
									value="0"> 일 ( <input style="width: 55px;" type="text"
									readonly="readonly" value="2345"> 일 )</td>
							</tr>
							<tr>
								<td>7. 제외월수</td>
								<td><input class="date-input" type="text"
									readonly="readonly" value=""> / <input
									class="date-input" type="text" readonly="readonly" value="">개월
									<input style="width: 55px;" type="text" readonly="readonly"
									value=""></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>8. 계산유형</td>
								<td colspan="2"><input class="btn-coloring" type="button"
									value="1.일할"><input class="btn-coloring" type="button"
									value="2.월할"><input class="btn-coloring" type="button"
									value="3.년할"><input class="btn-coloring" type="button"
									value="4.산정"><input class="btn-coloring" type="button"
									value="5.일할(노동부)"></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
					<br> 

					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">급여지급내역</li>
						<li class="tab-link" data-tab="tab-2">상여금지급내역</li>
						<li class="tab-link" data-tab="tab-3">퇴직정산내역</li>
						<li class="tab-link" data-tab="tab-4">소득세계산내역</li>
						<li class="tab-link" data-tab="tab-5">중간정산조회</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<%@ include file="svrMngSpecific/wagePaymentDetail.jsp"%>
					</div>
					<div id="tab-2" class="tab-content">
						<%@ include file="svrMngSpecific/bonusPaymentDetail.jsp"%>
					</div>
					<div id="tab-3" class="tab-content">
						<%@ include file="svrMngSpecific/retireSettlementDetail.jsp"%>
					</div>
					<div id="tab-4" class="tab-content">
						<%@ include file="svrMngSpecific/incomeTaxCalcDetail.jsp"%>
					</div>
					<div id="tab-5" class="tab-content">
						<%@ include file="svrMngSpecific/intermediateSettlementDetail.jsp"%>
					</div>
				</div>
			</article>
		</section>
	</div>

	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});

		});
	</script>
</body>
</html>
