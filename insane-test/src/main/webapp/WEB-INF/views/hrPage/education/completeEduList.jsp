<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<style>
 article{
 	height : 300px;
 	overflow-y: auto;
 	width: 90%;
 	margin-left: auto;
 	margin-right: auto;
 }

 .articleWrapper,
 .articleWrapper2{
 
 	width: 95%;
 	margin-left: auto;
 	margin-right: auto;
 }
 
 .blueRect{
 	width : 30px;
 	height : 20px;
 	background: #2E2C8F;
 	color: #2E2C8F;
 }
 
 .edutable{
 	width: 100%;
 	text-align: center;
 	border-collapse: collapse;
 }
 .edutable th
 {
 	background: #2E2C8F;
 	color: white;
 	font-family: 'nanumSquare';
 	height: 30px;
 }
 .edutable td
 {
 	height: 20px;
 	border-bottom: 1px solid lightgray;
 	font-weight: normal;
 }
 
 #updateBtn, #insertBtn,#deleteBtn{
 	float: right;
 	background: #2E2C8F;
 	color: white;
 	border: none;
 	border-radius: 10px;
 	height: 25px;
 }
 
 .edutable tr td input[type=text],
 .edutable tr td select
 {
 	width: 100%;
 	text-align: center;
 	color: black;
 	text-align-last: center;
  	border: none;
  	font-size: 15px;
    -moz-appearance:none;  /* Firefox */
	-webkit-appearance:none;  /* Safari and Chrome */
     appearance:none;  /* 화살표 없애기 공통*/
 }
 select[disabled=disabled]{
 	opacity : 1;
 }

 .hidden{
 	visibility: hidden;
 	display: none;
 	opacity: 0;
 }
 

