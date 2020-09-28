<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#page-cover {
	height: 500px;
}

#title-square {
	width: 12px;
	height: 20px;
	background: #2E2C8F;
}

#table-title {
	font-size: 14pt;
}


#pay-deduct-table {
	width: 60%;
	float: left;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

#pay-deduct-table thead tr td {
	background: #2E2C8F;
	color: white;
	height: 30px;
}

#pay-deduct-table tbody tr td {
	border: 1px solid lightgray;
}

#pay-deduct-table tbody tr td:first-child {
	background: #F2F7FF;
	border: none;
	height: 30px;
}

#pay-deduct-table tbody tr td:nth-child(4) {
	background: #F2F7FF;
	border: none;
}

#pay-deduct-table tfoot tr td {
	background: #2E2C8F;
	color: white;
	height: 30px;
}

#pay-deduct-table thead tr td:nth-child(3) {
	width: 5%;
	background: none;
	border: none;
	background: none;
}

#pay-deduct-table tbody tr td:nth-child(3) {
	background: none;
	border: none;
}

#pay-deduct-table tfoot tr td:nth-child(3) {
	background: none;
	border: none;
}

/* 테이블 분리 */
#settlement-calc-result-table {
	width: 39%;
	float: right;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

#settlement-calc-result-table thead tr td {
	background: white;
	text-align: left;
	height: 60px;
}

#settlement-calc-result-table tbody tr td {
	border: 1px solid lightgray;
	height: 30px;
}

#settlement-calc-result-table tbody tr td:first-child {
	background: #F2F7FF;
	border: none;
}

#settlement-calc-result-table tfoot tr td {
	text-align: left;
	background: #2E2C8F;
	color: white;
	height: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="page-cover">
		<table id="pay-deduct-table">
			<thead>
				<tr>
					<td>지급내역</td>
					<td>금액</td>
					<td></td>
					<td>공제내역</td>
					<td>금액</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>퇴직금</td>
					<td>24,260,342</td>
					<td></td>
					<td>소득세</td>
					<td>598,110</td>
				</tr>
				<tr>
					<td>퇴직보험금</td>
					<td>0</td>
					<td></td>
					<td>지방소득세</td>
					<td>59,810</td>
				</tr>
				<tr>
					<td>명예퇴직금</td>
					<td>0</td>
					<td></td>
					<td>학자금상환액</td>
					<td>0</td>
				</tr>
				<tr>
					<td>비과세소득</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>공제총액</td>
					<td>657,920</td>
				</tr>
				<tr>
					<td>지급총액</td>
					<td>24,260,342</td>
					<td></td>
					<td>급여총액</td>
					<td>33,602,422</td>
				</tr>
			</tfoot>
		</table>

		<table id="settlement-calc-result-table">
			<thead>
				<tr>
					<td>&nbsp;
						<canvas id="title-square"></canvas> &nbsp;&nbsp;&nbsp;&nbsp; <label
						id="table-title">퇴직금 계산 내역</label>
					</td>
					<td style="text-align: right;">
						<input style="width: 33%; text-align: center;" id="select-show" type="text" readonly="readonly" value="1.일할">
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>급여지급총액</td>
					<td>10,950,000</td>
				</tr>
				<tr>
					<td>상여지급총액</td>
					<td>2,000,000</td>
				</tr>
				<tr>
					<td>산정급여</td>
					<td>10,950,000</td>
				</tr>
				<tr>
					<td>산정상여</td>
					<td>630,136</td>
				</tr>
				<tr>
					<td>합계</td>
					<td>11,580,136</td>
				</tr>
				<tr>
					<td>평균금액</td>
					<td>125,871</td>
				</tr>
				<tr>
					<td>근속일수</td>
					<td>2345일</td>
				</tr>
				<tr>
					<td>퇴직급여</td>
					<td>24,260,342</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">계산식 = 평균임금 * {근속기간 * (30/365(366))}</td>
				</tr>
			</tfoot>

		</table>
	</div>
</body>
</html>