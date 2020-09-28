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

#payroll-table {
	width: 93%;
	border: 1px solid #D9D5EC;
}

#payroll-table thead tr:first-child {
	width: 10px;
	text-align: center;
	height: 35px;
	background-color: #EEEEEE;
	color: #909090;
}

#payroll-table tbody tr {
	/* border: 1px solid #D9D5EC; */
	
}

.td-start {
	height: 45px;
	text-align: left;
	padding-left: 10px;
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
						&nbsp;&nbsp;&nbsp;&nbsp; <label id="article-title">급여대장</label>
					</div>

					<br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
					<div id="search-bar">
						<table>
							<tr>
								<td><input class="year-btn" type="button" value="<<">&nbsp;</td>
								<td><input id="year-view" type="text" value="2020년">&nbsp;</td>
								<td><input class="year-btn" type="button" value=">>">&nbsp;</td>
							</tr>
						</table>
						<!-- <input class="search-btn" id="search-view" type="button"
							value="조회"> &nbsp; <input id="search-input" type="text">
						&nbsp; <input class="search-btn" id="search-submit" type="button"
							value="검색"> -->
					</div>
					<br> <br>


					<div>
						<table id="payroll-table">
							<thead>
								<tr>
									<td style="width: 20%;">대장명칭</td>
									<td>지급일</td>
									<td>인원</td>
									<td>급여계산</td>
									<td>수정</td>
									<td style="width: 35%;">비고</td>
								</tr>
							</thead>

							<tbody style="text-align: center; height: 35px;">
								<tr>
									<td class="td-start">2020년 07월 급여</td>
									<td>2020/07/17</td>
									<td>56명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 06월 급여</td>
									<td>2020/06/15</td>
									<td>57명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 05월 급여</td>
									<td>2020/05/13</td>
									<td>58명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 04월 급여</td>
									<td>2020/04/17</td>
									<td>55명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 03월 급여</td>
									<td>2020/03/16</td>
									<td>53명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 02월 급여</td>
									<td>2020/02/14</td>
									<td>53명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start">2020년 01월 급여</td>
									<td>2020/01/15</td>
									<td>54명</td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="개인계산"> <input type="button"
										class="payroll-calc-btn" id="calcAll" value="전체계산"></td>
									<td><input type="button" class="payroll-calc-btn"
										id="calcIndividual" value="수정"></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td class="td-start"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
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