</style>

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<title>Home</title>
</head>
<body>
			<c:if test="${!fn:contains(auth,'EP4') }">
				<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
			</c:if>		
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp" />
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp" />
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
			<br> <br>
			<div id="sideMenu" align="center">
				<p style="font-size:20px;">교육관리</p>
				<br><br>
				<a href="Edulist.edu" style="text-decoration:none; color:white;">교육일정관리</a>
				<br>
				<a style="background:#524FE3; color: #ffffff; text-decoration:none" href="moveEduAssessment.edu">교육이수내역</a>
			
			</div>
		</aside>
		<section>
			<article>
				<br><br>
				<div class="articleWrapper">
					<span class="blueRect">ㅁ</span>&nbsp;<label>마감된 교육</label>
					<label style=" margin-left: 50px;">${fn:length(eduList)}</label>개
					<hr style="margin-top :10px; margin-bottom: 5px;">
					
					<table class="eduTable">
						<tr>
							<th>교육타입</th>
							<th>교육제목</th>
							<th>교육시작일</th>
							<th>교육종료일</th>
						</tr>
						<c:if test="${!empty eduList }">
						<c:forEach var="i"  begin="0" end="${fn:length(eduList)-1 }">
							<tr class="infoList">
								<td>
									<input type="hidden" value="${i }" class="arrayNum">
									<input type="hidden" value="${eduList[i].eduScheduleSeq}" class="seqInfo">
									<input type="hidden" value="${fn:length(eduList[i].evaluations) }" class="length">
									${eduList[i].educationType }
								</td>
								<td>${eduList[i].eduTitle }</td>
								<td>${eduList[i].eduStartDate}</td>
								<td>${eduList[i].eduEndDate }</td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
				
				</div>
			</article>
			<br><br>
			
			<article>
				<br><br>
				<div class="articleWrapper2">
					<span class="blueRect">ㅁ</span>&nbsp;<label>이수 인원</label>
					<label style=" margin-left: 50px;" id="amount">0</label>명
					<c:if test="${fn:contains(auth,'EP6') }">
					<button type="button" id="updateBtn" onclick="updateInfo();">수정</button>
					</c:if>
					<c:if test="${fn:contains(auth,'EP8') }">
					<button type="button" id="insertBtn" style="margin-right: 10px;">이수자 추가</button>
					</c:if>
					<c:if test="${fn:contains(auth,'EP7') }">
					<button type="button" id="deleteBtn" style="margin-right: 10px;" onclick="deleteInfo();">삭제</button>
					</c:if>
					<hr style="margin-top :10px; margin-bottom: 5px;">
				
					<c:if test="${!empty eduList }">
					<c:forEach var="i"  begin="0" end="${fn:length(eduList)-1 }">
					
					<table class="edutable hidden">
						<tr>
							<th width="5%"></th>
							<th width="10%">사원코드</th>
							<th width="15%">사원명</th>
							<th width="20%">부서</th>
							<th width="15%">직급</th>
							<th width="10%">이수상태</th>
							<th width="25%">비고</th>
						</tr>
				
						
							<c:if test="${!empty eduList[i].evaluations }">
						<c:forEach var="j"  begin="0" end="${fn:length(eduList[i].evaluations)-1 }">
							<tr class="contents">
						
								<td><input type="radio" name="check"></td>
								<td class="hiddenZone">
									<input type="hidden" value="${i }">
									<input type="hidden" value="${eduList[i].evaluations[j].empNoSeq }" class="empNoSeq">
									${eduList[i].evaluations[j].empNo }
								</td>
								<td><input type="text" value="${eduList[i].evaluations[j].empNameKor }" readonly="readonly"></td>
								<td><input type="text" value="${eduList[i].evaluations[j].deptName}" readonly="readonly"></td>
								<td><input type="text" value="${eduList[i].evaluations[j].positionName }" readonly="readonly"></td>
								<td class="selectZone"><select disabled="disabled" class="selectbox">
								<option value="NONE"<c:if test="${eduList[i].evaluations[j].passFail eq 'NONE'}">selected</c:if>>미책정</option>
								<option value="BEST" <c:if test="${eduList[i].evaluations[j].passFail eq 'BEST'}">selected</c:if>>최우수</option>
								<option value="GOOD" <c:if test="${eduList[i].evaluations[j].passFail eq 'GOOD'}">selected</c:if>>우수</option>
								<option value="NORMAL" <c:if test="${eduList[i].evaluations[j].passFail eq 'NORMAL'}">selected</c:if>>보통</option>
								<option value="BAD" <c:if test="${eduList[i].evaluations[j].passFail eq 'BAD'}">selected</c:if>>미흡</option>
								<option value="WORST" <c:if test="${eduList[i].evaluations[j].passFail eq 'WORST'}">selected</c:if>>매우 미흡</option>							
								</select>
								</td>
								<td class="remarkZone"><input type="text" value="${eduList[i].evaluations[j].remark }" readonly="readonly"></td>
			
							</tr>
					
						</c:forEach>
							</c:if>
						
						
					</table>
					</c:forEach>
					</c:if>
					
				</div>
			</article>
						
			
		</section>
	<form name="addComplete">
					<input type="hidden"  name="keyword" value="addComplete">
				</form>
				<input type="hidden" id="eduScheduleSeq">
				
	</div>
	<script>
		
		var value1;
		var value2;
		var length;
		var empNoSeq;
		$(function(){
			
			$('#updateBtn').hide();
			$('#insertBtn').hide();
			$('#deleteBtn').hide();
			
		});
		
	$('.infoList').click(function(){
		
		  value1 = $(this).find(".arrayNum").val();
		  value2 = $(this).find(".seqInfo").val();
		 $('#eduScheduleSeq').val(value2);
		 var  ess = $('#eduScheduleSeq').val();
			if(ess !="" && ess != null){
				$('#updateBtn').show();
				$('#insertBtn').show();
			}
		 $except = $(this);
		 $(this).children().css('background','lightgray');
		 $('.infoList').not($except).children().css('background','white');
		  $('.articleWrapper2 .edutable:nth('+ value1 + ')').removeClass('hidden');
		 $('.articleWrapper2 .edutable').not('.articleWrapper2 .edutable:nth('+ value1 + ')').addClass('hidden');
		 var length = $(this).find(".length").val();
		 $('#amount').text(length);
	});

	$('#insertBtn').click(function(){
		
		var popup = document.addComplete;
		 window.open('','addComplete','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
		 popup.action = 'popupZone.jsp';
		 addComplete.target= 'addComplete';
		 addComplete.submit();
	});
	
	function reset(){
		location.reload(true);
		
	}
	function updateInfo(){
		var length = $('input:radio:checked').length;  
		if(length == 0){
			alert('체크 된 항목이 없습니다');
		}else{
		   alert("수정 모드 진입");
		$('input:radio:checked').parent().siblings('.selectZone').children().removeAttr('disabled');
		$('input:radio:checked').parent().siblings('.remarkZone').children().removeAttr('readonly');
		
		$('#deleteBtn').show();
		$('#updateBtn').text('저장');
		$('#updateBtn').attr('onclick','saveInfo();');
		}
	}
	
	function saveInfo(){
		var status = $('input:radio:checked').parent().siblings('.selectZone').children().val();
		var remark = $('input:radio:checked').parent().siblings('.remarkZone').children().val();
		empNoSeq = $('input:radio:checked').parent().siblings('.hiddenZone').find('.empNoSeq').val();
	
		$.ajax({
			url : 'updateCompleteInfo.edu',
			type: 'post',
			data: {
				status : status,
				remark : remark,
				value2 : value2,
				empNoSeq : empNoSeq
			},
			success: function(data){
				if(data == '1'){
					alert("업데이트 성공.");
				}else{
					alert("이유를 알수 없는 에러가 발생했습니다.");
					
				}
				reset();
			},
			error : function(){
				console.log("ERROR...");
			}
		});
		
	}
	
	function deleteInfo(){
		 empNoSeq = $('input:radio:checked').parent().siblings('.hiddenZone').find('.empNoSeq').val();
		 if(window.confirm("정말 해당 데이터를 삭제 하시겠습니까?")){
			 $.ajax({
					url : 'deleteCompleteInfo.edu',
					type: 'post',
					data: {
						value2 : value2,
						empNoSeq : empNoSeq
					},
					success: function(data){
						if(data == '1'){
							alert("삭제 성공.");
						}else{
							alert("이유를 알수 없는 에러가 발생했습니다.");
							
						}
						reset();
					},
					error : function(){
						console.log("ERROR...");
					}
				});
		 }else{
			 return;
		 }
		
	}
	</script>
	
	
	
</body>
</html>
