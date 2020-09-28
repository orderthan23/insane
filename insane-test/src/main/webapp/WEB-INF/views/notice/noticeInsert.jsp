<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		width:150px;
		height:40px;
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
		float:right;
	}
	
	#upload_FileBtn{
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
	
	#btnInsert{
		position:absolute;
		left:35%;
		bottom:20px;
	}
	
	#btnCancle{
		position:absolute;
		left:50%;
		bottom:20px;
	}				
	
	[contenteditable=true]{
		outline:none;
		font-style:normal;
		font-weight:normal;
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
				<a style=" background:#524FE3; text-decoration:none; color:white;" href="selectList.no?type=공지">공지사항</a>
				<br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=소식">전달사항</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="noticeEdu.edu">교육안내</a>
			</div>
		</aside>
		
	<c:if test="${!fn:contains(auth,'N1') }">
			<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
	</c:if>
	<div class="section">
		<br>
		<div class="bluerect"></div><span id="pageTitle">공지사항 작성</span><br><br>
		<hr>
		<br><br>		
		<form action="insert.no" method="post" enctype="multipart/form-data">
		<input type="hidden" class="type" name="type" value="공지">
		<div class="boardArea">
			<table id="boardTable">
				<thead>
					<th width="100">제목</th> 
					<th colspan="2"><input type="text" name="boardTitle" style="width:300px"></th>
				</thead>
				<tbody>
					<tr>
						<td>공개여부</td>
						<td><input type="radio" id="public" name="access" value="공개" checked> <label for="public">공개</label></td>
						<td><input type="radio" id="private" name="access" value="비공개"> <label for="private">비공개</label></td>
					</tr>
					<tr>
						<td colspan="3"><div id="customBoard" style="text-align:left;">
							<cite contenteditable="true" class="textArea"></cite>
							<textarea id="txtArea" name="txtHistory" rows="10" cols="10" style="display:none;"></textarea>
						</div>
						</td>
					</tr>
					<tr>
						<td>이미지첨부</td>
						<td colspan="2"><button id="upload_btn" type="button" onclick="uploadImg();">파일첨부</button></td>						
						<input id="upload_img" type="file" accept=".gif, .jpg, .png" style="display:none;" onchange="upload_event(this);">
					</tr>
					<tr>
						<td>파일첨부</td>
						<td><input id="fileName" name="attachFile" type="text" readonly></td>	
						<td><button id="upload_FileBtn" type="button" onclick="fileUpload();">파일첨부</button></td>
						<!-- <td><div id="upload_btn" align="center" onclick="upload_img();"><span>파일첨부</span></div></td> -->
						<td><input id="upload_File" name="uploadFile" type="file" style="display:none;" onchange="upload_fileEvent(this);"></td>
					</tr>
				</tbody>		
			</table>			
			<c:if test="${fn:contains(auth,'N1')}">
				<button id="btnInsert" onclick="insertCheck();">등록하기</button>
			</c:if>
				<button id="btnCancle" type="button" onclick="goToMain();">취소</button>
			<br><br><br><br><br>
		</div>
		</form>
	</div>
	
	<script>		
	function uploadImg(){
		$("#upload_img").click();
	}
	
	function upload_event(object){		
		
		var img = $("<img>");
		if(object.files && object.files[0]){			
			var reader = new FileReader();
			
			if(object.files[0].type.indexOf("image") != -1){
				reader.onload = function(e){	
					
					img.attr("src", e.target.result);						
				}
			} /* else{
				var filePath = object.value;
				var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
				
				$("#fileName").val(fileName);
			} */
			
			reader.readAsDataURL(object.files[0]);
		}
		
		$(".textArea").append(img);
	}
	function insertCheck(){		
		$("#txtArea").html($(".textArea").html());		
	}
	
	function fileUpload(){
		$("#upload_File").click();
		
		$("#upload_File").change(function(){
            $("#fileName").val($("#upload_File").val().replace("C:\\fakepath\\", ""));
        });
	}
	
	function upload_fileEvent(object){
		if(object.files && object.files[0]) {			
			var reader = new FileReader();
			
			/* reader.onload = function(e){	
				
				img.attr("src", e.target.result);						
			} */
			
			var filePath = object.value;
			var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);				
			$("#fileName").val(fileName);
			
			reader.readAsDataURL(object.files[0]);				
		}
		
	}
	
	function goToMain() {
		var type = $("#type").val();
		location.href="${pageContext.request.contextPath}/selectList.no?type=" + type;
	}
	/* function textAreaClick(){
		$("#customBoard").click(function(){
			$(".textArea").select();
		})
	} */
	</script>
	
</body>
</html>