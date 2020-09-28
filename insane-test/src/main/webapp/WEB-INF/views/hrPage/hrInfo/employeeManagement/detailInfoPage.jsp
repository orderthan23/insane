<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#infoDetailTable {
		display: none;
		width: 100%;
		height: 100%;
		text-align: center;
		font-size: 13px;
	}
	#infoDetailTable .menuColumn {
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
	#infoDetailTable .inputColumn {
		display: table-cell;
		vertical-align: middle;
		border: 1px solid #F3F3F3;
		padding: 10px;
		width: 200px;
		height: 30px;
		text-align: left;
	}
	#infoDetailTable .inputColumn input[type=text] {
		width: 96%;
	}
	#infoDetailTable .inputColumn input[type=date] {
		width: 130px;
		height: 15px;
	}
	#infoDetailTable .inputColumn input[type=radio] {
		width: 30px;
	}
</style>
</head>
<body>
	<table id="infoDetailTable">
		<tr>
			<td class="menuTd" width="100px">
				<span class="menuColumn">생년월일</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn">
					<input type="date" id="empBirthday" name="empBirthday" style="margin-right: 4px;" value="${ hmap.emp.empBirthday }">
					<input id="lunarSor_S" name="lunarSor" value="solar" type="radio" style="width: 13px; vertical-align: middle;" <c:if test="${ hmap.emp.lunarSor eq 'solar' }">checked</c:if>><label for="lunarSor_S" style="vertical-align: initial;">양</label>&nbsp;
					<input id="lunarSor_L" name="lunarSor" value="lunar" type="radio" style="width: 13px; vertical-align: middle;" <c:if test="${ hmap.emp.lunarSor eq 'lunar' }">checked</c:if>><label for="lunarSor_L" style="vertical-align: initial;">음</label>
				</span>
			</td>
			<td class="menuTd" width="100px">
				<span class="menuColumn">성별</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn">
					<input id="gender_m" name="gender" value="m" type="radio" <c:if test="${ hmap.emp.gender eq 'm' }">checked</c:if>><label for="gender_m" style="vertical-align: top;">남</label>&nbsp;
					<input id="gender_f" name="gender" value="f" type="radio" <c:if test="${ hmap.emp.gender eq 'f' }">checked</c:if>><label for="gender_f" style="vertical-align: top;">여</label>
				</span>
			</td>
			<td class="menuTd" width="100px">
				<span class="menuColumn">자택전화</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empHomeTel" name="empHomeTel" value="${ hmap.emp.empHomeTel }"></span>
			</td>
		</tr>
		<tr>
			<td class="menuTd">
				<span class="menuColumn">휴대전화</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empPhone" name="empPhone" value="${ hmap.emp.empPhone }"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">회사 직통번호</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empOfficeTel" name="empOfficeTel" value="${ hmap.emp.empOfficeTel }"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">직원타입</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empForm" name="empForm" value="${ hmap.emp.empForm }"></span>
			</td>
		</tr>
		<tr>
			<td class="menuTd">
				<span class="menuColumn">직종</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empOccupation" name="empOccupation" value="${ hmap.emp.empOccupation }"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">현장</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empSpot" name="empSpot" value="${ hmap.emp.empSpot }"></span>
			</td>
			<td class="menuTd">
				<span class="menuColumn">프로젝트</span>
			</td>
			<td class="inputTd">
				<span class="inputColumn"><input type="text" id="empProject" name="empProject" value="${ hmap.emp.empProject }"></span>
			</td>
		</tr>
	</table>
</body>
</html>