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
	.section{
		display:inline-block;
		overflow:hidden;
		width:1000px;
		height:750px;
		background:white;
		position:absolute;
		top:150px;
		left:300px;		
		border-radius:20px;
		overflow-y: auto;
	}
	
	.bluerect{
		display:inline-block;		
		width:15px;
		height:30px;
		background-color:#2E2C8F;
		position:relative;
		top:5px;
		left:20px;
	}	
	
	button{
		color:white;
		width:100px;
		height:30px;
		background-color:#2E2C8F;
		border-radius:5px;
		
	}
	
	#pageTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#boardTable{
		margin:auto auto;
		text-align:center;
		border-collapse:collapse;	
		line-height:2;	
	}
	
	#boardTable th{
		border-bottom:1px solid lightgray;
		border-top:1px solid lightgray;
	}
	
	#boardTable td{
		border-bottom:1px solid lightgray;
	}
	
	#customBoard{
		width:500px;
		height:400px;
		border:1px solid lightgray;		
		border-radius:5px;
		font-size:13px;
		font-weight:normal;
		text-align:left;
		overflow:auto;
	}
	
	#upload_btn{
		width:80px;
		height:20px;
		vertical-align:center;
		display:inline-block;
		border:1px solid black;
		margin-top:8px;		
		font-weight:normal;
		font-size:13px;
	}
	
	#upload_btn:hover{
		cursor:pointer;
	}
	
	#btnUpdate{
		position:absolute;
		left:33%;
		bottom:40px;
		
	}
	
	#btnMenu{
		position:absolute;
		left:46%;
		bottom:40px;
	}			
	#btnDelete{
		position:absolute;
		left:59%;
		bottom:40px;
		
	}	
		
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
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
				<a style="background:#524FE3; text-decoration:none; color:white;" href="selectList.no?type=공지">공지사항</a>
				<br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=소식">전달사항</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="noticeEdu.edu">교육안내</a>
			</div>
		</aside>
	
	<div class="section">
		<br>
		<div class="bluerect"></div><span id="pageTitle">공지사항 보기</span><br><br>
		<hr>
		<br><br>		
		<form id="detailForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" id="type" value="${ requestScope.notice.boardType }">
		<input type="hidden" name="num" id="boardSeq" value="${ requestScope.notice.boardSeq }">
		<input type="hidden" id="attachSeq" value="${ requestScope.attachment.attachSeq }">
		<div class="boardArea">
			<table id="boardTable">
				<thead>
					<th width="100">제목</th> 
					<th colspan="2" width="300" style="text-align:left;">${ requestScope.notice.boardTitle }</th>
				</thead>
				<tbody>
					<tr>
						<td>공개여부 : </td>
						<td style="text-align:left;"><label style="color:#2E2C8F">${ requestScope.notice.status }</label></td>
						<td style="text-align:right;">${ requestScope.notice.writerNo }</td>
						<!-- <td><input type="radio" id="public" name="access" value="공개"> <label for="public">공개</label></td>
						<td><input type="radio" id="private" name="access" value="비공개"> <label for="private">비공개</label></td> -->
					</tr>
					<tr>
						<td colspan="3"><div id="customBoard" style="text-align:left;">${ requestScope.contents }</div></td>
					</tr>					
					<tr>
						<td>첨부파일</td>
						<td><input type="text" value="${ requestScope.attachment.originName }" readonly;></td>
						<c:if test="${ !empty requestScope.attachment }">
							<td><button type="button" onclick="downloadFile();">다운로드</button></td>
						</c:if>
						<c:if test="${ empty requestScope.attachment }">
							<td><button type="button" onclick="downloadFile();" disabled>다운로드</button></td>							
						</c:if>
					</tr>
				</tbody>		
			</table>
				<c:if test="${fn:contains(auth,'N2')}">
					<button id="btnUpdate" type="button" onclick="goToUpdate();">수정하기</button>
				</c:if>
				<button id="btnMenu" type="button" onclick="goToMain();">메뉴로가기</button>
				<c:if test="${fn:contains(auth,'N3')}">
					<button id="btnDelete" type="button" onclick="deleteNotice();">삭제하기</button>
				</c:if>
			<br><br><br><br><br>
		</div>
		</form>
	</div>
	
	<script>	
		function downloadFile(){
			<%-- "location.href='<%=request.getContextPath()%>/download.tn?num=<%=titleImg.getFid()%>'" --%>
			var num = $("#attachSeq").val();
			
			location.href="${pageContext.request.contextPath}/download.no?num=" + num;
		}
		
		function goToUpdate() {
			//var num = $("#boardSeq").val();			
			//location.href="${pageContext.request.contextPath}/select.no?num=" + num;
			
			$("#detailForm").attr("action", "${pageContext.request.contextPath}/select.no")
			$("#detailForm").submit();
		}
		
		function deleteNotice(){
			//var num = $("#boardSeq").val();
			$("#detailForm").attr("action", "${pageContext.request.contextPath}/delete.no")
			$("#detailForm").submit();
			
			//location.href="${pageContext.request.contextPath}/delete.no?num=" + num + "&type=" + type;
		}
		function goToMain() {
			var type = $("#type").val();
			location.href="${pageContext.request.contextPath}/selectList.no?type=" + type;
		}
	</script>
	
</body>
</html>