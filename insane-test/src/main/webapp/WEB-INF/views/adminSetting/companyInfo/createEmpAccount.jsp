<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
article {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.blueBox {
	width: 10px;
	height: 20px;
	background: #2E2C8F;
}

.tableWrapper {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

.plusButton, .minusButton {
	width: 23px;
	height: 23px;
	border-radius: 100%;
	border: none;
	background: #2E2C8F;
	color: white;
	font-weight: normal;
	font-size: 15px;
}

#AccountTable {
	width: 100%;
}

#AccountTable th {
	background: #2E2C8F;
	color: white;
	border: 0.5px;
}

#AccountTable td {
	background: #ffffff;
	color: black;
	border: 0.5px;
	text-align: center;
}

#Account {
	height: 700px;
	overflow-y: auto;
}

#aside-body {
	height: auto;
}

#settingPwBtn {
	background: #2E2C8F;
	color: white;
	border-radius: 5px;
	border: none;
	margin-left: 15px;
}

#settingPwBtn:active, #settingPwBtn:hover, #settingPwBtn:focus {
	border: none;
	outline: none;
}

.choiceStatus {
	width: 100%;
	border: none;
	-webkit-appearance: none; /* 화살표 없애기 for chrome*/
	-moz-appearance: none; /* 화살표 없애기 for firefox*/
	appearance: none; /* 화살표 없애기 공통*/
	text-align-last: center;
}

.choiceStatus:active, .choiceStatus:focus {
	border: none;
	outline: none;
	text-decoration: none;
}

.modalArea {
	display: none;
	position: fixed;
	z-index: 10;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.modalBg {
	width: 100%;
	height: 100%;
	background-color: rgba(30, 30, 30, 0.9);
}

.modalWrapper {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 70%;
	max-width: 500px;
	padding: 10px 30px;
	background-color: #fff;
}

#openModal {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.modalContents {
	align: center;
	text-align: center;
}

.modalContents table {
	width: 90%;
	margin-right: auto;
	margin-left: auto;
}

.modalContents table td {
	height: 40px;
}

