<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

#title-square {
	width: 12px;
	height: 20px;
	background: #2E2C8F;
}

#print-btn {
	background: #2E2C8F;
	color: white;
	border: 0px;
	border-radius: 3px;
	margin-right: 7%;
	float: right;
	height: 27px;
}

#fee-td {
	line-height: 225px;
}

#fee {
	height: 225px;
	width: 225px;
	margin-left: auto;
	margin-right: auto;
	background-color: rgb(46, 44, 143);
	border-radius: 450px;
	border: 0px solid #ccc;
	vertical-align: middle;
	color: white;
	font-size: 24pt;
}

.table-title, .table-content {
	font-weight: bolder;
	font-size: 20pt;
}

.table-fee {
	width: 93%;
}

.table-fee caption {
	text-align: left;
	font-size: 18pt;
	font-weight: bold;
}

.table-fee thead {
	background: #2E2C8F;
	color: white;
}

.month {
	
}

.unselected-btn {
	width: 80px;
	height: 80px;
	background-color: rgb(46, 44, 143);
	border: 0px solid #ccc;
	border-radius: 50px;
	color: white;
	font-size: 18pt;
}

.unselected-btn:hover {
	background-color: rgb(0, 162, 323);
	transition: all linear 1s;
}

.selected-btn {
	width: 80px;
	height: 80px;
	background-color: rgb(0, 162, 323);
	border: 0px solid #ccc;
	border-radius: 50px;
	color: white;
	font-size: 18pt;
}

