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
	width: 120%;
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

.bluebox {
	display: inline-block;
	width: 11px;
	height: 21px;
	background-color: #2E2C8F;
	vertical-align: text-bottom;
}

.contentHeader {
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
	width: 90%;
	border: 1px solid lightgray;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
	margin-left: auto;
}

#searchTable td, #listTable th, #listTable td {
	border-bottom: 1px solid #D9D5EC;
	padding-top: 5px;
	padding-bottom: 5px;
}

#listTable th {
	background: #2E2C8F;
	height: 35px;
	color: white;
	font-size: 16px;
}

#listTable td {
	font-size: 13px;
}

#listTable tbody tr:hover {
	cursor: pointer;
	background: lightgray;
	/* background: #B3B3CD; */
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

#choosenEmp {
	width: 90%;
	border: 1px solid lightgray;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
	margin-left: auto;
}

#choosenEmp th {
	background: #2E2C8F;
	height: 35px;
	color: white;
	font-size: 16px;
}

#choosenEmp tbody tr {
	border: 1px solid lightgray;
	background: white;
}

#choosenEmp td {
	font-size: 13px;
	height: 30px;
}

#provTableDiv {
	height: 80%;
}

#provTable {
	width: 90%;
	border: 1px solid lightgray;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
	margin-left: auto;
}

#provTable th {
	background: #2E2C8F;
	height: 35px;
	color: white;
	font-size: 16px;
}

#provTable tbody tr {
	border: 1px solid lightgray;
	background: white;
}

#provTable td {
	font-size: 13px;
	height: 30px;
}

#provTable .provDate {
	border: 1px solid lightgray;
}

.amountInput {
	width: 75px;
	border: 1px solid lightgray;
}

#provisionNameSelect {
	width: 150px;
}

.insertProvBtn {
	background: #48A7FF;
	border: 1px solid #48A7FF;
	border-radius: 8px;
	color: white;
}

.insertProvBtn:hover {
	background: white;
	border: 1px solid #48A7FF;
	border-radius: 8px;
	color: gray;
	cursor: pointer;
	height: 95%;
}

/* 지급사항내역 테이블 */
#provHistList {
	width: 90%;
	border: 1px solid lightgray;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
	margin-left: auto;
}

#provHistList th {
	height: 35px;
	font-size: 16px;
}

#provHistList th:nth-child(2n-1) {
	background: #2E2C8F;
	color: white;
}

#provHistList th:nth-child(2n) {
	background: white;
}

#provHistList tbody tr {
	border: 1px solid lightgray;
	background: white;
}

#provHistList td {
	font-size: 13px;
	height: 30px;
}

