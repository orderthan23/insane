<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<style>
.mainContent {
	display: inline-block;
	order: 2;
	width: auto;
	height: 100%;
	padding: 2em;
	margin-left: auto;
	margin-right: auto;
	font-family: 'NanumSquare';
}

#employee-list {
	background: #ffffff;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 15px;
	/* width: 700px; */
	width: 100%;
	height: 750px;
	float: left;
}

#employee-salary {
	background: #ffffff;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 15px;
	width: 40%;
	height: 750px;
	order: 4;
	float: right;
	margin-top: 30px;
	margin-right: 50px;
}

#bluebox {
	display: inline-block;
	width: 11px;
	height: 21px;
	background-color: #2E2C8F;
	vertical-align: text-bottom;
}

#contentHeader {
	padding-top: 30px;
	padding-left: 30px;
	padding-right: 30px;
	font-size: 18px;
	font-weight: 700;
}

#headerLine {
	display: inline-block;
	width: 1015px;
	margin-left: 30px;
	height: 1px;
	background-color: black;
}

#searchTable {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	border-top: 1px solid #D9D5EC;
}

#listArea {
	height: 80%;
}

#listTable {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

#searchTable td, #listTable th, #listTable td {
	border-bottom: 1px solid #D9D5EC;
	padding-top: 5px;
	padding-bottom: 5px;
}

#listTable th {
	background: #2E2C8F;
	color: white;
	font-size: 16px;
}

#listTable td {
	font-size: 13px;
}

#listTable tbody tr:hover {
	cursor: pointer;
	background: #B3B3CD;
}

.pageBtn {
	border: 1px solid lightgray;
	border-radius: 6px;
	padding: 8px;
	font-size: 12px;
	display: inline-block;
	width: 30px;
	height: 12px;
}

.numBtn {
	width: 12px;
}

.checkBtn {
	background: #48A7FF;
	border: 1px solid #48A7FF;
	color: white;
}

.pageBtn:hover {
	cursor: pointer;
}
</style>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<title>Home</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp" />
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/asideWage.jsp" />
		<div class="mainContent">
			<div id="employee-list">
				<div id="contentHeader">
					<div id="bluebox"></div>
					<label>기본급여설정</label>
				</div>
				<br>
				<!-- contentHeader End -->

				<!-- listArea Start -->
				<div id="listArea">
					<table id="listTable">
						<thead>
							<tr>
								<th width="80px"><span class="column1">사원번호</span></th>
								<th width="80px"><span class="column1">이름</span></th>
								<th width="80px"><span class="column1">직원유형</span></th>
								<th width="80px"><span class="column1">근무지역</span></th>
								<th width="80px"><span class="column1">근무부서</span></th>
								<th width="80px"><span class="column1">직급</span></th>
								<th width="80px"><span class="column1">직책</span></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="emp" items="${ list }">
								<tr>
									<input type="hidden" value="${ emp.empNoSeq }">
									<td><c:out value="${ emp.empNo }" /></td>
									<td><c:out value="${ emp.empNameKor }" /></td>
									<td><c:out value="${ emp.empForm }" /></td>
									<td><c:out value="${ emp.locationName }" /></td>
									<td><c:out value="${ emp.deptName }" /></td>
									<td><c:out value="${ emp.positionName }" /></td>
									<td><c:out value="${ emp.rspofcName }" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- listArea End -->

				<!-- pagingArea Start -->
				<div id="pagingArea" align="center">
					<c:if test="${ pi.currentPage <= 1 }">
						<span class="pageBtn">이전</span>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="empListBack" value="selectEmpListForSalary.em">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
						</c:url>
						<span class="pageBtn checkBtn"
							onclick="location.href='${ empListBack }'">이전</span>
					</c:if>

					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<span class="pageBtn numBtn checkBtn">${ p }</span>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="empListCheck" value="selectEmpListForSalary.em">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<span class="pageBtn numBtn"
								onclick="location.href='${ empListCheck }'">${ p }</span>
						</c:if>
					</c:forEach>

					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<span class="pageBtn">다음</span>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="empListEnd" value="selectEmpListForSalary.em">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
						</c:url>
						<span class="pageBtn textBtn checkBtn"
							onclick="location.href='${ empListEnd }'">다음</span>
					</c:if>
				</div>
				<!-- pagingArea End -->
			</div>
			<!--  employee-list End -->
		</div>
		<!--   mainContent End -->
		<div id="employee-salary"></div>
		<!--   ContentWrapper End -->

	</div>
	<script>
		$(document).on("click", "#listTable td", function() {
			var num = $(this).parent().children("input[type=hidden]").val();
/* 			var empArry = new Array();
			<c:forEach items="${list}" var="emp">
			empArry.push("${emp}");
			</c:forEach>
 */
			console.log(empArry);

			//var num = $(this).parent().children("input").val();
			//location.href = "selectEmpListForSalary.em?num=" + num;
		});

		/* $('#listTable tbody').click(function() {
			
		}); */
	</script>

</body>
</html>
