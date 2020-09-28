<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
</head>
<style>
#sideMenu2{
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}
section {
	width: 100%;
	height: 100%;
}

article {
	width: 90%;
	height: 700px;
	margin-left: auto;
	margin-right: auto;
}

#headTitles {
	display: table;
	width: 20%;
	margin-left: 15px;
}

#blueSquare {
	width: 10px;
	height: 10px;
	background: #2E2C8F;
	display: table-cell;
}

#titles {
	display: table-cell;
	margin-left: 15px;
	font-size: 18px;
	font-weight: bolder;
}

#approvingBoard{
	width: 90%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}
.boardHeaders{
	background: #2E2C8F;
	border-collapse: collapse;
	color: white;
	font-weight: lighter;
	border: none;
	outline: none;
	margin-right: 0px;
	font-size: 13px;
	height: 25px;
	border-right: none;
	border-bottom: none;
	padding: 0;
	

}

#titleTr{
	background: black;
	border-collapse: collapse;

}
.boardResources td{
	border-bottom: 1px solid lightgray;
	border-collapse: collapse;
	background: white;
		
}
.boardResources td p {
	margin: 10px;
	vertical-align: middle;
	font-size: 12px;
}
#pagingArea{
	width: 40%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#pagingArea button{
	border-radius: 5px;
	color: white;
	background: #2E2C8F;
	border: none;
}

	

.pagingBtns{
	margin-right: 5px;
	margin-left: 5px;
	font-size: 15px;
	font-weight: bolder;
}
.pagingBtns:hover{
	color: #2E2C8F;
}
aside a{
	font-weight: normal;
	
}
#sideMenu2 a:hover,
#write:hover{
  font-weight: bolder;
}
#write{
	color: white;
	font-weight: normal;
	font-size: 15px;
	padding:3px;
	text-align: center;"
}
#sideMenu2 a{
	text-decoration:none;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />

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
        <br><br>
     
         <div style="width: 100%;" align="center">
            <a style="font-size: 20px; color:white;">전자 결재</a>
            </div>
           
         
         
       
         <div id="sideMenu2">
         	
         	<a href="writeApproval.app"  id="write">결재 작성&nbsp;  <span class="iconify" data-inline="false" data-icon="bi:pencil-square" style="font-size: 20px;  vertical-align: middle;"></span></a>
         	<br>
            <a href="waitAppro.app"  style="color: #ffffff; ">결재대기함</a>
            <a href="successApproval.app"  style="color: white;">승인내역</a>
            <a href="rejectApproval.app"  style="color: white;">반려내역</a>
            	
           	
            <a href="tempApproval.app"  style="color: white; margin-top:50px;">임시저장</a>
            <a href="outgoingApproval.app"  style="color: white;  background: #524FE3; font-weight:bolder">발신함</a>
           
        </div>
         
        
    </aside>
    	 
		<section>
			<article>
				<br>
				<div id="headTitles">
					<div id="blueSquare"></div>
					&nbsp;
					<p id="titles">발신함</p>
				</div>

				<hr noshade="noshade" style="margin-top: 10px; margin-bottom: 40px;">
				
				<table id="approvingBoard">
					<tr id="titleTr">
						
						<td class="boardHeaders" width="10%">번호</td>
						<td class="boardHeaders" width="50%">제목</td>
						<td class="boardHeaders" width="15%">수신자</td>
						<td class="boardHeaders" width="25%">작성일자</td>
					</tr>
					<c:forEach var="i" begin="0"  end="10">
					<tr class="boardResources">
						<td><p>${i+102}</p></td>
						<td><p>린가드 ${i}번째 골</p></td>
						<td><p>${i}재형</p></td>
						<td ><p>2020.08.${i}</p><td>
					</tr>
					</c:forEach>
				</table>
				<br><br>
					<!-- paging area -->
					<div id="pagingArea">
						<button>이전</button>
						<c:forEach var="i" begin="1"  end="5">
							<c:if test="${i eq 5 }">
							<a class="pagingBtns">${i}</a>
							</c:if>
							<c:if test="${i ne 5 }">
								<a class="pagingBtns">${i} &nbsp;|</a>
							</c:if>
						</c:forEach>
						<button>다음</button>
					</div>
			</article>
		</section>
	</div>




</body>
</html>