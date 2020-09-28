<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
<title>Insert title here</title>
</head>
<style>
	#sampleWrap{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		
	}
	#sampleTitle{
		width: 100%;
		text-align: left;
	}
	#sampleTitle label {
		padding : 0;
		margin : 0;
		font-size: 20px;
	
	}
	#blueRect{
		display: inline-block;
		width: 10px;
		height: 20px;
		background:#2E2C8F;
		color:#2E2C8F;
		margin: 0;
		
	}
	#sampleTable{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
	}
	#sampleTable{
		font-weight: normal;
		font-size: 15px;
		font-family: san-serif;
	}
	#searchBtn{
		background: #2E2C8F;
		color: white;
		border:none;
		height: 21px;
		border-radius: 3px;
	}
	#sampleTable tr td{
		height: 50px;
		border-bottom: 1px solid lightgray;
	}
	
	article{
		height: 750px;
		overflow-y : auto;
	}
	#textAreaZone td{
		padding: 0;
		
	}
	#textAreaZone{
	padding-bottom: 0;
	}
	
	#saveBtn{
		color: white;
		background: #2E2C8F;
		border: none;
		border-radius: 5px;
		height: 40px;
		font-size: 15px;
		
		
	}

</style>
<body>

		<c:if test="${!fn:contains(auth,'EP1') }">
				<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
		</c:if>			
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp"/>
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
				<a style="background:#524FE3; color: #ffffff; text-decoration:none;" href="Edulist.edu">교육일정관리</a>
				<br>
				<a style="text-decoration:none; color:white;" href="moveEduAssessment.edu">교육이수내역</a>
			
			</div>
		</aside>
	<section>
		<article>
	<div id="sampleWrap" align="center">
		<br><br>
		<div id="sampleTitle">
			<span id="blueRect"></span><label>교육일정 생성</label>
			<br><br>
			<hr>
			
			
		</div>
		<br>
		<form id="eduForm" method="post" action="insertEducationPlan.edu">
		
		<table id="sampleTable">
			<tr>
				<td width="10%">교육제목</td>
				<td colspan="3" ><input type="text" style="width:85%;" name="eduTitle"></td>
			</tr>
			<tr>
				<td width="10%">교육코드</td>
				<td width="40%"><input type="text" readonly="readonly" width="100%" id="educationSeq" name="educationSeq" >&nbsp;<button type="button" id="searchBtn">검색</button></td>
				<td width="10%">교육종류</td>
				<td width="40%"><input type="text" readonly="readonly" width="100%" id="educationType" name="educationType"></td>
			</tr>
			<tr>
				<td width="10%">교육기간</td>
				<td width="90%" colspan="3"><input type="date" name="eduStartDate"  style="margin-right: 80px; width:30%;"><label style="font-size:23px;"> ~</label> <input type="date" name="eduEndDate"  style="margin-left: 80px; width:30%;"></td>
			</tr>
			<tr>
				<td>교육장소</td>
				<td><input type="text" name="eduPlace"></td>
				<td>대상인원</td>
				<td><input type="text" name="targetAmount"></td>
			</tr>
			<tr>
				<td width="10%">담당강사</td>
				<td width="40%"><input type="text" name=instrInfo></td>
				<td width="15%">사내외 구분</td>
				<td width="35%"><select style="width:50px;" name="inOfficeYn">
					<option value="Y">사내</option>				
					<option value="N">사외</option>				
				</select></td>
			</tr>
			<tr>
				<td>교육비</td>
				<td><input type="text" name="eduCost"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td style="vertical-align: top;">교육내용</td>
				<td colspan="3">
					<br>
					<textarea name="eduContent" style="background:#f1f1f1; resize: none; width: 90%; height: 400px;"></textarea>
					<br><br>
				</td>
			</tr>
		</table>
		</form>
		<br>
		<div id="btnZone" align="center">
				<button type="button"  id="saveBtn">교육일정 저장</button>
		</div>
		<br><br>
		<form name="eduCodePop" id="eduCodePop">
			<input type="hidden" value="eduCodePop" name="keyword">
		</form>
	</div>
	</article>
	</section>
	</div>
	<script>
			$('#searchBtn').click(function(){
				var eduCodePoper = document.eduCodePop;
				 window.open('','eduCodePop','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
				 eduCodePoper.action = 'popupZone.jsp';
				 eduCodePop.target= 'eduCodePop';
				 eduCodePop.submit();
			});
			
			$('#saveBtn').click(function(){
				$('#eduForm').submit();
			});
			
		
	</script>
</body>
</html>