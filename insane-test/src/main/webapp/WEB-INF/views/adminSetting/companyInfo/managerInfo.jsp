<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<style>
article {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	height : 90%;
}

section {
	width: 100%;
	height: 100%;
}

#blueBox {
	width: 10px;
	height: 20px;
	background: #2E2C8F;
	display: inline-block;
	margin: 0 auto;
	margin-left : 15px;
}

#articleTitle {
	display: inline-block;
	font-size: 20px;
	font-weight: bolder;
	margin-bottom: 10px;
	
}

.tableTitleBox {
	display: inline-block;
	width: 140px;
	height: 30px;
	font-size: 15px;
	font-weight: bolder;
	background: #F3F3F3;
	margin-right: 30px;
	margin-bottom: 20px;
	margin-left : 15px;
}

.tableTitleBox p {
	line-height: 30px;
	text-align: center;
	font-size: 15px;
	margin: 0;
}

.tableInputBox {
	display: inline-block;
	height: 30px;
	margin-bottom: 20px;
	border: 1px solid #f3f3f3;
}

.tableInputBox input {
	margin-left: 15px;
	margin-right: 15px;
	border : 1px solid #c4c4c4;
	margin-top : 4px;
	
	
}

.tableInputBox select{
	margin-top : 5px;
	border: 1px solid #c4c4c4;
	
}

.company-btn {
	width: 20px;
	height: 20px;
	background-image:
		url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-repeat: no-repeat;
	background-size: 100%;
	border-radius: 5px;
	border: 0px;
	cursor: pointer;
	margin : 0px;
	
	
}
#saveZone{
	width: 100%;
}

#saveButton{
	width: 105px;
	height: 34px;
	border-radius: 10px;
	background: #2E2C8F;
	color : white;
	font-weight : bolder;
	font-size : 15px;
}

#imageZone{
	width : 118px;
	height : 135px;
	background : #EDEDED;
}

#companyLogoUpload{
	visibility: hidden;
}

</style>
<title>Smart HR Solution INSANE</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminSetting/adminNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/adminSetting/adminAside.jsp" />

		<section>
			<article id="basicInfoBox" style="overflow-y: auto ;">
				<br><br>
			<div id="blueBox"></div>
				&nbsp;&nbsp;
				<p id="articleTitle">회사 담당자</p>
				<br>
				<hr style="border-width: 2px;">
				<br>
				<br>
				<form id="managerInfoForm" method="post" action="updateManagerInfo.cp">
					<table>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>회사 담당자</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" style="width: 150px;" name="adminName" value="${ managerInfo.adminName }">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>담당자 부서</p>
								</div>

							</td>


							<td colspan="2">
								<div class="tableInputBox">
									<input type="text" style=" width: 150px;" readonly="readonly" id="managerDept" name=adminDepartment value="${managerInfo.adminDepartment }"> 
								</div>
								<input type="button" class="company-btn" style=" vertical-align: middle;" onclick="popDept();">
							</td>
						</tr>


						<tr>
							<td>
								<div class="tableTitleBox">
									<p>담당자 전화번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="phone" value="${fn:split(managerInfo.adminPhone,'-')}"/>
									<input type="text" style="width: 100px;" name="adminPhone1" value="${phone[0]}">								
									<input type="text" style="width: 100px;" name="adminPhone2" value="${phone[1]}">								
									<input type="text" style="width: 100px;" name="adminPhone3" value="${phone[2]}">								
										
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>담당자 이메일</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" style="width: 300px;" name="adminEmail" value="${managerInfo.adminEmail }">								
														
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>공인 전자주소</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" style="width: 300px;" name="adminAuthorizedEmail" value="${ managerInfo.adminAuthorizedEmail }">								
														
								</div>
							</td>
						</tr>

						
					</table>
					<br>
					<div id="saveZone" align="center">
						<button type="button" id="saveButton" onclick="validateInfo();">저장하기</button>
					</div>
					<br><br>	
						
				</form>



			</article>
			<form name="pop">
					<input type="hidden"  name="keyword" value="dept">
				</form>

		</section>
	</div>
	<script>
		function popDept(){
			var popup = document.pop;
			 window.open('','dept','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
			 popup.action = 'popupZone.jsp';
			 pop.target= 'dept';
			 pop.submit();
		}
		
		function validateInfo(){
			var queryString = $('#managerInfoForm').serialize();
			 $.ajax({
				url : "validateMangerInfo.cp",
				type: "post",
				data: {
					queryString : queryString		
				},
				success : function(data){
					validateResult = data;
					console.log("validateResult :"+ validateResult);
					switch(validateResult){
					case "1" : $('#managerInfoForm').submit(); break;
					case "2" : alert("담당자 전화번호 형식이 올바르지 않습니다."); break;
					case "3" : alert("담당자 이메일의 형식이 올바르지 않습니다."); break;
					case "4" : alert("공인 전자주소의 형식이 올바르지 않습니다."); break;
					
					}
					
					
				},
				error : function(){
					console.log("ERROR...");
				}
			}) 
		}
	</script>



</body>
</html>