/* 탭메뉴 */
ul.tabs {
	margin-left: 20px;
	padding: 0px;
	list-style: none;
	padding: 0px;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	widows: 90%;
	display: none;
	background: linear-gradient(to bottom, #ededed, white);
	padding: 15px;
}

.tab-content.current {
	display: inherit;
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
				<div class="contentHeader">
					<div class="bluebox"></div>
					<label>사원 선택</label>
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
									<input type="hidden" name="empNoSeq" value="${ emp.empNoSeq }">
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
						<c:url var="empListBack" value="selectEmpListForSalary.sal">
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
							<c:url var="empListCheck" value="selectEmpListForSalary.sal">
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
						<c:url var="empListEnd" value="selectEmpListForSalary.sal">
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
		<div id="employee-salary">
			<div class="contentHeader">
				<div class="bluebox"></div>
				<label>지급사항설정</label>
			</div>
			<br>

			<!-- 메뉴바 -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">지급선택</li>
				<li class="tab-link" data-tab="tab-2">지급사항내역</li>
			</ul>

			<!-- 메뉴바 끝 / 테이블 시작 -->

			<div id="tab-1" class="tab-content current">
				<div id="provTableDiv">
					<br> <br>
					<table id="choosenEmp">
						<thead>
							<tr>
								<th colspan="4">현재 선택된 사원</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<input type="hidden" name="hiddenEmpSeq" id="hiddenEmpSeq">
								<td>이름 :</td>
								<td><label id="empName"></label></td>
								<td>사번 :</td>
								<td><label id="empNo"></label></td>
							</tr>
						</tbody>
					</table>

					<table id="provTable">
						<thead>
							<tr>
								<th>지급항목명</th>
								<th>지급항목유형</th>
								<th>금액</th>
								<th>지급날짜</th>
								<th>지급여부</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:forEach var="prov" items="${ provList }">
								<tr>
									<input type="hidden" name="provisionSeq"
										value="${ prov.provisionSeq }">
									<td><c:out value="${ prov.provisionName }" /></td>
									<td><c:out value="${ prov.provisionType }" /></td>
									<td><input class="amountInput" type="text" name="amount"> 원</td>
									<td><input class="provDate" type="date" name="provDate"></td>
									<td><button class="insertProvBtn" type="button"
											onclick="insertProvHis();">지급</button></td>
								</tr>
							</c:forEach> --%>
							<tr>
								<input type="hidden" name="provisionSeq" id="provisionSeq">
								<td><select id="provisionNameSelect"
									onchange="selectProvision()">
										<c:forEach var="prov" items="${ provList }">
											<option>${ prov.provisionName }</option>
										</c:forEach>
								</select></td>
								<td><label id="provisionType"></label></td>
								<td><input class="amountInput" type="text" name="amount">
									원</td>
								<td><input class="provDate" type="date" name="provDate"></td>
								<td><button class="insertProvBtn" type="button"
										onclick="insertProvHis();">지급</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-2" class="tab-content">
				<br> <br>
				<table id="provHistList">
					<thead>
						<tr>
							<th>연</th>
							<th><select id="yearSelect">
									<option></option>
							</select></th>
							<th>월</th>
							<th><select id="monthSelect">
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select></th>
						</tr>

					</thead>
					<tbody>
						<tr>
							<td>지급항목명</td>
							<td>지급항목유형</td>
							<td>금액</td>
							<td>지급일자</td>
						</tr>
						<tr>
							<td id="listProvisionName"></td>
							<td id="listProvisionType"></td>
							<td id="listAmount"></td>
							<td id="listPayDate"></td>
						</tr>
					</tbody>

				</table>
			</div>
		</div>
		<!--   ContentWrapper End -->

	</div>
	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tabId = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tabId).addClass('current');
			});

		});

		function selectProvision() {
			var selectBoxIdx = document.getElementById("provisionNameSelect").selectedIndex;
			var option = document.getElementById("provisionNameSelect").options;
			var idx = option[selectBoxIdx].index;
			var provisionTypeList = new Array();
			var provisionSeqList = new Array();
			var provisionType = null;
			var provisionSeq = null;

			<c:forEach var="prov" items="${ provList }">
			provisionTypeList.push("${prov.provisionType}");
			provisionSeqList.push("${prov.provisionSeq}")
			</c:forEach>

			provisionType = provisionTypeList[idx];
			provisionSeq = provisionSeqList[idx];

			$("#provisionType").text(provisionType);
			$("#provisionSeq").val(provisionSeq);
		}

		$(document).on("click", "#listTable tr", function() {

			//이름과 사번 추출
			var tr = $(this);
			var td = tr.children();
			var tdArr = new Array();
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			//정의
			var empNo = tdArr[1];
			var empName = tdArr[2];
			var empNoSeq = $(this).children("input").eq(0).val()
			var provHistoryList = new Array();
			var empSelect = new Array();
			var year;

			empSelect.push(empNoSeq);
			empSelect.push(empNo);
			empSelect.push(empName);

			//console.log(empSelect);

			$("#hiddenEmpSeq").val(empNoSeq);
			$("#empName").text(empName);
			$("#empNo").text(empNo);

			/* 	<input type="hidden" name="empNoSeq">
						<td>이름 : </td>
						<td><label id="empName"></label></td>
						<td>사번 : </td>
						<td><label id="empNo"></label></td>
					</tr> */

			$.ajax({
				type : "POST",
				url : "selectProvisionHistoryList.sal",
				data : {
					empNoSeq : empNoSeq,
					provHistoryList : provHistoryList
				}
			});

			/* $.ajax({
				type : "POST",
				url : "selectListYear.sal",
				data : {
					year : year
				}
			}); */

		});

		function insertProvHis() {
			var empNoSeq = $('input[name=hiddenEmpSeq]').val();
			var provisionSeq = $('input[name=provisionSeq]').val();
			var amount = $('input[name=amount]').val();
			var provDate = $('input[name=provDate]').val();

			$(".amountInput").val("");
			/* 			console.log(empNoSeq);
			 console.log(provisionSeq);
			 console.log(amount);
			 console.log(provDate); */

			$.ajax({
				type : "POST",
				url : "insertProvHistory.sal",
				data : {
					empNoSeq : empNoSeq,
					provisionSeq : provisionSeq,
					amount : amount,
					provDate : provDate
				},
				success : function(data) {
					alert("입력 완료!");
				}
			});

		}
	</script>
</body>
</html>
