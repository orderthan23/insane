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
	font-size: 13px;
	font-weight: bolder;
	background: #F3F3F3;
	margin-right: 30px;
	margin-bottom: 20px;
	margin-left : 15px;
}

.tableTitleBox p {
	line-height: 30px;
	text-align: center;
	font-size: 13px;
	margin : 0;
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
	border-radius : 10px;
}
#imageZone img{
	border-radius : 10px;
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
				<p id="articleTitle">추가 사항</p>
				<br>
				<hr style="border-width: 2px;">
				<br>
				<br>
				<form id="additionalInfoForm"  action="updateAdditionalInfo.cp" method="post" enctype="multipart/form-data" >
					<table>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>법인 구분 </p>
								</div>

							</td>
							

							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="corpType">
										<option value="">===법인 구분===</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.corp_type)-1 }">
										<option value="${codeMap.corp_type[i].commonCode }"<c:if test="${additionalInfo.corpType == codeMap.corp_type[i].commonCode}">selected</c:if>>${codeMap.corp_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							
							<td>
								<div class="tableTitleBox">
									<p>회사 로고 이미지</p>
								</div>
								
							</td>
							
							<td rowspan="3">
								<div>
									<div id="imageZone">
										<c:if test="${empty additionalInfo.companyLogoImgPath ||  additionalInfo.companyLogoImgPath eq '' }">
										<img src="<%=request.getContextPath()%>/resources/images/basicLogoPicture.PNG" width="100%" height="100%">
										</c:if>
										<c:if test="${!empty additionalInfo.companyLogoImgPath &&  additionalInfo.companyLogoImgPath ne '' }" >
										<img src="<%=request.getContextPath()%>${additionalInfo.companyLogoImgPath}" width="100%" height="100%" alt="통과한놈">
										</c:if>
									</div>
								</div>
								<input type="file" id="companyLogoUpload" name="photo" accept="image/*" onchange="loadImg(this);" value="<%=request.getContextPath()%>${additionalInfo.companyLogoImgPath}">
								
							</td>
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>회사 종류별 구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="companyType">
										<option value="">===회사 구분===</option>
											<c:forEach var="i"  begin="0" end="${fn:length(codeMap.company_type)-1 }">
										<option value="${codeMap.company_type[i].commonCode }"<c:if test="${additionalInfo.companyType == codeMap.company_type[i].commonCode}">selected</c:if>>${codeMap.company_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>

						

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>본점 주소</p>
								</div>

							</td>


							<td colspan="2">
								<div class="tableInputBox">
									<input type="text" style=" margin-right:3px; width: 250px;" readonly="readonly" name="headOfficeAddress" value="${additionalInfo.headOfficeAddress }" > 
								</div>
								<input type="button" class="company-btn" style=" vertical-align: middle;" onclick="searchAddress();" >
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>중소기업 여부</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="smallBusinessYn">
										<option value="">==중소기업여부==</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.small_business_yn)-1 }">
										<option value="${codeMap.small_business_yn[i].commonCode }"<c:if test="${additionalInfo.smallBusinessYn == codeMap.small_business_yn[i].commonCode}">selected</c:if>>${codeMap.small_business_yn[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							
							<td>
								<div class="tableTitleBox">
									<p>비 중소기업 구분</p>
								</div>

							</td>
							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;"name="nonSmallType">
										<option value="">==비중소기업 구분==</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.non_small_type)-1 }">
										<option value="${codeMap.non_small_type[i].commonCode }"<c:if test="${additionalInfo.nonSmallType == codeMap.non_small_type[i].commonCode}">selected</c:if>>${codeMap.non_small_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>정상 사업기간</p>
								</div>

							</td>


							<td colspan="2">
								<div class="tableInputBox">
									<input type="date" style="width: 140px; margin-right : 30px;" name="operateStartDate">									
									<input type="date" style="width: 140px;" name="operateEndDate">									
								</div>
							</td>
						</tr>
						<tr></tr>
						<tr>
							<td>
								<p style="margin-left: 15px; width: 170px; margin-bottom: 10px;  font-family:'nanumSquare'; font-weight: bolder; font-size: 15px;">개인 사업자 추가 입력 사항</p>
								<br>
							</td>
						
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>과세유형</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="taxationType">
										<option value="">===과세 유형===</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.taxation_type)-1 }">
										<option value="${codeMap.taxation_type[i].commonCode }"<c:if test="${additionalInfo.taxationType == codeMap.taxation_type[i].commonCode}">selected</c:if>>${codeMap.taxation_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							
							<td>
								<div class="tableTitleBox">
									<p>소득 구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="incomeClassification">
										<option value="">===소득 구분===</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.income_classification)-1 }">
										<option value="${codeMap.income_classification[i].commonCode }"<c:if test="${additionalInfo.incomeClassification == codeMap.income_classification[i].commonCode}">selected</c:if>>${codeMap.income_classification[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>

									<tr>
							<td>
								<div class="tableTitleBox">
									<p>대표자 구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 25px;" name="representType">
										<option value="">===대표자 구분==</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.represent_type)-1 }">
										<option value="${codeMap.represent_type[i].commonCode }"<c:if test="${additionalInfo.representType == codeMap.represent_type[i].commonCode}">selected</c:if>>${codeMap.represent_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							
							<td>
								<div class="tableTitleBox">
									<p>공동 사업자 여부</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="jointOfficeYn">
										<option value="">공동 사업자 여부</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.joint_office_yn)-1 }">
										<option value="${codeMap.joint_office_yn[i].commonCode }"<c:if test="${additionalInfo.jointOfficeYn == codeMap.joint_office_yn[i].commonCode}">selected</c:if>>${codeMap.joint_office_yn[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
						<td>
								<div class="tableTitleBox">
									<p>주된 소득자 구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="mainResidentType">
										<option value="">주된 소득자 구분</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.main_resident_type)-1 }">
										<option value="${codeMap.main_resident_type[i].commonCode }"<c:if test="${additionalInfo.mainResidentType == codeMap.main_resident_type[i].commonCode}">selected</c:if>>${codeMap.main_resident_type[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p style="font-size: 13px;">주된소득자  주민등록번호</p>
								</div>

							</td>


							<td colspan="2">
								<c:set var="mainResidentNo" value="${fn:split(additionalInfo.mainResidentNo,'-')}"/>
								<div class="tableInputBox">
									<input type="text" style="width: 140px; margin-right : 15px;" maxlength="6" name="mainResidentNo1" value="${mainResidentNo[0]}">									
									<input type="password" style="width: 140px;" maxlength="7" name="mainResidentNo2"  value="${mainResidentNo[1]}">									

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


		</section>
	</div>
	<script>
		$('#imageZone').click(function(){
			$('#companyLogoUpload').click();
		});
		
		
		  function loadImg(value) {
		        if(value.files && value.files[0]) {
		            var reader = new FileReader();

		            reader.onload = function(e) {
		                $("#imageZone img").attr("src", e.target.result);
		            }

		            reader.readAsDataURL(value.files[0]);
		        } 
		    }
		
		
		
		
		//ajax 처리를 통해 유효성 검사 후 전송하는 함수
		var validateResult;
		function validateInfo(){
			
			var representNo = $('input[name=mainResidentNo1]').val() + "-" + $('input[name=mainResidentNo2]').val()
			 $.ajax({
				url : "validateAdditionalInfo.cp",
				type: "post",
				data: {
					representNo : representNo		
				},
				success : function(data){
					validateResult = data;
					console.log("validateResult :"+ validateResult);
					var msg;
					if(validateResult =='1'){
						$('#additionalInfoForm').submit();
					}else if(validateResult =='2'){
						alert("주민등록번호를 올바른 형식으로 입력하세요");
					}
					
				},
				error : function(){
					alert("알수없는 에러가 발생하였습니다.");
				}
			}) 
		
		}
		
		$(function(){
			var imgPath = $('input[name=photo]').val()
			if( imgPath != null && imgPath != ""){
				  $("#imageZone img").attr("src", value);
			}
			
			let openDate = "${additionalInfo.operateStartDate}";
			if(openDate != "" ){
			openDate = openDate.substring(0,10);
			$('input[name="operateStartDate"]').val(openDate); 
			} 
			
			let endDate = "${additionalInfo.operateEndDate}";
			if(endDate != "" ){
			endDate = endDate.substring(0,10);
			$('input[name="operateEndDate"]').val(endDate); 
			} 
		});
	</script>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchAddress(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name=headOfficeAddress]').val(data.address);
        }
    }).open();
	}
</script>



</body>
</html>
