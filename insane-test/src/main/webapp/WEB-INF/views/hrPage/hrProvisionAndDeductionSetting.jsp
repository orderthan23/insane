<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 지급공제 항목 설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
<style>
	thead{
		background-color:#2E2C8F;
	}
	
	th{
		color:white;
	}
	
	tr{
		border-bottom:1px solid lightgray;
	}
	td{
		font-size:14px;
		font-weight:normal;
	}
	
	section{
		overflow:hidden;
		width:1000px;
		height:auto;
		background:white;
		position:absolute;
		top:130px;
		left:300px;		
		height: 750px;
		border-radius:20px;
		overflow-y: auto;
	}
	
	.bluerect{
		/* display:inline-block;		
		width:15px;
		height:30px;
		background-color:#2E2C8F; */
		display:inline-block;		
		width:15px;
		height:30px;
		background-color:#2E2C8F;
		position:relative;
		top:5px;
	}	

	#pageTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	button{
	 	display:inline-block;
		color:white;
		width:30px;
		height:30px;
		top:81px;
		background-color:#2E2C8F;
		border-radius:30px;
	}
	
	 .sub-btn{
	 	display:inline-block;
		color:white;
		width:80px;
		height:25px;
		background-color:#2E2C8F;
		border-radius:5px;
	 }
	 
	 .setting-section{
	 	height: 500px;
	 	border: 1px solid lightgray;
	 	border-radius: 20px;
	 	overflow-y: auto; 
	 }
