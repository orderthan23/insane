<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#income-tax-detail-table {
	width: 100%;
	background: white;
	border: 1px solid gray;
	text-align: center;
}

.thead-of-table {
	background: #2E2C8F;
	color: white;
	height: 30px;
}

#income-tax-detail-table thead tr td:nth-child(3) {
	width: 50%;
}

#income-tax-detail-table tbody tr td {
	border: 1px solid lightgray;
}

.table-field {
	background: #F2F7FF;
	border: none;
	height: 30px;
}

.nothing {
	background: lightgray;
}

/*

#income-tax-detail-table tbody tr td:nth-child(4) {
	background: #F2F7FF;
	border: none;
}

#income-tax-detail-table tfoot tr td {
	background: #2E2C8F;
	color: white;
	height: 30px;
}
 */
</style>
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 100%; height: 600px; overflow: scroll; overflow-x: hidden; padding: 1px; border: 0; border-style: solid; border-color: #EBEBEB">
		<table id="income-tax-detail-table">
			<thead>
				<tr class="thead-of-table">
					<td colspan="3">과세내역</td>
					<td colspan="2">금액</td>
					<td colspan="2">산출산식</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 3%;" rowspan="15" class="table-field">2 0 1
						6 년 이 전</td>
					<td colspan="2" class="table-field">퇴직급여액</td>
					<td colspan="2">24,260,342</td>
					<td colspan="2">퇴직급여 과세 소득</td>
				</tr>
				<tr>
					<td rowspan="6" class="table-field">퇴직소득공제</td>
					<td class="table-field">소득공제</td>
					<td colspan="2">9,704,136</td>
					<td colspan="2">2011년 귀속부터 퇴직급여액의 40%</td>
				</tr>
				<tr>
					<td rowspan="4" class="table-field">근속연수별공제</td>
					<td colspan="2"></td>
					<td>5년 이하</td>
					<td>30만 * 근속연수</td>
				</tr>
				<tr>
					<td colspan="2">2,500,000</td>
					<td>10년 이하</td>
					<td>150만 * { 50만 * (근속연수 - 5) }</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td>20년 이하</td>
					<td>400만 * { 80만 * (근속연수 - 10) }</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td>20년 초과</td>
					<td>1200만 * { 120만 * (근속연수 - 20) }</td>
				</tr>
				<tr>
					<td class="table-field">계</td>
					<td colspan="2">12,204,136</td>
					<td colspan="2">소득공제 ( ⓐ ) + 근속연수별공제 ( ⓑ )</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">과세표준</td>
					<td colspan="2">12,056,206</td>
					<td colspan="2">퇴직급여액 - 퇴직소득공제</td>
				</tr>
				<tr class="thead-of-table">
					<td colspan="2">과세내역</td>
					<td>2012.12.31 이전</td>
					<td>2013.03.01 이후</td>
					<td>합계</td>
					<td>산출산식</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">과세표준안분</td>
					<td>3,444,630</td>
					<td>8,611,576</td>
					<td>12,056,206</td>
					<td class="table-field">과세표준 * 각 근속연수 / 정산근속연수</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">연평균과세표준</td>
					<td>1,722,315</td>
					<td>1,722,315</td>
					<td>1,722,315</td>
					<td class="table-field">과세표준안분 / 각 근속연수</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">환산과세표준</td>
					<td class="nothing"></td>
					<td>8,611,575</td>
					<td>8,611,575</td>
					<td class="table-field">연평균과세표준 * 5배</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">환산산출세액</td>
					<td class="nothing"></td>
					<td>516,694</td>
					<td>516,694</td>
					<td class="table-field">환산과세표준 * 세율</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">연평균산출세액</td>
					<td>103,338</td>
					<td>103,338</td>
					<td>206,676</td>
					<td class="table-field">2012.12.31 이전 : 연평균과세표준 * 세율<br>
						2013.1.1 이후 : 환산산출세액 / 5배
					</td>
				</tr>
				<tr>
					<td colspan="2" class="table-field">산출세액</td>
					<td>206,676</td>
					<td>516,690</td>
					<td>723,366</td>
					<td class="table-field">연평균산출액 * 각 근속연수</td>
				</tr>

				<!-- 이전/이후 구분 -->

				<tr class="thead-of-table">
					<td style="width: 3%; color: black;" rowspan="25"
						class="table-field">2 0 1 6 년 이 후</td>
					<td colspan="2">과세내역</td>
					<td colspan="2">금액</td>
					<td colspan="2">산출산식</td>
				</tr>
				<tr>
					<td rowspan="13" class="table-field">퇴직소득 과세표준 계산</td>
					<td class="table-field">정산퇴직소득</td>
					<td colspan="2">19,260,342</td>
					<td colspan="2" class="table-field">퇴직급여 과세 소득</td>
				</tr>
				<tr>
					<td rowspan="4" class="table-field">근속연수공제</td>
					<td colspan="2">2,500,000</td>
					<td class="table-field">5년 이하</td>
					<td class="table-field">30만 * 근속연수</td>
				</tr>
				<tr>
					<td colspan="2">2,500,000</td>
					<td class="table-field">10년 이하</td>
					<td class="table-field">150만 * { 50만 * (근속연수 - 5) }</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">20년 이하</td>
					<td class="table-field">400만 * { 80만 * (근속연수 - 10) }</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">20년 초과</td>
					<td class="table-field">1200만 * { 120만 * (근속연수 - 20) }</td>
				</tr>
				<tr>
					<td class="table-field">계</td>
					<td colspan="2">21,760,342</td>
					<td colspan="2" class="table-field">정산퇴직소득 - 근속연수공제</td>
				</tr>
				<tr>
					<td class="table-field">환산 급여</td>
					<td colspan="2">37,303,443</td>
					<td colspan="2" class="table-field">정산퇴직소득 - 근속연수공제 * 12배 /
						정산근속연수</td>
				</tr>
				<tr>
					<td rowspan="5" class="table-field">환산급여별공제</td>
					<td colspan="2"></td>
					<td class="table-field">8백만원 이하</td>
					<td class="table-field">환산급여 * 100%</td>
				</tr>
				<tr>
					<td colspan="2">25,502,065</td>
					<td class="table-field">7천만원 이하</td>
					<td class="table-field">8백만원 + (8백만원 초과분의 60%)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">1억원 이하</td>
					<td class="table-field">7천만원 + (7천만원 초과분의 55%)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">3억원 이하</td>
					<td class="table-field">6천170만원 + (1억원 초과분의 45%)</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">3억원 초과</td>
					<td class="table-field">1억5천170만원 + (3억원 초과분의 35%)</td>
				</tr>
				<tr>
					<td class="table-field">환산 급여</td>
					<td colspan="2">11,801,378</td>
					<td colspan="2" class="table-field">환산급여 - 환산급여별공제</td>
				</tr>

				<tr>
					<td rowspan="9" class="table-field"></td>
					<td rowspan="6" class="table-field">환산세출세액</td>
					<td colspan="2">703,282</td>
					<td class="table-field">1천2백만원 이하</td>
					<td class="table-field">6%</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">4천6백만원 이하</td>
					<td class="table-field">72만원 + (퇴직소득과세표준 - 1200만원) * 15%</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">8천8백만원 이하</td>
					<td class="table-field">582만원 + (퇴직소득과세표준 - 4600만원) * 24%</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">1억5천만원 이하</td>
					<td class="table-field">1590만원 + (퇴직소득과세표준 - 8800만원) * 35%</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">5억원 이하</td>
					<td class="table-field">3760만원 + (퇴직소득과세표준 - 1억5천만원) * 38%</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td class="table-field">5억원 초과</td>
					<td class="table-field">1억7060만원 + (퇴직소득과세표준 - 5억) * 40%</td>
				</tr>
				<tr>
					<td class="table-field">산출 세액</td>
					<td colspan="2">410,247</td>
					<td colspan="2" class="table-field">환산산출세액 * 정상근속연수 / 12배</td>
				</tr>
				<tr>
					<td class="table-field">기납부 세액</td>
					<td colspan="2">410,247</td>
					<td colspan="2" class="table-field">환산산출세액 * 정상근속연수 / 12배</td>
				</tr>
				<tr>
					<td class="table-field">신고대상세액</td>
					<td colspan="2">590,113</td>
					<td colspan="2" class="table-field">특례적용 세액 - 기납부</td>
				</tr>
				
			</tbody>

			<tfoot>
			</tfoot>
		</table>
	</div>
</body>
</html>