<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE - 관리자설정</title>
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
		width : 100%;
		
	}
	article{
		width:95%;
		background:white;
		overflow-y: auto;
		margin-right: auto;
		margin-left: auto;
		height: 750px;
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
	 

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/adminSetting/adminNav.jsp"/>
	
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/adminSetting/adminAside.jsp" />
	<section>
		<article>
		
	
		<hr>
		<br>
		<div class="setting-section" align="center">
			<form id="salary" action="insertSalarySetting.rwd" method="post">
				<div align="left" style="width: 95%;">
					<div class="bluerect"></div><span style="margin-left: 20px; font-size: 20px;">기본 급여 설정</span>
					<button type="button" id="add-salary">+</button>
					<button type="button" id="delete-sal-raw">-</button>
				</div>
				<br>
				<div align="right" style="width: 95%;">
					<button class="sub-btn" type="button" id="save-sal">저장 하기</button>
					<button class="sub-btn" type="button" id="del-sal">삭제 하기</button>
				</div>
				<table id="salaryTypeTable" style="width:95%;">
					<thead>	
						<tr>
							<th width="3%"><input type="checkbox"></th>				
							<th width="12%">직급</th>
							<th width="18%">급여 명</th>
							<th width="15%">기본 급여(시)</th>
							<th width="15%">호봉 별 추가 급여</th>
							<th width="8%">급여 형태</th>
							<th width="10%">비고</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="s" items="${ list.salarySettingList }">
							<tr>
								<td><input name="del-sal-check" type="checkbox"><input type="hidden" value="${ s.salarySeq }"></td>
								<td><label><c:out value="${ s.positionName }"/></label></td>
								<td><label><c:out value="${ s.salaryCodeName }"/></label></td>
								<td><label><c:out value="${ s.paymentHour }"/></label></td>
								<td><label><c:out value="${ s.payStepPayment }"/></label></td>
								<td>
								<c:if test="${ s.payType eq 'hour' }">
									<c:out value="시급"/>
								</c:if>
								<c:if test="${ s.payType eq 'week' }">
									<c:out value="주급"/>
								</c:if>
								<c:if test="${ s.payType eq 'month' }">
									<c:out value="월급"/>
								</c:if>
								</td>
								<td><label><c:out value="${ s.remark }"/></label></td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br>
		</article>
	</section>
	</div>
	<script type="text/javascript">	

		var sali = 0;
		var positionList = new Array();
		/* positionList.push({seq:1, name:"인사과"},{seq:2, name:"총무과"}); */
		
		<c:forEach items="${ list.positionList }" var="p">
			positionList.push({seq:"${p.positionSeq}", name:"${p.positionName}"});
		</c:forEach>
		
		var option = new Array();
		
		if(positionList.length != 0){
			for(var i = 0; i < positionList.length; i++){
				option.push("<option value=" + positionList[i].seq + " selected>" + positionList[i].name + "</option>");
			}
		}
		
		$("#add-salary").click(function(){
			
			if(positionList.length == 0){
				alert("설정된 직급이 없습니다. 직급을 먼저 입력해 주세요.");
			} else {
				$("#salaryTypeTable > tbody:last").append(
					"<tr><td></td>"+
						"<td>"+
							"<select name=salarySettingList[" + sali + "].positionSeq>"+
							option + 
							"</select>"+
						"</td>"+
						"<td><input name=salarySettingList[" + sali + "].salaryCodeName type=text style=width:90%></td>"+
						"<td><input name=salarySettingList[" + sali + "].paymentHour type=text style=width:90%></td>"+
						"<td><input name=salarySettingList[" + sali + "].payStepPayment type=text style=width:90%></td>"+
						"<td>"+
						"<select name=salarySettingList[" + sali + "].payType>"+
							"<option value=hour>시급</option>"+
							"<option value=week>주급</option>"+
							"<option value=month selected>월급</option>"+
						"</select>"+
					"</td>"+
						"<td><input name=salarySettingList[" + sali + "].remark type=text style=width:90%></td>"+
					"</tr>");
				sali++;
			}
		});
		
		$("#delete-sal-raw").click(function(){
			if(sali > 0){
				$("#salaryTypeTable > tbody > tr:last").remove();
				sali--;
			} else {
				
			}
		});
		
		$("#save-sal").click(function(){
			$("#salary").submit();
		});
		
		$("#del-sal").click(function(){
			
			var delSalSeq = new Array();
			$("input:checkbox[name='del-sal-check']").each(function(){
				if($(this).is(":checked")==true){
					var check = $(this).siblings().val();
					delSalSeq.push($(this).siblings().val());
				} else {
					
				}
				
			})
			/* console.log(delSalSeq); */
			location.href="<%=request.getContextPath()%>/updateSalarySetting.rwd?delSalSeq=" + delSalSeq;
		});
	</script>
</body>
</html>