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

#prt-btn{
	background: #48A7FF;
	color: white;
	border: none;
	border-radius: 5px;
	height: 30px;
	width: 55px;
}

#document-title{
	font-size: 20pt;
	font-weight: bold;
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

#payroll-table thead tr td:first-child {
	text-align: center;
}

#payroll-table thead tr td {
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
					<div style="float: right; margin-right: 7%">
						<input type="button" id="prt-btn" value="확인">
					</div>
					<br><br>
					
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br>
					
					<div id="document-title">2020년 7월 급여</div>
					<br> <br>

					<div id="scroll">
						<table id="payroll-table">
							<thead>
								<tr>
									<td><input type="checkbox"
										name="selectAll">사원명</td>
									<td>급여</td>
									<td>차량유지비</td>
									<td>연장수당</td>
									<td>야근수당</td>
									<td>소득세</td>
									<td>주민세</td>
									<td>국민연금</td>
									<td>건강보험</td>
									<td>고용보험</td>
								</tr>
								<tr>
									<td>직원코드</td>
									<td>철야수당</td>
									<td>주말근무</td>
									<td>직책수당</td>
									<td>상여</td>
									<td>장기요양</td>
									<td>사우회비</td>
									<td>연말정산</td>
									<td class="table-bold">공제총액</td>
									<td class="table-bold">실지급액</td>
								</tr>
								<tr>
									<td>직급</td>
									<td>특근수당</td>
									<td>식대</td>
									<td></td>
									<td class="table-bold">지급총액</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</thead>

							<tbody style="text-align: center; height: 35px;">
								
							</tbody>

							<tfoot style="background: #F2F7FF;">
								<tr>
									
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