</style>
</head>
<body>
		<c:if test="${!fn:contains(auth,'PD1') }">
			<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
		</c:if>
	
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp"/>
	
		<aside>
            <div id="profileZone">
            <c:if test="${empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
            </c:if>
            <c:if test="${!empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
            </c:if><br><br>
            <p style="font-size: 17px;">${companyInfo.companyName }</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">${companyInfo.businessBigType}</p>
            </div>
            <br> <br>
            <div id="sideMenu" align="center">
                <p style="font-size:20px;">보상 관리</p>
                <br><br>
                <a style=" text-decoration:none; color:white;" href="selectEmpListForSalary.em">급여 관리</a>
                <br>
                <a style="text-decoration:none; color:white;" href="hrInfoManagementList.em">퇴직금 관리</a>
                <br>
                <a style="background:#524FE3; text-decoration:none; color:white;" href="selectProvisionAndDeductionSetting.mp">지급공제사항</a>
                <br>
                <a style=" text-decoration:none; color:white;" href="hrSalarySetting.mp">기본급여설정</a>
                <br>
            </div>
        </aside>
	<section>
		<div class="bluerect"></div><span id="pageTitle">지급 공제 사항 설정</span><br><br>
		<hr>
		<br>
		<div class="setting-section" align="center">
			<form id="provision" action="insertProvisionSetting.mp" method="post">
				<div align="left" style="width: 95%;">
					<div class="bluerect"></div><span style="margin-left: 20px;">지급 사항 설정</span>
					<button type="button" id="add-provision">+</button>
					<button type="button" id="delete-pro-raw">-</button>
				</div>
				<br>
				<div align="right" style="width: 95%;">
					<c:if test="${fn:contains(auth,'PD2') }">
					<button class="sub-btn" type="button" id="save-prov">저장 하기</button>
					<button class="sub-btn" type="button" id="del-prov">삭제 하기</button>
					</c:if>
				</div>
				<table id="provisionTypeTable" style="width:95%;">
					<thead>	
						<tr>
							<th width="3%" height="30px;"><input type="checkbox"></th>
							<th width="20%">지급 항목 명</th>
							<th width="6%">구분</th>
							<th width="12%">유형</th>
							<th width="20%">지급 한도</th>
							<th width="5%">연금</th>
							<th width="5%">건강</th>
							<th width="5%">고용</th>
							<th width="5%">소득</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="p" items="${ list.provisionSettingList }">
							<tr>
								<td><input name="del-prov-check" type="checkbox"><input type="hidden" value="${ p.provisionSeq }"></td>
								<td><label><c:out value="${ p.provisionName }"/></label></td>
								<td>
								<c:if test="${ p.taxYn eq 'Y' }">
									<c:out value="과세"/>
								</c:if>
								<c:if test="${ p.taxYn eq 'N' }">
									<c:out value="비과세"/>
								</c:if>
								</td>
								<td><label><c:out value="${ p.provisionType }"/></label></td>
								<td><label><c:out value="${ p.provisionLimit }"/></label></td>
								<td><label><c:out value="${ p.npnYn }"/></label></td>
								<td><label><c:out value="${ p.hlthinsYn }"/></label></td>
								<td><label><c:out value="${ p.empInsuranceYn }"/></label></td>
								<td><label><c:out value="${ p.incomeTaxYn }"/></label></td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br>
		<div class="setting-section" align="center">
			<form id="deduction" action="insertDeductionSetting.mp" method="post">
				<div align="left" style="width: 95%;">
					<div class="bluerect"></div><span style="margin-left: 20px;">공제 사항 설정</span>
					<button type="button" id="add-deduction">+</button>
					<button type="button" id="delete-ded-raw">-</button>
				</div>
				<br>
				<div align="right" style="width: 95%;">
					<c:if test="${fn:contains(auth,'PD2') }">
					<button class="sub-btn" type="button" id="save-dedu">저장 하기</button>
					<button class="sub-btn" type="button" id="del-dedu">삭제 하기</button>
					</c:if>
				</div>
				<table id="deductionTypeTable" style="width:95%;">
					<thead>	
						<tr>
							<th width="3%" height="30px;"><input type="checkbox"></th>
							<th width="20%">공제 항목 명</th>
							<th width="20%">공제 소득 유형</th>
							<th width="20%">구분 월 급여액</th>
							<th width="10%">공제 항목별 요율</th>
							<th width="18%">비고</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="d" items="${ list.deductionSettingList }">
							<tr>
								<c:if test="${ d.autoRegist eq 'Y' }">
									<td></td>
								</c:if>
								<c:if test="${ d.autoRegist eq 'N' }">
									<td><input name="del-dedu-check" type="checkbox"><input type="hidden" value="${ d.deductionSeq }"></td>
								</c:if>
								<td><label><c:out value="${ d.deductionName }"/></label></td>
								<td><label><c:out value="${ d.deductionType }"/></label></td>
								<td><label><c:out value="${ d.divSalary }"/></label></td>
								<td><label><c:out value="${ d.deductionPt }"/></label></td>
								<td><label><c:out value="${ d.remark }"/></label></td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</section>
	<script type="text/javascript">	

		var provi = 0;
		var dedui = 0;
		
		$("#add-provision").click(function(){
			$("#provisionTypeTable > tbody:last").append(
				"<tr><td></td>"+
					"<td><input name=provisionSettingList[" + provi + "].provisionName type=text style=width:90%></td>"+
					"<td>"+
						"<select name=provisionSettingList[" + provi + "].taxYn>"+
							"<option value=Y selected>과세</option>"+
							"<option value=N>비과세</option>"+
						"</select>"+
					"</td>"+
					"<td><input name=provisionSettingList[" + provi + "].provisionType type=text style=width:90%></td>"+
					"<td><input name=provisionSettingList[" + provi + "].provisionLimit type=text style=width:90%></td>"+
					"<td>"+
						"<select name=provisionSettingList[" + provi + "].npnYn>"+
							"<option value=Y selected>Y</option>"+
							"<option value=N>N</option>"+
						"</select>"+
					"</td>"+
					"<td>"+
						"<select name=provisionSettingList[" + provi + "].hlthinsYn>"+
							"<option value=Y selected>Y</option>"+
							"<option value=N>N</option>"+
						"</select>"+
					"</td>"+
					"<td>"+
						"<select name=provisionSettingList[" + provi + "].empInsuranceYn>"+
							"<option value=Y selected>Y</option>"+
							"<option value=N>N</option>"+
						"</select>"+
					"</td>"+
					"<td>"+
						"<select name=provisionSettingList[" + provi + "].incomeTaxYn>"+
							"<option value=Y selected>Y</option>"+
							"<option value=N>N</option>"+
						"</select>"+
					"</td>"+
				"</tr>");
			provi++;
		});
		
		$("#delete-pro-raw").click(function(){
			if(provi > 0){
				$("#provisionTypeTable > tbody > tr:last").remove();
				provi--;
			} else {
				
			}
		});
		
		$("#save-prov").click(function(){
			$("#provision").submit();
		});
		
		$("#del-prov").click(function(){
			
			var delProvSeq = new Array();
			$("input:checkbox[name='del-prov-check']").each(function(){
				if($(this).is(":checked")==true){
					var check = $(this).siblings().val();
					delProvSeq.push($(this).siblings().val());
				} else {
					
				}
				
			})
		
			location.href="<%=request.getContextPath()%>/updateProvision.mp?delProvSeq=" + delProvSeq;
		});
		
		$("#add-deduction").click(function(){
			$("#deductionTypeTable > tbody:last").append(
				"<tr><td></td>"+
					"<td><input name=deductionSettingList[" + dedui + "].deductionName type=text style=width:90%></td>"+
					"<td><input name=deductionSettingList[" + dedui + "].deductionType type=text style=width:90%></td>"+
					"<td><input name=deductionSettingList[" + dedui + "].divSalary type=text style=width:90%></td>"+
					"<td><input name=deductionSettingList[" + dedui + "].deductionPt type=text style=width:90%></td>"+
					"<td><input name=deductionSettingList[" + dedui + "].remark type=text style=width:90%></td>"+
				"</tr>");
			dedui++;
		});
		
		$("#delete-ded-raw").click(function(){
			if(dedui > 0){
				$("#deductionTypeTable > tbody > tr:last").remove();
				dedui--;
			} else {
				
			}
		});
		
		$("#save-dedu").click(function(){
			$("#deduction").submit();
		});
		
		$("#del-dedu").click(function(){
			
			var delDeduSeq = new Array();
			$("input:checkbox[name='del-dedu-check']").each(function(){
				if($(this).is(":checked")==true){
					var check = $(this).siblings().val();
					delDeduSeq.push($(this).siblings().val());
				} else {
					
				}
				
			})
			location.href="<%=request.getContextPath()%>/updateDeduction.mp?delDeduSeq=" + delDeduSeq;
		
		});
	</script>
</body>
</html>