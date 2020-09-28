<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/dragReject.css">
<style type="text/css">
#head-color {
	width: 515px;
	height: 60px;
	line-height: 60px;
	background: #2E2C8F;
	margin-left: -8px;
	margin-top: -10px;
	background: #2E2C8F;
}

#pop-up-title {
	color: white;
	font-size: 20pt;
	font-weight: bold;
	padding-left: 10px;
	vertical-align: middle;
}

#input-name {
	width: 125px;
}

#company-search-btn {
	width: 20px;
	height: 20px;
	background-image:
		url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-repeat: no-repeat;
	background-size: 100%;
	border-radius: 5px;
	border: 0px;
	cursor: pointer;
	padding-top: 15px;
	line-height: 20px;
	vertical-align: middle;
}

#company-table {
	width: 400px;
	max-height: 500px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid lightgray;
}

#company-table thead tr td {
	width: 70%;
	text-align: center;
	background: #2E2C8F;
	color: white;
	font-weight: bold;
}

#company-table tbody tr td:first-child {
	background: lightgray;
	color: black;
	height: 10px;
}

#company-table tbody tr td:last-child {
	border: 1px solid lightgray;
	color: black;
	height: 10px;
}

.form-btn {
	width: 55px;
	height: 30px;
	color: white;
	background: #2E2C8F;
	text-align: center;
	border: none;
	border-radius: 5px;
}

.hightlight-click {
	background-color: #F2F5FF;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회사 선택창</title>
</head>
<body>
	<!-- 페이지 상단부 -->
	<div id="head-color">
		<label id="pop-up-title">회사 검색</label>
	</div>

	<!-- 테이블 시작 -->
	<br>
	<div style="text-align: center;">
		<form action="searchName.cp" method="post" id="search-bar">
			회사명 :&nbsp;<input type=text id="input-name" name="companyName"> 
			<input type="submit" id="company-search-btn">
		</form>
		<br> <br>
		<table id="company-table">
			<thead>
				<tr>
					<td>회사명</td>
					<td>회사코드</td>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>관리자</td>
					<td style="color: white;">0</td>
				</tr>
				<c:forEach var="comp" items="${list}">

					<tr>
						<td><c:out value="${comp.companyName}" /></td>
						<td><c:out value="${comp.companyNo}" /></td>
					</tr>

				</c:forEach>
			</tbody>

			<tfoot>
				<tr>
					<td colspan="2"></td>
				</tr>
			</tfoot>
		</table>
	</div>

	<br>
	<br>

	<div style="text-align: center;">
		<input type="button" class="form-btn" value="확인"
			onclick="setCompanyNo();"> &nbsp; <input type="button"
			class="form-btn" value="취소" onclick='self.close();'>
	</div>

	<!-- </form> -->
</body>
<script>
	var tdArr = new Array(); // 배열 선언

	$("#company-table tbody tr").click(function() {

		/* 클릭시 배경색 바꾸기 */
		var selected = $(this).hasClass("hightlight-click");
		$("#company-table tbody tr").removeClass("hightlight-click");
		if (!selected) {
			$(this).addClass("hightlight-click");
		}

		/* 클릭시 값 가져오기 */
		var tr = $(this); // 현재 클릭된 Row(<tr>)
		var td = tr.children();

		// tr.text()로 클릭된 Row의 모든 값 확인
		//console.log("클릭한 Row의 모든 데이터 : " + tr.text());

		td.each(function(i) {
			tdArr.push(td.eq(i).text());
		});

		//console.log("배열에 담긴 값 : " + tdArr);

	});

	function setCompanyNo() {
		opener.document.getElementById("input-image1").value = tdArr[1];
		self.close();
	}
</script>
</html>