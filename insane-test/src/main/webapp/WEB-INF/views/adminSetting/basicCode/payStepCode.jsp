<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
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

#payStepCodeTable {
	width: 100%;
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

.modifyButton{
	height: 23px;
	border-radius : 10px;
	border: none;
	background: #2E2C8F;
	color: white;
	font-family: 'nanumSquare';
	font-weight: bolder;
	font-size: 15px;
}

#payStepCodeTable th {
	background: #2E2C8F;
	color: white;
	border: 0.5px;
}

#payStepCodeTable td {
	background: #ffffff;
	color: black;
	border: 0.5px;
	text-align: center;
}

#payStepCode {
	height: 700px;
	overflow-y: auto;
}

#maximumCode{
	text-align : center;
    font-size: 25px;
	font-weight: bolder;
	border: none;
	color: #2E2C8F;
	
}

#maximumCode:active,
#maximumCode:hover,
#maximumCode:focus{
	border: none;
	outline: none;
	
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

.status {
	width: 100%;
	border: none;
	text-align-last: center;
	-webkit-appearance: none; /* 화살표 없애기 for chrome*/
	-moz-appearance: none; /* 화살표 없애기 for firefox*/
	appearance: none /* 화살표 없애기 공통*/
}

select:disabled{
	opacity : 1;
	color: black;
	font-size: 15;
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
			<!-- 지역 코드 start -->
			<div class="tableWrapper">
				<div id="modalArea" class="modalArea">
					<div id="modalBg" class="modalBg"></div>
					<div class="modalWrapper">
						<div class="modalContents" style="overflow-y: auto;">
							<div
								style="background: #2E2C8F; text-align: center; width: 100%; height: 30px;">
								<h1 style="margin: 0; line-height: 30px; color: white;"
									id="modalTitle"> 호봉코드 추가</h1>
							</div>
							<br>
							<div id="modalContent">
										<input type="radio" name="kind" value="increase" checked="checked"><label>확장</label>
										&nbsp; &nbsp;<input type="radio" name="kind" value="decrease"><label>축소</label>
										<br><br>
										<p>사용할 최대 호봉을 입력해주세요</p>
										<br>
										<input type="number" id="maximumCode" value="${ realMax }" max="${fn:length(payStepList) }" min="${ realMax }" ><label style="font-size:25px; font-weight:bolder;">호봉</label>
										



							</div>
							<br> <br>
							<div
								style="width: 20%; margin-left: auto; margin-right: auto; align: center;"
								id="buttonZone">
								<button style="margin-right: 10%;" type="button" id="okButton"
									onclick="modifyCode();">확인</button>
								<button onclick="closeModal();">취소</button>
							</div>
						</div>

					</div>
				</div>
				<br> <br>

				<article style="margin: 0">
					<table id="dayEmpJobCode">
						<tr>
							<th>
								<div class="blueBox"></div>
							</th>
							<th>
								<p>
									호봉 코드 &nbsp;&nbsp;<label>검색 결과 :
										${fn:length(payStepList) }개</label>
								</p>
							</th>

							<th>
								<div class="searchBox">
									
									&nbsp;&nbsp;
									<button class="plusButton" type="button"
										onclick="addCode();">+</button>
									<button class="modifyButton" type="button"
										onclick="openModal(1);">수정</button>
									&nbsp;&nbsp;
									<label style="font-size: 13px;">최대 ${ realMax }호봉 적용중 </label>
										
									
								</div>
							</th>
						</tr>

					</table>

				</article>
				<div id="payStepCode">
					<table id="payStepCodeTable">
						<tr>
							<th width="30%" height="30px">코드</th>
							<th width="40%" height="30px">호봉</th>
							<th width="30%" height="30px">사용 여부</th>
						</tr>
						<c:if test="${ !empty payStepList }">
						<c:forEach var="i" begin="0" end="${fn:length(payStepList)-1 }">
							<tr>
								<td>${payStepList[i].payStepSeq }</td>
								<td>${payStepList[i].payStep }호봉</td>
								<td><select class="status" disabled="disabled">
										<option value='Y'
											<c:if test="${payStepList[i].useageStatus == 'Y'}">selected</c:if>>사용</option>
										<option value='N'
											<c:if test="${payStepList[i].useageStatus == 'N'}">selected</c:if>>미사용</option>
								</select></td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			<!--지역 코드 END -->



		</section>
	</div>
	<script>
	function closeModal(){
		 $('#modalArea').fadeOut();
	}
	
	function openModal(i){
		
		$('#modalArea').fadeIn();
	}
	
	function addCode() {
		//var codeName = $('#newCodeName').val();
			if(window.confirm("정말 새로운 호봉을 추가하시겠습니까??") == false){
				
				return;
			}
			
			else{
				
				$.ajax({

					url : 'insertPayStepCode.bc',
					type : 'post',
					success : function(data) {
						switch (data) {
						case '1':
							alert("호봉 코드가 정상적으로 추가 되었습니다.");
							location.reload(true);
							break;
						case '2':
							alert("호봉 코드 추가에 실패하였습니다. 다시 시도해주세요");
							break;
						}
					},
					error : function() {
						console.log("ERROR...");
					}
				}); 
				
			}
			
		
	}
	
	
	function modifyCode(){
		var maxiType = $('input[name=kind]:checked').val();
		var maximum = $('#maximumCode').val();
		var max = parseInt('${fn:length(payStepList)}');
			if(maximum > max || maximum < 0 ){
				alert("범위 내 값이 아닙니다. 다시 입력해주세요.");
				return;
			}
		    $.ajax({
			 url : 'updatePayStepStatus.bc',
			 type : 'post',
			 data : {
					  maximum : maximum,
					  maxiType : maxiType
			 },
			 success : function(data){
				console.log(data);
				switch(data){
				case '1' : alert("호봉 상태 업데이트 성공!");  location.reload(true); break;  
				case '2' : alert("알 수없는 에러가 발생하였습니다 "); location.reload(true); break;
				case '3' : alert("동일한 값 입니다."); break;
				}
			 },
			 error : function(){
				 console.log("ERROR...");
			 }
				 		
			 		
		 });   
	
	}
	
	$(function(){
		$('input[name = kind]').change(function(){
			var value = $('input[name=kind]:checked').val();
			var realMax = parseInt('${ realMax }');
			var max = parseInt('${fn:length(payStepList)}');
			if(value == "increase"){
				$('#maximumCode').val(realMax);
				$('#maximumCode').attr('max',max);
				$('#maximumCode').attr('min',realMax);
				
			}else if(value == "decrease"){
				$('#maximumCode').val(realMax);
				$('#maximumCode').attr('max',realMax);
				$('#maximumCode').attr('min',0);
			}
			
		});
	});
	
	</script>


	


</body>
</html>
