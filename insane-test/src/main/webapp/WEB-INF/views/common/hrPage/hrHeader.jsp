<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
       <a id="companyName">${companyInfo.companyName }</a>
       <a id="department"> ${loginUser.empNameKor} ${loginUser.positionName}</a>
       <a id="logoutButton" onclick="areyouLogout();">로그아웃</a>
    </header>
    <script>
    	function areyouLogout(){
    		if(window.confirm('로그아웃 하시겠습니까?')){
    	/* 		if(opener.parent != null){
    				opener.parent.childLogout();
    			 self.close();
    			}else{
    				location.href = "logout.em";
    			}    			  */
    			location.href = "logout.em";
    			
    		}else{
    			return;
    		}
    		
    	}
    </script>
</body>
</html>