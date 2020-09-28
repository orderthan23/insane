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
#backBtn,#saveBtn{
	background : #2E2C8F;
	color: white;
	border-radius: 10px;
	border: none;
}
#backBtn,#saveBtn{
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
			<c:if test="${sessionScope.loginUser.empNoSeq ne eduNotice.writeEmpNo }">
				<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="잘못된 경로입니다."/> </c:redirect>
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
				<form id="insertForm" method="post"  action="insertEduNotice.edu">
				
				<table id="infoTable">
				
					
					<tr>
						<td class="tableTitle">제목</td>
						<td colspan="3"><input type="text" id="eduTitle" name="title"></td>
					</tr>
					<tr>
						<td class="tableTitle">작성자</td>
						<td class="tableContent">${sessionScope.loginUser.empNameKor }</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="tableTitle">공개여부</td>
						<td>
						<label>공개</label>&nbsp;<input style="width: 20px;" type="radio" name="status"  value="공개" checked>
						<label>비공개</label>&nbsp;<input style="width:20px;" type="radio" name="status"  value="비공개">
						<td class="tableTitle"></td>
						<td class="tableContent"></td>
						
						
						
					
					<tr>
						<td class="tableTitle" style="vertical-align: top;"><p style="margin-top: 20px;">내용<p></td>
						<td class="tableContent" colspan="3" rowspan="10" style="height: 70px;">
						<textarea id="textZone"  name="content" style="resize: none; width:100%; height: 400px; vertical-align: middle; margin-top:10px; background:#f1f1f1; font-size:15px;"></textarea>
						</td>
						
						
					</tr>
				</table>
				</form>
					<br><br>
					<div id="buttonZone" align="center">
						<button id="backBtn" onclick="back();">이전 페이지로</button>
						<button id="saveBtn" type="button" onclick="save();">작성 완료</button>
					</div>
					<br><br>
				</div>
		</article>
	</section>
	</div>
	
	<script>
		function save(){
			var title=$('#eduTitle').val();
			var content = $('#textZone').val();
			
			if(title =="" || content =="" || title==null || content==null){
				alert("제목과 내용을 입력하세요");
			}else{
				$('#insertForm').submit();
			}
		}
	
	</script>
		

	
</body>
</html>