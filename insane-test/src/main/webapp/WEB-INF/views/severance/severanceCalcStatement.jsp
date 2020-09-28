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

#nav-title {
	width: 20%;
}

#nav-blank {
	width: 40%;
}

.nav-content {
	width: 8%;
	font-size: 10pt;
	text-align: center;
}

.nav-divider {
	width: 1%;
}

#okay-btn {
	border-radius: 5px;
	border: 1px solid #48A7FF;
	background: white;
	height: 30px;
	width: 45px;
	text-align: center;
	float: right;
	margin-right: 7%;
}

#statement-title {
	font-size: 45pt;
}

.table-title {
	font-weight: bold;
	font-size: 22pt;
	padding: 15px;
	font-size: 22pt;
}

.severance-calc-stmt {
	border: 1px solid #D9D5EC;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
}

.severance-calc-stmt tr, .table-field {
	border: 1px solid #D9D5EC;
}

.severance-calc-stmt thead tr {
	text-align: center;
	height: 35px;
	background-color: #EEEEEE;
	color: #909090;
}

.table-field1 {
	height: 35px;
	width: 18%;
}

.table-value1 {
	height: 35px;
	width: 32%;
}

.table-field2 {
	height: 35px;
	width: 18%;
}

.table-value2-1 {
	height: 35px;
	width: 12%;
}

.table-value2-2 {
	text-align: right;
	padding-right: 10px;
	width: 20%;
	height: 35px;
	width: 20%;
}

.table-result {
	
	border-top: 3px solid black;
	border-bottom: 3px solid black;
}
</style>
<title>Home</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="../common/aside.jsp" />
		<section style="width: 100%;">
			<article id="personalFeeView">
				<div id="view-bg">
					<br> <input id="okay-btn" type="button" value="확인"> <br>
					<br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br> <br> <br> <label id="statement-title">퇴직금
						명세서</label> <br> <br> <br> <br> <br> <br>

					<div style="width: 45%; float: left;">
						<table class="severance-calc-stmt" border="1">
							<thead>
								<tr>
									<td class="table-title" colspan="4">퇴직자 정보</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="table-field1">부서명</td>
									<td class="table-value1">인사부</td>
									<td class="table-field1">입사년월일</td>
									<td class="table-value1">2019-02-19</td>
								</tr>
								<tr>
									<td class="table-field1">직책</td>
									<td class="table-value1">평사원</td>
									<td class="table-field1">입사년월일</td>
									<td class="table-value1">2019-07-24</td>
								</tr>
								<tr>
									<td class="table-field1">성명</td>
									<td class="table-value1">김진우</td>
									<td class="table-field1">근무기간</td>
									<td class="table-value1">0년 5개월 5일</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="width: 45%; float: right; margin-right: 7%;">
						<table class="severance-calc-stmt" border="1">
							<thead>
								<tr>
									<td class="table-title" colspan="6">퇴직금 산출 내역</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="table-field2">연차수당</td>
									<td class="table-value2-1">(3개월분)</td>
									<td class="table-value2-2">30,000</td>
									<td class="table-field2" rowspan="2">연차수당</td>
									<td class="table-value2-1">소득세</td>
									<td class="table-value2-2">8,620</td>

								</tr>
								<tr>
									<td class="table-field2">기타수당</td>
									<td class="table-value2-1">(3개월분)</td>
									<td class="table-value2-2">0</td>
									<td class="table-value2-1">주민세</td>
									<td class="table-value2-2">860</td>
								</tr>
								<tr>
									<td class="table-field2-2" colspan="2">총 합계</td>
									<td class="table-value2-2">30,000</td>
									<td class="table-field2" colspan="2">공제합계</td>
									<td class="table-value2-2">9,480</td>
								</tr>
								<tr>
									<td class="table-field2-2" colspan="2">1개월 평균임금</td>
									<td class="table-value2-2">2,470,833</td>
									<td class="table-field2 table-result" style="border-left: 3px solid black;" colspan="2">지급 금액</td>
									<td class="table-value2-2 table-result" style="border-right: 3px solid black;">920,362</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div style="width: 45%; float: left; margin-top: 50px;">
						<table class="severance-calc-stmt" border="1">
							<thead>
								<tr>
									<td class="table-title" colspan="6">퇴직금 산출 내역</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="table-field2" rowspan="3">급여</td>
									<td class="table-value2-1">6월</td>
									<td class="table-value2-2">2,240,000</td>
									<td class="table-field2" rowspan="3">퇴직금액내역</td>
									<td class="table-value2-1">소득세</td>
									<td class="table-value2-2">8,620</td>

								</tr>
								<tr>
									<td class="table-value2-1">5월</td>
									<td class="table-value2-2">2,240,000</td>
									<td class="table-value2-1">주민세</td>
									<td class="table-value2-2">860</td>
								</tr>
								<tr>
									<td class="table-value2-1">4월</td>
									<td class="table-value2-2">2,240,000</td>
									<td class="table-value2-1">주민세</td>
									<td class="table-value2-2">860</td>
								</tr>
								<tr>
									<td class="table-field2-2">상여금</td>
									<td class="table-value2-1">(3개월분)</td>
									<td class="table-value2-2">0</td>
									<td class="table-field2 table-result" style="border-left: 3px solid black;">퇴직총액(세전)</td>
									<td class="table-value2-2 table-result" style="border-right: 3px solid black;" colspan="2">929,842</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="width: 45%; float: right; margin-right: 7%; margin-top: 50px;">
						<table style="border: 1px solid #D9D5EC; width: 100%; height: 170px;">
							<tr>
								<td style="padding-left:10px; width:35%;">상기 금액을 퇴직금으로 정히 영수함.</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td style="text-align: center; width:35%;">2020년 8월 11일 </td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td style="text-align: right; padding-right:10px; letter-spacing: 1px;">수 령 인 :       김 진 우        (인) </td>
							</tr>
						</table>
					</div>

				</div>

				<br> <br>
			</article>
		</section>
	</div>
</body>
</html>
