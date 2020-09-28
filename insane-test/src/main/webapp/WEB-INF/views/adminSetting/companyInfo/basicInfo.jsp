<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	width: 170px;
	height: 30px;
	font-size: 15px;
	font-weight: bolder;
	background: #F3F3F3;
	margin-left: 10px;
	margin-bottom: 20px;
	text-align: center;
}

.tableTitleBox p {
	line-height: 30px;
	text-align: center;
	font-weight : bolder;
	font-size: 15px;
	margin-left: 0;
	
}

.tableInputBox {
	display: inline-block;
	height: 30px;
	margin-bottom: 20px;
	border: 1px solid #f3f3f3;
}
.tableInputBox label {
	font-weight : bolder;
	font-size : 13px;
}

.tableInputBox input {
	margin-top: 3px;
	margin-left: 15px;
	margin-right: 15px;
	border : 1px solid #c4c4c4;
}


#saveZone{
	width: 100%;
}

#saveButton,#updateButton{
	width: 105px;
	height: 34px;
	border-radius: 10px;
	background: #2E2C8F;
	color : white;
	font-weight : bolder;
	font-size : 15px;

}
.company-btn {
	width: 20px;
	height: 20px;
	background-image:url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-repeat: no-repeat;
	background-size: 100%;
	border-radius: 5px;
	border: 0px;
	cursor: pointer;
	
}


 


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<p id="articleTitle">기초 사항</p>
				<br>
				<hr style="border-width: 2px;">
				<br>
				<br>
				
				
			
				<form id="basicInfoForm" method="post" action="insertCompanyInfo.cp" name="basicInfo">
				
					<table>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*인사년도</p>
									
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:if test="${ companyInfo.companyStatus eq 'N' }">
									<input type="number" value="2020" name=hrYear>
									</c:if>
									<c:if test="${ companyInfo.companyStatus eq 'Y' }">
									<input type="number" value="${companyInfo.hrYear}" name=hrYear>	
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*회사명</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" name="companyName" value="${loginUser.companyName }" readonly="readonly">
								
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*법인구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select style="margin-right: 30px;" name="corpPers">
										<option value="">===법인/개인 선택===</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.corp_pers)-1 }">
											<option value="${codeMap.corp_pers[i].commonCode }"<c:if test="${companyInfo.corpPers == codeMap.corp_pers[i].commonCode}">selected</c:if>>${codeMap.corp_pers[i].codeName }</option>
										</c:forEach>
										
									</select>
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*사업자등록번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="bln" value="${fn:split(companyInfo.businessLicenseNo,'-')}"/>
									<input type="text" style="width: 80px;" name="businessLicenseNo1" maxlength="3" value="${bln[0]}"> <input
										type="text" style="width: 80px;" name="businessLicenseNo2" maxlength="2" value="${bln[1] }"> <input type="text"
										style="width: 120px;"  name="businessLicenseNo3" maxlength="5" value="${bln[2]}">
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*법인등록번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="crn" value="${fn:split(companyInfo.corparateRegistNo,'-')}"/>
									<input type="text" style="width: 80px;" name="corparateRegistNo1" maxlength="4" value="${crn[0]}"> <input
										type="text" style="width: 80px;" name="corparateRegistNo2" maxlength="2" value="${crn[1] }"> <input type="text"
										style="width: 120px;" name="corparateRegistNo3" maxlength="7" value="${ crn[2] }">
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*대표자명</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<input type="text"style="width: 80px;" name="representName" value="${companyInfo.representName }">
								</div>
							</td>
						</tr>


						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*대표자 주민등록번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="rrn" value="${fn:split(companyInfo.representResidentNo,'-')}"/>
									<input type="text" style="width: 150px;" name="representResidentNo1" value="${rrn[0]}"> <input
										type="password" style="width: 150px;" name="representResidentNo2" value="${rrn[1] }">
								</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*대표 내/외국인구분</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									&nbsp;&nbsp;&nbsp;<select name="representLocalForegin">
										<option value="">===내외국인 선택===</option>
										<c:forEach var="i"  begin="0" end="${fn:length(codeMap.represent_local_foreign)-1 }">
											<option value="${codeMap.represent_local_foreign[i].commonCode }"<c:if test="${companyInfo.corpPers == codeMap.represent_local_foreign[i].commonCode}">selected</c:if>>${codeMap.represent_local_foreign[i].codeName }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*사업장 주소</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="address" value="${fn:split(companyInfo.businessAddress,'$$')}"/>
									<input type="text" style="width: 200px;" name="businessAddress1" placeholder="주소" readonly="readonly" value="${address[0]}">
									<input type="button" class="company-btn" onclick="searchAddress();">
									<input type="text" style="width: 200px;" name="businessAddress2" placeholder="상세주소" value="${address[1] }">
								</div>
							</td>
						</tr>
						
						
						

						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*법정동 코드</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" name="beobJeongCode" readonly="readonly" value=${companyInfo.beobJeongCode }>
								</div>
							</td>
						</tr>				



						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*사업장 전화번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
										<c:set var="tel" value="${fn:split(companyInfo.businessTel,'-')}"/>
									<input type="text" style="width: 80px;" name="businessTel1" maxlength="3" value="${tel[0]}"> <input
										type="text" style="width: 80px;" name="businessTel2" maxlength="4" value="${tel[1] }"> <input type="text"
										style="width: 120px;" name="businessTel3" maxlength="4" value="${tel[2] }">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>사업장 팩스번호</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<c:set var="fax" value="${fn:split(companyInfo.businessFax,'-')}"/>
									<input type="text" style="width: 80px;"name="businessFax1" maxlength="3" value="${fax[0]}"> <input
										type="text" style="width: 80px;" name="businessFax2" maxlength="4" value="${fax[1] }"> <input type="text"
										style="width: 120px;" name="businessFax3" maxlength="4" value="${fax[2] }">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*업종코드</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="text" style="width: 150px;" name="businessTypeCode" id="businessTypeCode" readonly="readonly" value="${companyInfo.businessTypeCode }">
									<input type="button" class="company-btn" onclick="openUpjongPop();">
									 
									
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="tableTitleBox">
									<p>*개업년월일</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="date"  name="businessOpenDate">
								</div>
							</td>
						</tr>
						
							<tr>
							<td>
								<div class="tableTitleBox"> 
									<p>폐업년월일</p>
								</div>

							</td>


							<td>
								<div class="tableInputBox">
									<input type="date" name="businessEndDate">
								</div>
							</td>
						
						</tr>
								
						
					</table>
					<br>
					<div id="saveZone" align="center">
						<c:if test="${ companyInfo.companyStatus eq 'N' }">
							<button type="button" id="saveButton" onclick="validateInfo();">저장하기</button>
						</c:if>
						<c:if test = "${companyInfo.companyStatus eq 'Y' }" >
							<button type="button" id="updateButton" onclick="validateInfo();">수정하기</button>
						</c:if>
					</div>
					<br><br>	
						
				</form>
				<form name="pop">
					<input type="hidden"  name="keyword" value="upjongPop">
				</form>


			</article>
				

		</section>
	</div>
	<script>
		//데이터가 존재하는 경우 처리해 주는 함수
		$(function(){
			const status = "${companyInfo.companyStatus}";
			if(status == 'Y'){
				$('#basicInfoForm').attr("action", "updateBasicInfo.cp");
				let openDate = "${companyInfo.businessOpenDate}";
				if(openDate != "" ){
				openDate = openDate.substring(0,10);
				$('input[name="businessOpenDate"]').val(openDate); 
				} 
				
				let endDate = "${companyInfo.businessEndDate}";
				if(endDate != ""){
				endDate = endDate.subString(0,10);
					$('input[name="businessEndDate"]').val(endDate);
				}
			
			
				
			}
		});	
		//ajax 처리를 통해 유효성 검사 후 전송하는 함수
		var validateResult;
		function validateInfo(){
			
			var queryString = $("form[name=basicInfo]").serialize();
			 $.ajax({
				url : "validateBasicInfo.cp",
				type: "post",
				data: {
					queryString : queryString		
				},
				success : function(data){
					validateResult = data;
					console.log("validateResult :"+ validateResult);
					var msg;
					switch(validateResult){
					case '1' : msg = "회사정보 입력이 완료되었습니다."; break; 
					case '2' : msg = "개업년월일을 확인하세요."; break;
					case '3' : msg = "업종코드를 올바르게 입력해주세요"; break;
					case '4' : msg = "전화번호를 입력해주세요."; break;
					case '5' : msg = "올바른 전화번호 형식이 아닙니다."; break;
					case '6' : msg = "법정동 코드를 올바로 입력해주세요."; break;
					case '7' : msg = "올바른 주소를 입력하세요."; break;
					case '8' : msg = "내/외국인 구분을 선택하세요."; break;
					case '9' : msg = "대표자 주민등록번호를 입력하세요."; break;
					case '10' : msg = "올바른 주민등록번호 형식으로 입력해주세요."; break;
					case '11' : msg = "대표자 명을 입력하세요."; break;
					case '12' : msg = "법인 사업자는 법인 등록번호를 필수 기재해 주세요."; break;
					case '13' : msg = "올바른 법인 등록번호 형식이 아닙니다."; break;
					case '14' : msg = "개인 사업자는 사업자 등록번호를 필수 기재해 주십시오."; break;
					case '15' : msg = "올바른 사업자 등록 번호 형식이 아닙니다."; break;
					case '16' : msg = "법인구분을 선택해 주세요."; break;
					case '17' : msg = "회사명을 입력하세요."; break;
					case '18' : msg = "인사년도를 확인하세요."; break;
					}
					alert(msg);
					if(validateResult =='1'){
						$('#basicInfoForm').submit();
					}
					
					
					
					
				},
				error : function(){
					console.log("ERROR...");
				}
			}) 
			return validateResult;
		}
		
		
	
		//모달 닫기
		function closeModal(){
			 $('#modalArea').fadeOut();
		}
	/* 	function openModal(i){
			console.log(i);
			$('#modalArea').fadeIn();
		} */
		//팝업을 생성하는 함수
		function openUpjongPop(){
			var popup = document.pop;
			 window.open('','upjong','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
			 popup.action = 'popupZone.jsp';
			 pop.target= 'upjong';
			 pop.submit();
		}
	</script>

	

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function searchAddress(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name=businessAddress1]').val(data.address);
        	$('input[name=beobJeongCode]').val(data.bcode);
            
        }
    }).open();
	}
</script>


</body>
</html>