article {
	height: 750px;
	overflow-y: auto;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>개인 급여 조회</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/aside.jsp" />
		<section style="width: 100%;">
			<article id="personalFeeView">
				<div id="view-bg">
					<br>
					<canvas id="title-square"></canvas>
					<label id="title">&nbsp;&nbsp;&nbsp;&nbsp;개인 급여 조회</label> <br>
					<hr noshade="noshade" color="black"
						style="margin-top: 15px; width: 93%;" size="1px">
					<br> <label>조회년도 : &nbsp;</label> <select name="yearSelect">
						<c:forEach var="yearItems" items="${year}" varStatus="status">
							<option>${yearItems}</option>
						</c:forEach>

						<%-- 					<option value="${prt.id}"
							${prt.id == provider ? 'selected="selected"' : '' }>${prt.nm}</option> --%>
					</select> &nbsp; <br> <br>

					<!-- form 및 table 시작지점 -->

					<form>
						<table style="width: 93%; height: 500px; text-align: center;">
							<tr>
								<td class="month" style="width: 10%;"><input type="button"
									class="unselected-btn" value="1월" onclick="selectMonth('01');"></td>
								<td class="month" style="width: 10%;"><input type="button"
									class="unselected-btn" value="2월" onclick="selectMonth('02');"></td>
								<td class="month" style="width: 10%;"><input type="button"
									class="unselected-btn" value="3월" onclick="selectMonth('03');"></td>
								<td style="width: 34%;" class="table-title">실 지급액</td>
								<td style="width: 18%;" class="table-title">지급 총액</td>
								<td style="width: 18%;" class="table-title">공제 총액</td>
							</tr>
							<tr>
								<td class="month"><input type="button"
									class="unselected-btn" value="4월" onclick="selectMonth('04');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="5월" onclick="selectMonth('05');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="6월" onclick="selectMonth('06');"></td>
								<td id="fee-td" rowspan="3"><div id="fee">
										<label id="totalCalc">0</label>
									</div></td>
								<td class="table-content" rowspan="3"><label id="totalWage">0</label></td>
								<td class="table-content" rowspan="3"><label
									class="totalDeduction">0</label></td>
							</tr>
							<tr>
								<td class="month"><input type="button"
									class="unselected-btn" value="7월" onclick="selectMonth('07');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="8월" onclick="selectMonth('08');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="9월" onclick="selectMonth('09');"></td>
							</tr>
							<tr>
								<td class="month"><input type="button"
									class="unselected-btn" value="10월" onclick="selectMonth('10');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="11월" onclick="selectMonth('11');"></td>
								<td class="month"><input type="button"
									class="unselected-btn" value="12월" onclick="selectMonth('12');"></td>
							</tr>
						</table>
						<input id="print-btn" type="button" value="명세서 출력">
					</form>
					<!-- <a id="insertDeduction" onclick="insertDeduction();">임시용 공제넣기</a> -->

					<!-- form 및 table 끝지점 -->

					<br> <br>
					<table class="table-fee">
						<caption>지급내역</caption>
						<thead>
							<tr>
								<td>기본급</td>
								<c:forEach var="prov" items="${ myProvision }">
									<input type="hidden" value="${ prov.provisionSeq }">
									<td><c:out value="${ prov.provisionName }" /></td>
								</c:forEach>
								<td>지급총액</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label id="standardPayment">0</label></td>
								<c:forEach var="prov" items="${ myProvision }">
									<input type="hidden" value="${ prov.provisionSeq }">
									<td>
										<%-- <c:if test="${ fn:substring(prov.payDate,0,4) eq 2020}"> --%>
											<c:out value="${ prov.amount }" />
										<%-- </c:if> --%>
									</td>
								</c:forEach>
								<td><label id="totalProvision">0</label></td>
							</tr>
						</tbody>
					</table>

					<br> <br>

					<table class="table-fee">
						<caption>공제내역</caption>
						<thead>
							<tr>
								<c:forEach var="deduc" items="${ myDeduction }">
									<input type="hidden" value="${ deduc.deductionSeq }">
									<td><c:out value="${ deduc.deductionName }" /></td>
								</c:forEach>
								<!-- <td>국민연금</td>
								<td>건강보험</td>
								<td>장기요양보험</td>
								<td>고용보험</td>
								<td>기타세1</td>
								<td>기타세2</td>
								<td>기타세3</td>
								<td>기타세4</td> -->
								<td>소득세</td>
								<td>지방소득세</td>
								<td>공제총액</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="deduc" items="${ myDeduction }">
									<input type="hidden" value="${ deduc.deductionSeq }">
									<td><c:out value="${ deduc.amount }" /></td>
								</c:forEach>
								<!-- <td><label id="nationalPension">0</label></td>
								<td><label id="healthInsurance">0</label></td>
								<td><label id="longTermCare">0</label></td>
								<td><label id="employmentInsurance">0</label></td> -->
								<td><label id="incomeTax">0</label></td>
								<td><label id="localIncomeTax">0</label></td>
								<td><label class="totalDeduction">0</label></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
				</div>
			</article>
		</section>
	</div>
	<script type="text/javascript">
		$('.unselected-btn').click(function() {
			$('.selected-btn').addClass('unselected-btn');
			$('.selected-btn').removeClass('selected-btn');
			$(this).removeClass('unselected-btn');
			$(this).addClass('selected-btn');
		});

		function selectMonth(month) {
			var year = $("select[name=yearSelect]").val();
			var selectDate = year + "-" + month;
			var totalCalc = 0;
			var totalProvision = 0;

			/* 기본금 start */

			var paymentHourArr = new Array();
			var payDateArr = new Array();
			var selectedPaymentHour = 0;
			var originalPay = 0;
			var date = 0;

			<c:forEach items="${mySalary}" var="salary">
			paymentHourArr.push("${salary.paymentHour}");
			payDateArr.push("${salary.payDate}");
			</c:forEach>

			for (var i = 0; i < paymentHourArr.length; i++) {
				//console.log(payDateArr[i].substring(0,7) + " & " + selectDate + " & " + paymentHourArr[i]);
				if (payDateArr[i].substring(0, 7) == selectDate) {

					selectedPaymentHour = paymentHourArr[i];
				}
			}


			var totalMoney = 0;
			<c:forEach var="prov" items="${ myProvision }">
				totalMoney += ${ prov.amount };
			</c:forEach>
			totalProvision += totalMoney;			

			//var selectedPaymentHourAfterCalc = 0;
			var selectedPaymentHourAfterCalc = 0;
			selectedPaymentHourAfterCalc = Math
					.round(365 / 12 * selectedPaymentHour * 8);
			
			totalProvision += selectedPaymentHourAfterCalc;
			
			selectedPaymentHourAfterCalc += totalMoney;
			totalCalc += selectedPaymentHourAfterCalc;
			
			selectedPaymentHourAfterCalc = commaMaker(selectedPaymentHourAfterCalc);
			$('#totalWage').text(selectedPaymentHourAfterCalc);
			$('#standardPayment').text(selectedPaymentHourAfterCalc);

			/* 기본금 end, 공제내역 start */

			var deductionType = new Array();
			var deductionPt = new Array();
			var deductionValue = new Array();
			var totalDeduction = 0;

			<c:forEach items="${myDeduction}" var="deduction">
			if (selectedPaymentHour == "${deduction.divSalary}") {
				deductionType.push("${deduction.deductionType}");
				deductionPt.push("${deduction.deductionPt}");
			}
			</c:forEach>

			//console.log(deductionType);
			//console.log(deductionPt);

			for (var i = 0; i < deductionType.length; i++) {
				totalDeduction += deductionPt[i] * selectedPaymentHour;
				deductionValue.push(deductionPt[i] * selectedPaymentHour);
			}

			//각 공제
			var nationalPension = 0; //국민연금
			var healthInsurance = 0; //건강보험
			var longTermCare = 0; //장기요양보험
			var employmentInsurance = 0; //고용보험
			var incomeTax = 0 //소득세
			var localIncomeTax = 0 //주민세 or 지방소득세

			for (var i = 0; i < deductionType.length; i++) {
				//console.log(payDateArr[i].substring(0,7) + " & " + selectDate + " & " + paymentHourArr[i]);
				//국민연금
				if (deductionType[i].substring(0, 4) == "국민연금") {
					nationalPension = deductionValue[i];
				} else if (deductionType[i].substring(0, 4) == "건강보험") {
					healthInsurance = deductionValue[i];
				} else if (deductionType[i].substring(0, 6) == "장기요양보험") {
					longTermCare = deductionValue[i];
				} else if (deductionType[i].substring(0, 4) == "고용보험") {
					employmentInsurance = deductionValue[i];
				}
			}

			//국민연금
			var nationalPensionAfterCalc = 0;
			nationalPensionAfterCalc = Math.round(nationalPension);
			nationalPensionAfterCalc = commaMaker(nationalPensionAfterCalc);

			$('#nationalPension').text(nationalPensionAfterCalc);

			//건강보험
			var healthInsuranceAfterCalc = 0;
			healthInsuranceAfterCalc = Math.round(healthInsurance);
			healthInsuranceAfterCalc = commaMaker(healthInsuranceAfterCalc);

			$('#healthInsurance').text(healthInsuranceAfterCalc);

			//장기요양보험
			var longTermCareAfterCalc = 0;
			longTermCareAfterCalc = Math.round(longTermCare);
			longTermCareAfterCalc = commaMaker(longTermCareAfterCalc);

			$('#longTermCare').text(longTermCareAfterCalc);

			//고용보험
			var employmentInsuranceAfterCalc = 0;
			employmentInsuranceAfterCalc = Math.round(employmentInsurance);
			employmentInsuranceAfterCalc = commaMaker(employmentInsuranceAfterCalc);

			$('#employmentInsurance').text(employmentInsuranceAfterCalc);

			//소득세
			var yearIncome = Math.round(365 * selectedPaymentHour * 8);
			if (yearIncome <= 12000000) {
				incomeTax = (yearIncome * 0.06) / 12;
			} else if (yearIncome > 12000000 && yearIncome <= 46000000) {
				incomeTax = (yearIncome * 0.15 - 1080000) / 12;
			} else if (yearIncome > 46000000 && yearIncome <= 88000000) {
				incomeTax = (yearIncome * 0.24 - 5220000) / 12;
			} else if (yearIncome > 88000000 && yearIncome <= 150000000) {
				incomeTax = (yearIncome * 0.35 - 14900000) / 12;
			} else if (yearIncome > 150000000 && yearIncome <= 300000000) {
				incomeTax = (yearIncome * 0.38 - 19400000) / 12;
			} else if (yearIncome > 300000000 && yearIncome <= 500000000) {
				incomeTax = (yearIncome * 0.40 - 25400000) / 12;
			} else if (yearIncome > 500000000) {
				incomeTax = (yearIncome * 0.42 - 35400000) / 12;
			}

			var incomeTaxAfterCalc = 0;
			incomeTaxAfterCalc = Math.round(incomeTax);
			totalDeduction += incomeTaxAfterCalc;
			incomeTaxAfterCalc = commaMaker(incomeTaxAfterCalc);

			$('#incomeTax').text(incomeTaxAfterCalc);

			//주민세
			var localIncomeTaxAfterCalc = 0;
			localIncomeTax = incomeTax / 10;

			if (localIncomeTax % 10 != 0) {
				localIncomeTax -= (localIncomeTax % 10);
			}

			localIncomeTaxAfterCalc = Math.round(localIncomeTax);
			totalDeduction += localIncomeTaxAfterCalc;
			localIncomeTaxAfterCalc = commaMaker(localIncomeTaxAfterCalc);

			$('#localIncomeTax').text(localIncomeTaxAfterCalc);

			//공제총액
			var totalDeductionAfterCalc = 0;
			totalDeductionAfterCalc = Math.round(totalDeduction);
			totalCalc -= totalDeductionAfterCalc;
			totalDeductionAfterCalc = commaMaker(totalDeductionAfterCalc);

			$('.totalDeduction').text(totalDeductionAfterCalc);

			/* 공제내역 end */

			//실지급액
			totalCalc = commaMaker(totalCalc);
			$('#totalCalc').text(totalCalc);

			totalProvision = commaMaker(totalProvision);
			$('#totalProvision').text(totalProvision);
		}

		function commaMaker(money) {
			return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function insertDeduction() {
			location.href = "insertDeductionTemplate.sal";
		}
	</script>
</body>
</html>
