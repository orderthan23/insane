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
		overflow:hidden;
		width:70%;
		height:auto;
		background:white;
		position:absolute;
		top:100px;
		left:300px;		
		border-radius:20px;
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
	 	height: 200px;
	 	border: 1px solid lightgray;
	 	border-radius: 20px;
	 	overflow-y: auto; 
	 }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/adminSetting/adminNav.jsp"/>
	
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/adminSetting/adminAside.jsp" />
	<section>
		<div class="bluerect"></div><span id="pageTitle">휴일 설정</span><br><br>
		<hr>
		<br>
		<div id="calendarSection"><jsp:include page="/WEB-INF/views/common/calendar.jsp"/></div>
		<br>
		<div class="setting-section" align="center">
			<form id="holiday" action="insertHolidaySetting.att" method="post">
				<div align="left" style="width: 95%;">
					<div class="bluerect"></div><span style="margin-left: 20px;">휴일 설정</span>
					<button type="button" id="add-hol">+</button>
				</div>
				<div align="right" style="width: 95%;">
					<button class="sub-btn" type="button" id="save-hol">저장 하기</button>
					<button class="sub-btn" type="button" id="del-hol">삭제 하기</button>
				</div>
				<table id="holidayTable" style="width:95%;">
					<thead>	
						<tr>
							<th width="3%"><input type="checkbox"></th>				
							<th width="30%">휴일 명</th>
							<th width="18%">휴일 종류</th>
							<th width="15%">휴일 일자</th>
							<th width="15%">비고</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="h" items="${ holidayList }">
							<tr>
								<td><input name="del-hol-check" type="checkbox"><input type="hidden" value="${ h.holidaySeq }"></td>
								<td><label><c:out value="${ h.holidayName }"/></label></td>
								<td>
								<c:if test="${ h.holidayType eq 'law' }">
									<c:out value="법정 공휴일"/>
								</c:if>
								<c:if test="${ h.holidayType eq 'repl' }">
									<c:out value="대체 공휴일"/>
								</c:if>
								<c:if test="${ h.holidayType eq 'temp' }">
									<c:out value="임시 공휴일"/>
								</c:if>
								</td>
								<td><label><c:out value="${ h.holidayDate }"/></label></td>
								<td><label><c:out value="${ h.remark }"/></label></td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
		<br>
	</section>
	</div>
	<script type="text/javascript">	

		var holi = 0;
		
		$("#add-hol").click(function(){
			if(holi < 1){
				$("#holidayTable > tbody:last").append(
					"<tr><td></td>"+
						"<td><input name=holidayName type=text style=width:90%></td>"+
						"<td>"+
							"<select name=holidayType>"+
								"<option value=law>법정 공휴일</option>"+
								"<option value=repl>대체 공휴일</option>"+
								"<option value=temp>임시 공휴일</option>"+
							"</select>"+
						"</td>"+
						"<td><input id=holidayDate name=holidayDate type=text style=width:90% readonly value=" + keyValue + "></td>"+
						"<td><input name=remark type=text style=width:90%></td>"+
					"</tr>");
				holi++;
			} else {
				alert("하나의 휴일만 입력가능합니다.");
			}
		});
		
		$("#calendarSection").click(function(){
			$("#holidayDate").val(keyValue);
		})
		
		$("#save-hol").click(function(){
			$("#holiday").submit();
		});
		
		$("#del-hol").click(function(){
			
			var delHolSeq = new Array();
			$("input:checkbox[name='del-hol-check']").each(function(){
				if($(this).is(":checked")==true){
					var check = $(this).siblings().val();
					delHolSeq.push($(this).siblings().val());
				} else {
					
				}
				
			})
			location.href="<%=request.getContextPath()%>/deleteHoliday.att?delHolSeq=" + delHolSeq;
		});
		
	</script>
</body>
</html>