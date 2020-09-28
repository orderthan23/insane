<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#miliInfoTable {
		display: none;
		width: 100%;
		height: 100%;
		text-align: center;
		font-size: 13px;
	}
	#miliInfoTable .menuColumn {
		display: table-cell;
		vertical-align: middle;
		color: black;
		background-color: #F3F3F3;
		width: 120px;
		height: 30px;
		padding: 10px;
		text-align: center;
		font-size: 13px;
	}
	.menuTd{
		text-align: -webkit-center;
	}
	#miliInfoTable .inputColumn {
		display: table-cell;
		vertical-align: middle;
		border: 1px solid #F3F3F3;
		padding: 10px;
		width: 200px;
		height: 30px;
		text-align: left;
	}
	#miliInfoTable .inputColumn2 {
		display: table-cell;
		vertical-align: middle;
		border: 1px solid #F3F3F3;
		padding: 10px;
		width: 870px;
		height: 30px;
		text-align: left;
	}
	#miliInfoTable .inputColumn input[type=text] {
		width: 96%;
	}
	#miliInfoTable .inputColumn2 input[type=text] {
		width: 99%;
	}
	#miliInfoTable .inputColumn input[type=date] {
		width: 96%;
		height: 15px;
	}
</style>
</head>
<body>
	<table id="miliInfoTable">
		<tr>
			<td class="menuTd" width="110px">
				<span class="menuColumn">병역구분</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="endsType" name="endsType"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">역종구분</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="milPosition" name="milPosition "></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">군별</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="milSpecies" name="milSpecies"></span>
			</td>
		</tr>
		<tr>
			<td class="menuTd">
				<span class="menuColumn">최종계급</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="lastClass" name="lastClass"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">복무시작일</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="date" id="servStartDate" name="servStartDate"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">복무종료일</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="date" id="servEndDate" name="servEndDate"></span>
			</td>
		</tr>
		<tr>
			<td class="menuTd" width="110px">
				<span class="menuColumn">면제사유</span>
			</td>
			<td class="inputTd" colspan="5">
				<span class="inputColumn2">
					<input type="text" id="exmpReason" name="exmpReason">
				</span>
			</td>
		</tr>
	</table>
</body>
</html>