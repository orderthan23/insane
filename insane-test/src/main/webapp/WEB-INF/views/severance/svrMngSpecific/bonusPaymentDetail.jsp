<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#bonus-payment-table {
	width: 100%;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

#bonus-payment-table thead tr td {
	background: #2E2C8F;
	color: white;
	height: 30px;
}

#bonus-payment-table tbody tr td {
	border: 1px solid lightgray;
}

#bonus-payment-table tbody tr td:first-child {
	background: #F2F7FF;
	border: none;
	height: 30px;
	width: 15%;
}

#bonus-payment-table tbody tr td:last-child {
	width: 50%;
}

#bonus-payment-table tfoot tr td {
	background: #2E2C8F;
	color: white;
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

#others-view-table tr td:last-child {
	width: 50%;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table id="bonus-payment-table">
		<thead>
			<tr>
				<td>연</td>
				<td>월</td>
				<td>상여금</td>
				<td>지급사유</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2016</td>
				<td>8</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2016</td>
				<td>9</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2016</td>
				<td>10</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2016</td>
				<td>11</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2016</td>
				<td>12</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>1</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>2</td>
				<td>200,000</td>
				<td>사유 작성</td>
			</tr>
			<tr>
				<td>2017</td>
				<td>3</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>4</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>5</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>6</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>7</td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">연간 상여금 총액</td>
				<td>200,000</td>
				<td>-</td>
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