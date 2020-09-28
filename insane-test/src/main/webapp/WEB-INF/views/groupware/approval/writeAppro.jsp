<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 전자결재</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
</head>
<style>
section {
	width: 100%;
	height: 100%;
}

article {
	width: 90%;
	height: 700px;
	margin-left: auto;
	margin-right: auto;
}

#headTitles {
	display: table;
	width: 20%;
	margin-left: 15px;
}

#blueSquare {
	width: 10px;
	height: 10px;
	background: #2E2C8F;
	display: table-cell;
}

#titles {
	display: table-cell;
	margin-left: 15px;
	font-size: 18px;
	font-weight: bolder;
}

.choiceType {
	display: table;
	width: 40%;
}

#searchButton {
	display: table-cell;
	vertical-align: middle;
	width: 20px;
	height: 20px;
	border-radius: 5px;
	border: none;
	outline: none;
	background-image:
		url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-size: 100%;
	background-repeat: no-repeat;
	margin-left: 20px;
}
textarea{
 border: 1px solid lightgray;	
}
textarea:focus,
textarea:hover,
textarea:active{
	border: 1px solid lightgray;	
	outline: none;
}


#contentTable tr td {
	height: 40px;
	border-bottom: 1px solid lightgray;
}
#submitBtn{
	border-radius: 5px;
	background: #2E2C8F;
	border: none;
	color: white;
	font-family: 'nanumSquare';
	font-weight: normal;
	height: 25px;
}
aside a{
	font-weight: normal;
	
}
#sideMenu2 a:hover,
#write:hover{
  font-weight: bolder;
}
#write{
	color: white;
	font-weight: bolder;
	font-size: 15px;
	padding:3px;
	text-align: center;"
}
#sideMenu2 a{
	text-decoration:none;
}
#sideMenu2{
	margin-left: 10px;
	
}
select[name="documentType"]{
	
	width: 150px;

}
#sampleZone{
	width: 90%;
	margin-right: auto;
	margin-left: auto;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

	<div id="contentWrapper">
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
        <br><br>
     
         <div style="width: 100%;" align="center">
            <a style="font-size: 20px; color:white;">전자 결재</a>
            </div>
           
         
         
       
         <div id="sideMenu2">
         	
         	<a href="writeApproval.app"  id="write">결재 작성&nbsp;  <span class="iconify" data-inline="false" data-icon="bi:pencil-square" style="font-size: 20px;  vertical-align: middle;"></span></a>
         	<br>
            <a href="waitAppro.app"  style="color: #ffffff;  ">결재대기함</a>
            <a href="successApproval.app"  style="color: white;">승인내역</a>
            <a href="rejectApproval.app"  style="color: white;">반려내역</a>
            	
           	
            <a href="tempApproval.app"  style="color: white; margin-top:50px;">임시저장</a>
            <a href="outgoingApproval.app"  style="color: white;">발신함</a>
           
        </div>
         
        
    </aside>
		<section>
			<article style="overflow-y: auto;">
				<br>
				<div id="headTitles">
					<div id="blueSquare"></div>
					&nbsp;
					<p id="titles">결재 작성</p>
				</div>

				<hr noshade="noshade" style="margin-top: 10px;">
				<br>
				<table style="width: 90%; margin-left: auto; margin-right: auto; "
					id="contentTable">
					<tr>
						<td>
							<div class="choiceType">
								<label style=" font-weight: bolder; margin-right: 30px;">양식분류</label>
									<select name="documentType">
											<option>===양식 선택===</option>
											<c:forEach var="i"  begin="0" end="${fn:length(documentTypeList)-1 }">
												<option value="${documentTypeList[i].documentType }">${documentTypeList[i].documentName }</option>
											</c:forEach>
									</select>							
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<div class="choiceType" style="margin-bottom: 10px;">
								<label style="font-weight: bolder;">결재선 선택</label>
								<button id="searchButton" type="button" onclick="popSanctionLine();"></button>

							</div>

							<div
								style="width: 90%; height: 150px; background: rgba(196, 196, 196, 0.2);"></div>
							<br>
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<div class="choiceType">
								<p style="display: table-cell; font-weight: bolder;">제목&nbsp;&nbsp;&nbsp;</p>
								<div style="display: table-cell;">
									<input type="text" style="width: 250%;">
								
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<table style="width: 100%;">
								<tr>
									<td style="border-bottom: none;">
										<div>
											<label style="font-weight: bolder; margin-right: 20px;">작성자</label>
											<input type="text" style="width: 60%;" value = "${sessionScope.loginUser.empNameKor }"readonly="readonly">
										</div>
									</td>

									<td style="border-bottom: none;">
										<div>
											<label style="font-weight: bolder; margin-right: 20px;">수신처</label>
											<input type="text" style="width: 60%;" readonly="readonly">
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td>
							<br>
							<div id="sampleZone">
								<div class="sample">
									<jsp:include page="/WEB-INF/views/groupware/approval/eduApprovalSample.jsp"/>
								</div>
								<div class="sample">
									<jsp:include page="/WEB-INF/views/groupware/approval/AppointmentApprovalSample.jsp"/>
								</div>
							</div>
							<br><br><br>
							
						</td>
					</tr>
					
				</table>
				<br>
				<div style="width: 100%;" align="center">
					<button type="button" id="submitBtn">결재 문서 발송</button>
				</div>
				<br><br>
					<form name="sanction">
					<input type="hidden"  name="keyword" value="sanction">
					</form>
			</article>
		</section>
	</div>
	<script>
		$(function(){
			$('.sample').hide();
		})
		function popSanctionLine(){
			var sanctionPop = document.sanction;
			 window.open('','sanction','top=100px, left=100px, height=600px, width=1000px, menubar=no, toolbar=no' );
			 sanctionPop.action = 'popupZone.jsp';
			 sanction.target= 'sanction';
			 sanction.submit();
		}
		
		$('select[name=documentType]').change(function(){
			
				var value = $('select[name = documentType]').val();
				 $('#sample.zone').html('');
				
		switch (value) {
			case 'GY':
				$('.sample:nth(0)').show();
				$('.sample').not('.sample:nth(0)').hide();
				break;
			case 'BL':
				$('.sample:nth(1)').show();
				$('.sample').not('.sample:nth(1)').hide();
				break;
			case 'SJ':
				break;
			}

		});
	</script>



</body>
</html>