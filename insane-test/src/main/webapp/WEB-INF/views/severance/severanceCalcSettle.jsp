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

.search-btn {
	border-radius: 5px;
	border: 1px solid #48A7FF;
	background: white;
	height: 30px;
	width: 65px;
	text-align: right;
}

#search-view {
	width: 65px;
}

#search-submit {
	width: 40px;
}

#search-input {
	border-radius: 5px;
	border: 1px solid #48A7FF;
	background-color: #F2F5FF;
	height: 30px;
	width: 250px;
	height: 30px;
}

.table-title, .table-content {
	font-weight: bolder;
	font-size: 20pt;
}

.severance-calc {
	width: 100%;
}

.severance-calc thead {
	background: #2E2C8F;
	color: white;
}

.severance-calc thead tr:first-child {
	width: 10px;
	text-align: center;
	height: 35px;
	background-color: #EEEEEE;
	color: #909090;
}

.td-start {
	height: 45px;
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
					<br>
					<table style="width: 100%;">
						<tr>
							<td id="nav-title"><canvas id="title-square"></canvas> <label
								id="title">&nbsp;&nbsp;&nbsp;&nbsp;퇴직금정산조회</label></td>
							<td id="nav-blank"></td>
							<td class="nav-content"><input type="button" value="퇴직금정산조회"
								style="background: transparent; border: 0px; color: #2E2C8F;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button" value="퇴직금산정관리"
								style="background: transparent; border: 0px;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button" value="퇴직금산정조회"
								style="background: transparent; border: 0px;"></td>
							<td class="nav-divider">|</td>
							<td class="nav-content"><input type="button"
								value="퇴직금추계액명세서" style="background: transparent; border: 0px;"></td>
							<td style="width: 4%;"></td>
						</tr>
					</table>
					<br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
					<div id="search-bar">
						<table>
							<tr>
								<td><input class="search-btn" id="search-view"
									type="button" value="조회">&nbsp;</td>
								<td><input id="search-input" type="text">&nbsp;</td>
								<td><input class="search-btn" id="search-submit"
									type="button" value="검색"></td>
							</tr>
						</table>
						<!-- <input class="search-btn" id="search-view" type="button"
							value="조회"> &nbsp; <input id="search-input" type="text">
						&nbsp; <input class="search-btn" id="search-submit" type="button"
							value="검색"> -->
					</div>
					<br> <br>


					<div
						style="width: 93%; height: 550px; overflow: scroll; overflow-x: hidden; padding: 10px; border: 0; border-style: solid; border-color: #EBEBEB">
						<table class="severance-calc">
							<thead>
								<tr>
									<td><input type="checkbox" name="selectAll"></td>
									<td>구분</td>
									<td>직원코드</td>
									<td>사원명</td>
									<td>산정기간</td>
									<td>귀속년월</td>
									<td>지급년월</td>
									<td>퇴직급여</td>
									<td>소득세</td>
									<td>지방소득세</td>
									<td>공제총액</td>
									<td>실지급액</td>
									<td style="width: 10px;"></td>
								</tr>
							</thead>
							<tbody style="text-align: center; height: 35px;">
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>퇴직</td>
									<td>416</td>
									<td>김진우</td>
									<td>155일</td>
									<td>2019-02-19</td>
									<td>2019-07-24</td>
									<td>929,842</td>
									<td>8,620</td>
									<td>860</td>
									<td>9,480</td>
									<td>920,362</td>
									<td style="width: 10px;">:</td>
								</tr>
								<tr>
									<td class="td-start"><input type="checkbox" name=""></td>
									<td>중간</td>
									<td>432</td>
									<td>박철민</td>
									<td>422일</td>
									<td>2019-11-06</td>
									<td>2020-12-31</td>
									<td>3,087,777</td>
									<td>75,160</td>
									<td>7,510</td>
									<td>82,670</td>
									<td>3,005,107</td>
									<td style="width: 10px;">:</td>
								</tr>
							</tbody>
							<tfoot style="background: #F2F7FF;">
								<tr>
									<td colspan="13" style="height: 35px; width: 100%;"></td>
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