.modalContents table td label {
	font-size: 17px;
	font-weight: bolder;
	font-family: 'nanumsquare';
}
</style>
<title>Smart HR Works Solution INSANE</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/adminSetting/adminNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="/WEB-INF/views/common/adminSetting/adminAside.jsp" />

		<section>
			<br>
			<!-- 계정 목록 start -->
			<div class="tableWrapper">
				<div id="modalArea" class="modalArea">
					<div id="modalBg" class="modalBg"></div>
					<div class="modalWrapper">
						<div class="modalContents" style="overflow-y: auto;">
							<div
								style="background: #2E2C8F; text-align: center; width: 100%; height: 30px;">
								<h1 style="margin: 0; line-height: 30px; color: white;"
									id="modalTitle">초기 비밀번호 설정</h1>
							</div>
							<br>
							<div id="modalContent">
								<table>
									<tr>
										<td><label>설정할 비밀번호 입력</label></td>
										<td><input type="password" id="password1"></td>
									</tr>
									<tr>
										<td><label>설정할  비밀번호 확인</label></td>
										<td><input type="password" id="password2"></td>
										
									</tr>
								</table>



							</div>
							<br> <br>
							<div
								style="width: 20%; margin-left: auto; margin-right: auto; align: center;"
								id="buttonZone">
								<button style="margin-right: 10%;" type="button" id="okButton"
									onclick="updateStartPwd();">확인</button>
								
								<c:if test="${!needSetting}">
									<button onclick="closeModal();">취소</button>
								</c:if>
								
								</div>
								
							
						</div>

					</div>
				</div>
				<br> <br>
				<div style="display: table; width: 100%;">
					<article style="margin: 0; display: table-cell;">
						<table id="dayEmpJobCode">
							<tr>
								<th>
									<div class="blueBox"></div>
								</th>
								<th>
									<p>
										생성된 계정 &nbsp;&nbsp;<label>검색 결과
											:${fn:length(accountList)}개</label>
									</p>
								</th>

								<th>
									<div class="searchBox">
										<img src=""> <input type="search" placeholder="계정 명">
										&nbsp;&nbsp;
										<button type="button" class="plusButton"
											onclick="addAccount();">+</button>
										<button type="button" class="minusButton">-</button>
										
									</div>
								</th>

							</tr>

						</table>


					</article>

					<button style="display: table-cell;" id="settingPwBtn" type="button" onclick="openModal();">초기비밀번호
						설정</button>

				</div>
				<div id="Account">
					<table id="AccountTable">
						<tr>
							<th width="20%" height="30px">No</th>
							<th width="40%" height="30px">ID</th>
							<th width="40%" height="30px">활성화 여부</th>

						</tr>
						<c:if test="${fn:length(accountList) ne 0}">
							<c:forEach var="i" begin="0" end="${fn:length(accountList)-1}">
								<tr>
									<td><input type="checkbox" style="float: left">${i+1}</td>
									<td><p class="accountName">${accountList[i].empNo}<p></td>
										
										<td>
										<c:if test="${accountList[i].empStatus ne 'Y' && accountList[i].empStatus ne 'R' }">
										<select class="choiceStatus" onchange="updateStatus(this);">
												<option value="D"<c:if test="${accountList[i].empStatus eq 'D'}">selected</c:if>>활성화</option>
												<option value="N"<c:if test="${accountList[i].empStatus eq 'N'}">selected</c:if>>비활성화</option>
										</select>
										</c:if>
										<c:if test="${accountList[i].empStatus eq 'Y' || accountList[i].empStatus eq 'R' }">
										<select class="choiceStatus" onchange="updateStatus(this);">
												<option value="Y"<c:if test="${accountList[i].empStatus eq 'Y'}">selected</c:if>>사용중</option>
												<option value="N"<c:if test="${accountList[i].empStatus eq 'R'}">selected</c:if>>퇴사자</option>
										</select>
										</c:if>
										</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			<!--계정 목록 END -->


		</section>
	</div>
	<script>
		function closeModal() {
			$('#modalArea').fadeOut();
		}

		function openModal(i) {

			$('#modalArea').fadeIn();
		}

		
		$(function() {

			var needSetting = "${needSetting}";

			if (needSetting == 'true') {
				openModal(1);
			}
		});

		function addAccount() {

			location.href = "createAccount.cp";
		}

		 function updateStartPwd() {
			var password1 = $('#password1').val();
			var password2 = $('#password2').val();

			$
					.ajax({
						url : "updateStartPwd.cp",
						type : "post",
						data : {
							password1 : password1,
							password2 : password2
						},
						success : function(data) {
							let msg;
							switch (data) {
							case '1':
								msg = "비밀번호가 일치하지 않습니다.";
								break;
							case '2':
								msg = "적합하지 않은 비밀번호입니다  \n 1. 영문(대소문자 구분), 숫자, 특수문자 조합 \n 2. 8~20자리 사이 문자 \n 3. 같은 문자 4개 이상 사용 불가 \n 4. 비밀번호에 ID 포함 불가 \n 5. 공백문자 사용 불가";
								break;
							case '3':
								msg = "알수없는 에러가 발생했습니다 다시 시도해주십시오";
								break;
							case '4':
								msg = "초기 비밀번호 설정을 완료했습니다";
								break;
							}
							alert(msg);

							if (data == 4) {
								location.reload(true);
							}
						},
						error : function() {
							console.log("ERROR...");
						}
					});
		} 
		
		function updateStatus(which){
			var status = $(which).val();
			var account = $(which).parent().prev().find('.accountName').text();
			
			$.ajax({
				url : "updateAccountStatus.cp",
				type : 'post',
				data : {
					status : status,
					account : account
				},
			    success : function(data){
			    	 if(data == 'false'){
			    		alert("알수없는 에러가 발생했습니다."); 
			    	 }else{
			    		 location.reload(true);
			    	 }
			    },
			    error : function(){
			    	console.log('ERROR...');
			    }
			});
			
		}
	</script>


</body>
</html>
