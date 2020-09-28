<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

#educationCodeTable {
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

#educationCodeTable th {
	background: #2E2C8F;
	color: white;
	border: 0.5px;
}

#educationCodeTable td {
	background: #ffffff;
	color: black;
	border: 0.5px;
	text-align: center;
}

#educationCode {
	height: 700px;
	overflow-y: auto;
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

.usageStatus{
 width: 100%;
 border: none;
 text-align-last: center;
 -webkit-appearance:none; /* 화살표 없애기 for chrome*/
 -moz-appearance:none; /* 화살표 없애기 for firefox*/ 
 appearance:none /* 화살표 없애기 공통*/


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
			<!-- 교육 코드 start -->
			<div class="tableWrapper">
				<div id="modalArea" class="modalArea">
					<div id="modalBg" class="modalBg"></div>
					<div class="modalWrapper">
						<div class="modalContents" style="overflow-y: auto;">
							<div
								style="background: #2E2C8F; text-align: center; width: 100%; height: 30px;">
								<h1 style="margin: 0; line-height: 30px; color: white;"
									id="modalTitle">교육코드 추가</h1>
							</div>
							<br>
							<div id="modalContent">
								<p>추가할 코드명을 작성해주세요</p>
								<br> <input type="text" id="newCodeName">
							</div>
							<br>
							<br>
							<div
								style="width: 20%; margin-left: auto; margin-right: auto; align: center;"
								id="buttonZone">
								<button style="margin-right: 10%;" type="button" id="okButton"
									onclick="addCode();">확인</button>
								<button onclick="closeModal();">취소</button>
							</div>
						</div>

					</div>
				</div>
				<br>
				<br>
				<article style="margin: 0">

					<table id="dayEmpJobCode">
						<tr>
							<th>
								<div class="blueBox"></div>
							</th>
							<th>
								<p>
									교육 코드 &nbsp;&nbsp;<label>검색 결과 : ${fn:length(eduList) }개</label>
								</p>
							</th>

							<th>
								<div class="searchBox">
									<img src=""> <input type="search" placeholder="교육 명">
									&nbsp;&nbsp;
									<button class="plusButton" type="button"
										onclick="openModal(1);">+</button>

								</div>
							</th>
						</tr>

					</table>

				</article>
				<div id="educationCode">
					<table id="educationCodeTable">
						<tr>
							<th width="20%" height="30px">코드</th>
							<th width="40%" height="30px">관리내역 명</th>
							<th width="40%" height="30px">사용 여부</th>

						</tr>
						<c:if test="${fn:length(eduList) != 0}">
						<c:forEach var="i" begin="0" end="${fn:length(eduList)-1 }">
							<tr>
								<td>${eduList[i].educationSeq }</td>
								<td>${eduList[i].educationType }</td>
								<td>
									<select class="usageStatus">
										<option value='Y'<c:if test="${eduList[i].usageStatus == 'Y'}">selected</c:if>>사용</option>
										<option value='N'<c:if test="${eduList[i].usageStatus == 'N'}">selected</c:if>>미사용</option>
									</select>
								</td>

							</tr>
						</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
			<!--교육 코드 END -->



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
			var codeName = $('#newCodeName').val();
			$.ajax({

				url : 'insertEduCode.bc',
				type : 'post',
				data : {
					codeName : codeName
				},
				success : function(data) {
					switch (data) {
					case '1':
						alert("교육 코드가 정상적으로 추가 되었습니다.");
						location.reload(true);
						break;
					case '2':
						alert("교육 코드 추가에 실패하였습니다. 다시 시도해주세요");
						break;
					}
				},
				error : function() {
					console.log("ERROR...");
				}
			});
		}
		
		$('.usageStatus').change(function(){
			 var status = $(this).val();
			 var code = $(this).parent().prev().prev().text();
			 
			 $.ajax({
				 url : 'updateEduStatus.bc',
				 type : 'post',
				 data : {
					 	status : status,
						code : code		 
				 },
				 success : function(data){
					 if(data == 2){
						 alert("오류입니다 다시 시도해 주세요.");
						 location.reload(true);
					 }
				 },
				 error : function(){
					 console.log("ERROR...");
				 }
					 		
				 		
			 });
		})
	</script>


</body>
</html>
