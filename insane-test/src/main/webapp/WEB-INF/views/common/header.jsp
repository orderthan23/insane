<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
       <a id="department">
       <c:if test="${ loginUser['class'].simpleName eq 'Employee'}">${loginUser.deptName }</c:if>
       <c:if test="${ loginUser['class'].simpleName eq 'CompanyAccount' }">시스템 계정</c:if>
       </a>
       <c:if test="${ loginUser['class'].simpleName eq 'Employee'}"><a id="userName">${loginUser.empNameKor } 님 </a></c:if>
      	
      	  
       
      
       <a id="homeButton">홈</a>
       <a id="logoutButton" onclick="areyouLogout();">로그아웃</a> 
    </header>
    <script>
    	function areyouLogout(){
    		if(window.confirm('로그아웃 하시겠습니까?')){
    			location.href = 'logout.em';
    		}else{
    			return;
    		}
    		
    	}
    	function childLogout(){
    		alert('로그아웃 처리되었습니다');
    		location.href = 'logout.em';
    	}
    </script>
</body>
</html>