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
	 width :100%;
	}
	article{
			overflow:hidden;
		width:1000px;
		height:750px;
		background:white;
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
			<form action="insertVacationSetting.att" method="post">
				<div align="left" style="width: 95%;">
					<div class="bluerect"></div><span style="margin-left: 20px; font-size:20px;">휴가 사항 설정</span>
					<button type="button" id="add-vacation">+</button>
					<button type="button" id="delete">-</button>
				</div>
				<br>
				<div align="right" style="width: 95%;">
					<button class="sub-btn" type="button" id="save">저장 하기</button>
					<button class="sub-btn" type="button" id="del-vac">삭제 하기</button>
				</div>
				<table id="vacationTypeTable" style="width:95%;">
					<thead>	
						<tr>
							<th width="5%" height="30px;"><input type="checkbox"></th>
							<th width="30%">휴가 명</th>
							<th width="10%">유무급 구분</th>
							<th width="20%">휴가 일수</th>
							<th width="20%">발생 빈도(월)</th>
							<th width="20%">휴가 기준 일자 설정</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="v" items="${ vacationSettingList }" varStatus="status">
							<tr>
								<td><input name="del-check" type="checkbox"><input type="hidden" value="${ v.vacationSeq }"></td>
								<td><label><c:out value="${ v.vacationName }"/></label></td>
								<td>
								<c:if test="${ v.paidUnpaid eq 'pay' }">
									<c:out value="유급"/>
								</c:if>
								<c:if test="${ v.paidUnpaid eq 'unpay' }">
									<c:out value="무급"/>
								</c:if>
								</td>
								<td><label><c:out value="${ v.vacationAmount }"/></label></td>
								<td><label><c:out value="${ v.vacationOccurUnit }"/></label></td>
								<td>
								<c:if test="${ v.criteriaType eq 'enr' }">
									<c:out value="입사일자 기준"/>
								</c:if>
								<c:if test="${ v.criteriaType eq 'fin' }">
									<c:out value="회계년도 기준"/>
								</c:if>
								</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		</article>
	</section>
	</div>
	<script type="text/javascript">	

		var i = 0;
		
		$("#add-vacation").click(function(){
			$("#vacationTypeTable > tbody:last").append(
				"<tr><td></td>"+
					"<td><input class=vn name=vacationSettingList[" + i + "].vacationName type=text style=width:90%></td>"+
					"<td>"+
						"<select name=vacationSettingList[" + i + "].paidUnpaid>"+
							"<option value=pay selected>유급</option>"+
							"<option value=unpay>무급</option>"+
						"</select>"+
					"</td>"+
					"<td><input class=va name=vacationSettingList[" + i + "].vacationAmount type=text></td>"+
					"<td><input name=vacationSettingList[" + i + "].vacationOccurUnit type=text></td>"+
					"<td>"+
						"<select class=vo name=vacationSettingList[" + i + "].criteriaType>"+
							"<option value=enr>입사일자 기준</option>"+
							"<option value=fin selected>회계년도 기준</option>"+
						"</select>"+
					"</td>"+
				"</tr>");
			i++;
		});
		
		$("#delete").click(function(){
			if(i > 0){
				$("#vacationTypeTable > tbody > tr:last").remove();
				i--;
			} else {
				
			}
		});
		
		$("#save").click(function(){
			/* var vn = $(".vn");
			var va = $(".va");
			var vo = $(".vo");
			
			if(typeof vn == "undefined" || typeof vn.valueOf() != "string" || vn.length == 0 || typeof va == "undefined" || typeof va.valueOf() != "number" || va.length == 0 || typeof vo == "undefined" || typeof vo.valueOf() != "number" || vo.length == 0){
				alert("값을 잘못 입력하셨습니다."); 
			} else {
				$("form").submit();
			} */
			$("form").submit();
		});
		
		$("#del-vac").click(function(){
			
			var delVacSeq = new Array();
			$("input:checkbox[name='del-check']").each(function(){
				if($(this).is(":checked")==true){
					var check = $(this).siblings().val();
					delVacSeq.push($(this).siblings().val());
				} else {
					
				}
				
			})
			/* console.log(delVacSeq); */
			location.href="<%=request.getContextPath()%>/updateVacation.att?delVacSeq=" + delVacSeq;
		});
	</script>
</body>
</html>