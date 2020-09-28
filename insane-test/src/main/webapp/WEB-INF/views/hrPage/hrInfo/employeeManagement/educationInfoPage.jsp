<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#educationInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#educationInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#educationInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#educationInfoTable tbody td {
		font-weight: 400;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	.btn {
		display: inline-block;
		width: 18px;
		height: 18px;
		background: #2E2C8F;
		color: white;
		text-align: center;
		border-radius: 4px;
	}
	.btn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<table id="educationInfoTable">
		<thead>
			<tr>
				<td width="80px;">교육시작일</td>
				<td width="80px;">교육종료일</td>
				<td width="300px;">교육훈련명</td>
				<td width="300px;">메모사항</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>