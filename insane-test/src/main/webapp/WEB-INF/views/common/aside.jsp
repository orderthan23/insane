<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
	a:hover {
		text-decoration: none;
		cursor: pointer;
	}
	.sideBtn:hover{
		color: white;
	}
</style>
</head>
<body>
  <aside>	
        <div id="profileZone">
        	<c:if test="${empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
        	</c:if>
        	<c:if test="${!empty companyInfo.companyLogoImgPath }">
        	<img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
        	</c:if>
            <br><br>
            <p style="font-size: 17px;">${companyInfo.companyName }</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">${companyInfo.businessBigType}</p>
        </div>
        <br><br>
        <div id="sideMenu">
        
            <a class="sideBtn" style="font-size:17px;" onclick="popupMsg();">SANE CHAT</a>
            <a class="sideBtn" style="font-size:17px;" onclick="selectEmpInfo();">내 정보 보기</a>
            <a class="sideBtn" style="font-size:17px;" href="selectEmpVacation.att">휴가 신청</a>
        </div>
       	<form name="chatPop">
				<input type="hidden"  name="keyword" value="chat">
		</form>
    </aside>
    <script>
    	function popupMsg(){
    		var chat = document.chatPop;
			 window.open('','chat','top=100px, left=100px, height=700px, width=400px, menubar=no, toolbar=no' );
			 chat.action = 'popupZone.jsp';
			 chatPop.target= 'chat';
			 chatPop.submit();
    	}
    	
    	function selectEmpInfo() {
			var num = ${ sessionScope.loginUser.empNoSeq };
			location.href = "selectPersonalEmpInfo.em?num=" + num;
		}
    </script>
</body>
</html>