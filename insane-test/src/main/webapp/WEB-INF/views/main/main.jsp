<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<style>
.blueBox {
	width: 5px;
	height: 15px;
	background: #2E2C8F;
	margin-right: 0;
	padding: 0;
	
}

section {
	width: 100%;
	height: 100%;
}

#moduleDivider {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

#moduleTd {
	width: 300px;
}

article {
	width: 350px;
	height: 200px;
	margin-bottom: 30px;
}


#profileModule p {
	margin-top: 5px;
	font-size: 12px;
}

#profileModule a {
	margin-top: 5px;
	font-size: 12px;
	font-family: "nanumSquare";
	font-weight: bolder;
}

#moduleWrap{
 width: 90%;
 margin-left: auto;
 margin-right: auto;
}

.moduleTitles {
	width: 320px;
	margin-left: auto;
	margin-right: auto;
	font-weight: bolder;
}
#noticeContents,
#newsContents{
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}
#noticeContents p,
#newsContents p {
	font-size: 11px;
}
#noticeContents td,
#newsContents td{
 width: 30px;
}

#commutingZone{
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}
.btnOn{
	background : 
}

.btnOff{
	background : 
}
.commutingBtns{
	border-radius: 5px;
	border: none;
}
#wowYaGeun{
	border: none;
	background : #2E2C8F;
	color: #ffffff;
	border-radius : 3px;
}
.moduleTitles p {
	font-size: 13px;
	font-weight: bolder;
}
#absentZone{
	display: table;
	width: 90%;
	height: 140px;
	margin-left: auto;
	margin-right: auto;
	border-radius: 5px;
	background: #C4C4C4;
	
}
#absentZone img{
	margin-top : 20px;
}
.seeMore{
	display: table-cell;
	color: lightgray;
	border: solid 1px lightgray;
	vertical-align: middle;
	background : transparent;
	border-radius: 100%;
	margin-left: 220px;
}
.boardTitles{
	width: 30%;
}
.boardTitles p{
	
  white-space: nowrap;
   overflow: hidden;
  text-overflow: ellipsis;
  width: 120px;
  height: 16px;
  text-align: left;
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
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.modalContents table td {
	height: 40px;
}

.modalContents table td label {
	font-size: 17px;
	font-weight: bolder;
	font-family: 'nanumsquare';
}
#changeBtn{
	font-size: 10px;
	margin-top: 10px;
	
	
}
</style>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<title>Home</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/nav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="../common/aside.jsp" />
		<section>
			<div id="modalArea" class="modalArea">
					<div id="modalBg" class="modalBg"></div>
					<div class="modalWrapper">
						<div class="modalContents" style="overflow-y: auto;">
							<div
								style="background: #2E2C8F; text-align: center; width: 100%; height: 30px;">
								<h1 style="margin: 0; line-height: 30px; color: white;"
									id="modalTitle">비밀 번호 변경</h1>
							</div>
							<br>
							<c:if test="${needChange == true }">
							<p>초기 비밀번호로 로그인 하셨습니다.</p>
							<br>
							<p>비밀번호 변경 후 이용 가능합니다.</p>
							<br>
							</c:if>
							<c:if test="${needChange == false }">
							<p>기존 비밀번호와 변경할 비밀번호를 입력하세요.</p>
							<br>
							</c:if>
							<div id="modalContent">
								<table>
									<tr>
										<td><label>기존 비밀번호</label></td>
										<td><input type="password" id="oldPwd"></td>
									</tr>
									<tr>
										<td><label>새로운 비밀번호</label></td>
										<td><input type="password" id="newPwd"></td>
									</tr>
									<tr>
										<td><label>비밀번호 확인</label></td>
										<td><input type="password" id="pwdCheck"></td>
									</tr>
								</table>
								
									

							</div>
							<br> <br>
							<div
								style="width: 20%; margin-left: auto; margin-right: auto; align: center;"
								id="buttonZone">
								<button style="margin-right: 10%;" type="button" id="okButton"
									onclick="changePwd();">확인</button>
								<c:if test="${needChange == false }">
								<button onclick="closeModal();">취소</button>
								</c:if>
							</div>
						</div>

					</div>
				</div>
				<br> <br>
			<table id="moduleDivider">
				<tr>
					<td class="moduleTd">
						<article id="profileModule">
						<table id="moduleWrap">
						<tr>
							<td >
								<c:if test= "${ empty requestScope.profileInfo }">
									<img src="<%=request.getContextPath()%>/resources/images/basicProfile.png" id="profilePhoto" style="margin-top: 10px;">
								</c:if>
						
								<c:if test="${!empty requestScope.profileInfo }">
									<img src="<%=request.getContextPath()%>${requestScope.profileInfo.filePath}/${requestScope.profileInfo.changeName}" id="profilePhoto" style="margin-top: 10px;">
								</c:if>	
							</td>
							
							<td colspan="2" style="text-align:left;">
								<p style="font-size: 20px; font-weight: bold"><c:out value="${ sessionScope.loginUser.empNameKor }"/>&nbsp; ${sessionScope.loginUser.positionName }</p>
								<p style="margin-top: 10px; font-size:15px; font-weight: bold;">${sessionScope.loginUser.deptName}  소속</p>
							</td>
							
						</tr>
						<tr>	
								<td><button type="button" id="changeBtn" onclick="openModal();">비밀번호 변경</button></td>
								<td><span class="iconify" data-inline="false" data-icon="mdi:email-outline" style="font-size: 20px; margin-right:40px;"></span></td>
								<td><span class="iconify" data-inline="false" data-icon="carbon:chat" style="font-size: 20px; margin-right:40px;"></span></td>
							<td><span class="iconify" data-inline="false" data-icon="mdi:checkbox-multiple-marked-outline" style="font-size: 20px;"></span></td>
								
						</tr>
						<tr>
							<td></td>
							<td><a style="margin-right:40px;">메일</a></td>
							<td> <a style="margin-right:40px;">쪽지</a></td>
							<td><a>결재</a></td>
						

				
							
						</tr>
						
						
						</table>
						</article>
					</td>
					<td class="moduleTd">
						<article>
							<br>
							<div class="moduleTitles" style="display:table; margin-bottom:5px;" >
								<div class="blueBox" style="display:table-cell;"></div>
								<p style="display:table-cell;"> 공지사항</p>
								<button class="seeMore" type="button" onclick="location.href='selectList.no?type=공지';">+</button>
							</div>
						
							 <table id="noticeContents">
							 	<c:if test="${!empty newsList.notice}">
								<c:forEach var="i" begin="0"  end="${fn:length(newsList.notice[0])-1 }">
								<tr style="text-align:center"  class="noticeList">
								
									<td class="boardTitles"><input type="hidden" value="${newsList.notice[i].boardSeq }" class="boardSeq"><p>${newsList.notice[i].boardTitle }</p></td>
									<td width="80px;"><p style="width:100%;">${newsList.notice[i].empNameKor }</p></td>
									<td width="120px;"><p style="width: 100px;">${fn:substring(newsList.notice[i].enrollDate,0,10) }</p></td>
								</tr>
								</c:forEach>
								</c:if>
							</table> 
							
						</article>
					</td>
					<td class="moduleTd"><article>
						<br>
							<div class="moduleTitles" style="display:table; margin-bottom:5px;" >
								<div class="blueBox" style="display:table-cell;"></div>
								<p style="display:table-cell; font-size:13px;">전달사항</p>
									<div style="display:table-cell;">
									<button class="seeMore" type="button" onclick="location.href='selectList.no?type=소식';">+</button>
									</div>
							</div>
							 <table id="newsContents">
							 	<c:if test="${!empty newsList.issue}">
								<c:forEach var="i" begin="0"  end="${fn:length(newsList.issue[0])-1 }">
								<tr style="text-align:center" class="noticeList">
								
									<td class="boardTitles"><input type="hidden" value="${newsList.issue[i].boardSeq }" class="boardSeq"><p>${newsList.issue[i].boardTitle }</p></td>
									<td><p>${newsList.issue[i].empNameKor }</p></td>
									<td><p style="width: 100px;">${fn:substring(newsList.issue[i].enrollDate,0,10) }</p></td>
								</tr>
								</c:forEach>
								</c:if>
							</table> 
					</article></td>
				</tr>
				<tr>
					<td colspan="2" rowspan="2" class="moduleTd"><article
							style="width: 98%; height: 440px; margin-bottom: 30px; vertical-align: middle;">
								<br>
								<p style="font-weight: bolder; font-size: 20px; margin-left: 15px;">자사 일정</p>
								<br>
								<jsp:include page="/WEB-INF/views/common/calendar.jsp"/>
								
							
							</article></td>
							<td class="moduleTd"><article>
						<br>
							<div class="moduleTitles" style="display:table; margin-bottom:5px;" >
								<div class="blueBox" style="display:table-cell;"></div>
								<p style="display:table-cell; font-size:13px;">교육안내</p>
									<div style="display:table-cell;">
									<button class="seeMore" type="button" onclick="location.href='noticeEdu.edu'">+</button>
									</div>
							</div>
							 <table id="newsContents">
								<c:if test="${!empty newsList.eduPlan}">
								<c:forEach var="i" begin="0"  end="${fn:length(newsList.eduPlan[0])-2 }">
								<tr style="text-align:center" class="eduNotice">
								
									<td class="boardTitles"><input type="hidden" value="${newsList.eduPlan[i].boardSeq }" class="boardSeq"><p>${newsList.eduPlan[i].boardTitle }</p></td>
									<td><p>${newsList.eduPlan[i].empNameKor }</p></td>
									<td><p style="width: 100px;">${fn:substring(newsList.eduPlan[i].enrollDate,0,10) }</p></td>
								</tr>
								</c:forEach>
								</c:if>
							</table> 
					</article></td>
				</tr>
				<tr>
					<td class="moduleTd">
					<article>
					<br>
					<div class="moduleTitles" style="display:table; margin-bottom:5px;" >
								<div class="blueBox" style="display:table-cell;"></div>
								<p style="display:table-cell;"> 출 퇴근</p>
							</div>
							<div id="commutingZone">
								<label style="margin-right:30px; font-size: 13px; font-weight: bolder;">출근시간</label>
									<c:if test="${ empAttHistory.attTime != null }">
										<button disabled>출근</button>
									</c:if>
									<c:if test="${ empAttHistory.attTime == null }">
										<button class="attStart">출근</button>
									</c:if>
									<c:if test="${ empAttHistory.attTime == null && empAttHistory.leaveTime == null }">
										<button class="attEnd" disabled>퇴근</button>
									</c:if>
									<c:if test="${ empAttHistory.attTime != null && empAttHistory.leaveTime == null }">
										<button class="attEnd">퇴근</button>
									</c:if>
									<c:if test="${ empAttHistory.attTime != null && empAttHistory.leaveTime != null }">
										<button disabled>퇴근</button>
									</c:if>
								<br><br>
								<div id="goodMorningTime" style="width: 200px; height: 25px; background : #FBFBFF;">
									<p id="attTimeSect"><c:out value="${ empAttHistory.attTime }"/></p>
									<%-- <c:if test="${ empAttHistory.attTime != null }">
										<p><c:out value="${ empAttHistory.attTime }"/></p>
									</c:if>
									<c:if test="${ empAttHistory.attTime == null }">
										<p>아직 출근하지 않았습니다.</p>
									</c:if> --%>
								</div>
								<br>
								<label style="margin-right:30px; font-size: 13px; font-weight: bolder;">근무시간</label>
								<br><br>
								<div id="howLongTime" style="width: 200px; height: 20px; background : #FBFBFF;  display: inline-block;">
									<p id="workTime"><c:out value="${ forWorkTime }"/></p>
								</div>
								<button   type="button" id="wowYaGeun" style="width:100px; float:right; font-size:12px;">연장근무 신청</button>
								</div>
								
					</article>
					</td>
				</tr>
			</table>
				<form name="yageun">
					<input type="hidden" name="keyword" value="yageun">
				</form>
		</section>
	</div>
	<script>
	$(function(){
		var needChange = "${needChange}";
		if(needChange == 'true'){
			openModal();
		}
	});
	function closeModal(){
		 $('#modalArea').fadeOut();
	}
	
	function openModal(i){
		
		$('#modalArea').fadeIn();
	}
	
	function changePwd(){
		var oldPwd = $('#oldPwd').val();
		var newPwd = $('#newPwd').val();
		var pwdCheck = $('#pwdCheck').val();
		
		if(newPwd != pwdCheck){
			alert('새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
		}else{
			
			$.ajax({
				url : 'changePwd.mp',
				type: 'post',
				data: {
					 oldPwd : oldPwd,
					 newPwd : newPwd
				},
				success : function(data){
					
							switch (data) {
								case '1':
									alert("비밀번호 변경에 성공");
									closeModal();
									break;
								case '2':
									alert("비번틀림");
									break;
								case '3':
									alert("적합하지 않은 비밀번호입니다  \n 1. 영문(대소문자 구분), 숫자, 특수문자 조합 \n 2. 8~20자리 사이 문자 \n 3. 같은 문자 4개 이상 사용 불가 \n 4. 비밀번호에 ID 포함 불가 \n 5. 공백문자 사용 불가");
									break;
								case '4':
									alert("알수 없는 에러발생 다시 시도해주세요.");
									break;
								}

							},
							error : function() {
								console.log("Error...");
							}

						});
			}

		}

	
	
	   $('.eduNotice').click(function(){
		   var eduBoardSeq =  $(this).find('.boardTitles').find('.boardSeq').val();
		   location.href = "eduNoticeDetail.edu?boardSeq="+eduBoardSeq;
	   });
	
	   $('.noticeList').click(function(){
		   var noticeBoardSeq =  $(this).find('.boardTitles').find('.boardSeq').val();
		   location.href = "selectOne.no?num="+noticeBoardSeq;
	   });	
	   
	   


	$(".attStart").click(function(){
		
		$.ajax({
			url:"updateAttTime.att",
			type:"post",
			success:function(data){
				$("#attTimeSect").text(data.attTime);
				$(".attStart").attr('disabled', true);
				$(".attEnd").attr('disabled', false)
			},
			error:function(data){
				console.log("에러 : " + data.attTime);
			}
		});
	});
			
	$(".attEnd").click(function(){
		
		if(confirm("퇴근하시겠습니까?")){
			
			$.ajax({
				url:"updateLeaveTime.att",
				type:"post",
				success:function(data){
					console.log(data.workTime);
					$("#workTime").text(data.workTime);
					$(".attEnd").attr('disabled', true)
				},
				error:function(data){
					console.log("에러 : " + data.workTime);
				}
			});
		} else{
			
		}
	});
	
	
	$('#wowYaGeun').click(function(){
		var yageunPop = document.yageun;
		 window.open('','yageun','top=100px, left=100px, height=600px, width=800px, menubar=no, toolbar=no' );
		 yageunPop.action = 'popupZone.jsp';
		 yageun.target= 'yageun';
		 yageun.submit();
	});

	</script>


</body>
</html>
