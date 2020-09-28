<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
</head>
<style>
section{
	width:100%;
	padding-left: 0;
	padding-right: 0;
}
#article{
	
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	height: 780px;
}
	#articleWrap{
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}
#blueBox{
	
	width: 10px;
	height: 25px;
	background: #2E2C8F;
	margin-right: 5px;
}
#infoTable{
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	
}
#infoTable td{
	height: 40px;
	border-top : 1px solid lightgray;
	font-size: 15px;
}
#infoTable td input{
	width: 100%;
	font-size: 15px;
}

.tableTitle{
	text-align: center;
	width: 20%;
}
.tableContent{
  width: 30%;
}
#buttonZone{
 width: 90%;
 margin-left: auto;
 margin-right: auto;
}
#tableBtnZone td{
	border: none;
}
#backBtn,#deleteBtn, #updateBtn{
	background : #2E2C8F;
	color: white;
	border-radius: 10px;
	border: none;
}
#backBtn,#writeBtn{
	width: 120px;
	height: 40px;
	font-size: 15px;
}
#deleteBtn, #updateBtn{
	width: 80px;
	height: 30px;
	font-size: 15px;
}
article{
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}
input[type=radio]:disabled{

}
</style>
<body>
	<c:if test="${eduNotice.status eq '비공개' }">
			<c:if test="${!fn:contains(auth,'E1') }">
				<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
			</c:if>						
	</c:if>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
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
				<p style="font-size:20px;">사내 소식</p>
				<br><br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=공지">공지사항</a>
				<br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=소식">전달사항</a>
				<br>
				<a style="background:#524FE3; color: #ffffff; text-decoration:none;" href="noticeEdu.edu">교육안내</a>
			
			</div>
		</aside>
	<section>
		<article id="article">
			<div id="articleWrap">
				<br><br>
				<span id="blueBox">`</span><label style="font-size:20px;">교육 안내</label>	
				<hr>
				<br><br>
				
				<table id="infoTable">
					<tr id="tableBtnZone">
							<td></td>					
							<td></td>
							<td></td>					
							<td align="center">
							<c:if test="${fn:contains(auth,'E2')}">
							
							<button style="float: right; margin-right: 10px;" id="deleteBtn" type="button" >삭제하기</button>
							
							</c:if>
							
							<c:if test="${fn:contains(auth,'E3')}">
							
							<button style="float: right; margin-right: 10px;" id="updateBtn" type="button">수정하기</button>
							
							</c:if>
							</td>					
					</tr>
					
					<tr>
						<td class="tableTitle">제목</td>
						<td colspan="3"><input type="text" id="eduTitle" value="${eduNotice.boardTitle }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="tableTitle">작성자</td>
						<td class="tableContent">${eduNotice.empNameKor }</td>
						<td class="tableTitle">작성일</td>
						<td class="tableContent">${fn:substring(eduNotice.enrollDate,0,10) }</td>
					</tr>
					<tr>
						<td class="tableTitle">공개여부</td>
						<td>
						<label>공개</label>&nbsp;<input style="width: 20px;" type="radio" name="status" disabled="disabled" value="공개"<c:if test="${eduNotice.status eq '공개'}">checked</c:if>>
						<label>비공개</label>&nbsp;<input style="width:20px;" type="radio" name="status" disabled="disabled" value="비공개" <c:if test="${eduNotice.status eq '비공개'}">checked</c:if>>
						<td class="tableTitle">글번호</td>
						<td class="tableContent">${eduNotice.boardNo }</td>
						
						
						
					
					<tr>
						<td class="tableTitle" style="vertical-align: top;"><p style="margin-top: 20px;">내용<p></td>
						<td class="tableContent" colspan="3" rowspan="10" style="height: 70px;">
						<textarea id="textZone" style="resize: none; width:100%; height: 400px; vertical-align: middle; margin-top:10px;"readonly="readonly">${eduNotice.boardContent }</textarea>
						</td>
						
						
					</tr>
				</table>
					<br><br>
					<div id="buttonZone" align="center">
						<button id="backBtn" onclick="back();">이전 페이지로</button>
					</div>
					<br><br>
				</div>
		</article>
		<input type="hidden" value="${eduNotice.boardContent}" id="beforeContent">
	</section>
	</div>
	
	<script>
		var boardSeq = "${eduNotice.boardSeq}";
		$('#cancleBtn').click(function(){
			if(window.confirm("정말 해당 교육을 취소하시겠습니까? 취소된 교육은 복구 할 수 없습니다.")){
				$.ajax({
					url : 'cancleEdu.edu',
					type: 'post',
					data: {eduScheduleSeq : eduScheduleSeq},
					success: function(data){
						if(data == '1'){
							alert("교육이 정상적으로 취소 되었습니다");
							location.href = "Edulist.edu";
						}else{
							alert("취소 실패 다시 시도해 주세요");
						}
						
					},
					error: function(){console.log("error...")}
				});
					
			
			}
			else{
				return;
			}
		});
		
		$('#updateBtn').click(function(){
			$('#textZone').removeAttr('readOnly');
			$('#textZone').focus();
			$('input[type=radio]').removeAttr('disabled');
			$('#eduTitle').removeAttr('readonly');
			$('#updateBtn').text('저장하기');
			$('#updateBtn').attr('onclick',"save();");
			$('#deleteBtn').text('취소하기')
			$('#deleteBtn').attr('onclick',"cancle();");
		});
		
		function cancle(){
			location.reload(true); 
		}
		function save(){
			var boardContent = $('#textZone').val();
			var boardTitle = $('#eduTitle').val();
			var status = $('input[name=status]:checked').val();
			var content = $('#beforeContent').val();
			if(boardContent == content && boardTitle == "${eduNotice.boardTitle}" && status == "${eduNotice.status}"){
				alert("수정할 내용이 없습니다.");
				return;
			}else{
			 $.ajax({
				url : 'updateEduNotice.edu',
				type: 'post',
				data: {
					boardContent : boardContent,
					boardTitle : boardTitle,
					status : status,
					boardSeq : boardSeq
				},
				success: function(data){
					if(data == '1'){
						
						location.reload(true);
					}else{
						alert("이유를 알수 없는 에러가 발생했습니다. 다시 시도해 주세요.");
					}
				},
				error: function(){
					console.log("error...")
				}
				
			}); 
			}
		}
		
		function back(){
			history.back();
		}
		
		$('#deleteBtn').click(function(){
			if(window.confirm("정말 해당 게시글을 삭제하시겠습니까?")){
				 
				$.ajax({
						url : 'removeEduNotice.edu',
						type: 'post',
						data: {

							boardSeq : boardSeq
						},
						success: function(data){
							if(data == '1'){
								
								location.href = "noticeEdu.edu";
							}else{
								alert("이유를 알수 없는 에러가 발생했습니다. 다시 시도해 주세요.");
							}
						},
						error: function(){
							console.log("error...")
						}
						
					}); 
				
			}else{
				return;
			}
			
		});
	</script>
		

	
</body>
</html>