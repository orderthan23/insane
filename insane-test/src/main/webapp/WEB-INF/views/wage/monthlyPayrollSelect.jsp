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

#article-title {
	font-size: 18pt;
	font-weight: bolder;
}

.year-btn {
	border-radius: 10px;
	border: 1px solid #48A7FF;
	background: white;
	height: 30px;
	width: 30px;
	text-align: right;
}

#year-view {
	border-radius: 5px;
	border: 1px solid #48A7FF;
	background-color: #F2F5FF;
	text-align: center;
	height: 30px;
	width: 80px;
	height: 30px;
}

#scroll {
	width: 93%;
	height: 550px;
	overflow: scroll;
	overflow-x: hidden;
	padding: 10px;
	border: 0;
	border-style: solid;
	border-color: #EBEBEB;
}

#payroll-table {
	width: 100%;
	border: 1px solid #D9D5EC;
}

#payroll-table thead tr:first-child {
	text-align: center;
	background-color: #EEEEEE;
	color: #909090;
}

#payroll-table tbody tr td {
	border-bottom: 1px solid #D9D5EC;
}

#payroll-table tfoot tr td {
	height: 45px;
	font-size: 14pt;
	font-weight: bold;
	padding-left: 10px;
}

.td-start {
	height: 45px;
	width: 45px;
}

.payroll-calc-btn {
	background: #EEEEEE;
	border: none;
	border-radius: 10px;
	font-size: 13pt;
	height: 35px;
	width: 105px;
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
					<br> <br>
					<div>
						<canvas id="title-square"></canvas>
						&nbsp;&nbsp;&nbsp;&nbsp; <label id="article-title">개인별급여계산대상자선택</label>
						copy section from seveacalcSettle
					</div>

					<br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
					<div id="search-bar">
						<table>
							<tr>
								<td>copy section from seveacalcSettle </td>
							</tr>
						</table>
						<!-- <input class="search-btn" id="search-view" type="button"
							value="조회"> &nbsp; <input id="search-input" type="text">
						&nbsp; <input class="search-btn" id="search-submit" type="button"
							value="검색"> -->
					</div>
					<br> <br>


					<div id="scroll">
						<table id="payroll-table">
							<thead>
								<tr>
									<td class="td-start"><input type="checkbox"
										name="selectAll"></td>
									<td>직원코드</td>
									<td>사원명</td>
									<td>부서</td>
									<td>직급</td>
									<td>입사일</td>
									<td style="width: 35%;">비고</td>
								</tr>
							</thead>

							<tbody style="text-align: center; height: 35px;">
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>416</td>
									<td>김진우</td>
									<td>부서1</td>
									<td>직급1</td>
									<td>2019/02/19</td>
									<td></td>
								</tr>
							</tbody>

							<tfoot style="background: #F2F7FF;">
								<tr>
									<td colspan="7">제목 : 2020년 7월 급여</td>
								</tr>
							</tfoot>
						</table>
					</div>

					<br> <br>
				</div>
			</article>
		</section>
	</div>
</body>
</html>
