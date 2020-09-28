<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.wage-table {
	width: 100%;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

.wage-table thead tr td {
	background: #2E2C8F;
	color: white;
	font-weight: bold;
}

.wage-table tfoot {
	background: #2E2C8F;
	color: white;
}

.wage-table tbody tr td {
	border: 1px solid lightgray;
}

.wage-table thead tr td:first-child {
	width: 10px;
	text-align: center;
	height: 30px;
}

.wage-table tbody tr td:first-child {
	width: 15%;
	background: #F2F7FF;
	border: none;
	height: 30px;
}

.wage-table tfoot tr td:first-child {
	height: 30px;
}

#others-view-table {
	width: 100%;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

#others-view-table tr td:nth-child(2n-1) {
	background: #2E2C8F;
	color: white;
	height: 30px;
}

#others-view-table tr td:nth-child(2n) {
	border: 1px solid lightgray;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table class="wage-table">
		<thead>
			<tr>
				<td></td>
				<td style="width: 20%">2017-05-01</td>
				<td style="width: 20%">2017-06-01</td>
				<td style="width: 20%">2017-07-01</td>
				<td rowspan="2" style="font-size: 20pt;">합계</td>
			</tr>
			<tr>
				<td></td>
				<td>2017-05-31</td>
				<td>2017-06-30</td>
				<td>2017-07-31</td>
			</tr>
			<tr>
				<td>근무일수</td>
				<td>31일</td>
				<td>30일</td>
				<td>31일</td>
				<td>92일</td>
			</tr>
		</thead>

		<tbody style="text-align: center; height: 35px;">
			<tr>
				<td>기본급</td>
				<td>3,000,000</td>
				<td>3,000,000</td>
				<td>3,000,000</td>
				<td>9,000,000</td>
			</tr>
			<tr>
				<td>연장근로</td>
				<td>200,000</td>
				<td>200,000</td>
				<td>200,000</td>
				<td>600,000</td>
			</tr>
			<tr>
				<td>식대</td>
				<td>100,000</td>
				<td>100,000</td>
				<td>100,000</td>
				<td>300,000</td>
			</tr>
			<tr>
				<td>직책수당</td>
				<td>200,000</td>
				<td>200,000</td>
				<td>200,000</td>
				<td>600,000</td>
			</tr>
			<tr>
				<td>연구개발비</td>
				<td>100,000</td>
				<td>100,000</td>
				<td>100,000</td>
				<td>300,000</td>
			</tr>
			<tr>
				<td>자격수당</td>
				<td>50,000</td>
				<td>50,000</td>
				<td>50,000</td>
				<td>150,000</td>
			</tr>
			<tr>
				<td>국외근로</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>급여(요약)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>기타비과세(요약)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>주식행사익(요약)</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


		</tbody>
		<tfoot>
			<tr>
				<td>급여총액</td>
				<td>3,650,000</td>
				<td>3,650,000</td>
				<td>3,650,000</td>
				<td>10,960,000</td>
			</tr>
		</tfoot>
	</table>
	<br>
	<table id="others-view-table">
		<tr>
			<td>산정급여</td>
			<td>10,950,000</td>
			<td>산정상여</td>
			<td>504,109</td>
			<td>산정급상여 합계</td>
			<td>11,454,109</td>
		</tr>
		<tr>
			<td>월평균입금</td>
			<td>3,818,036</td>
			<td>일평균입금</td>
			<td>124,501</td>
			<td>퇴직금 산출액</td>
			<td>23,996,288</td>
		</tr>
	</table>
</body>
</html>