<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	#contentWrapper{
		width: 90%;
		margin-left : auto;
		margin-right : auto;
	}
	#errorTitle{
		width: 100%;
		height: 40px;
		background: #2E2C8F;
	}
	#logo{
		
		width: 450px;
	}
	#backBtn{
		background: #2E2C8F;
		color : white;
		font-weight: bold;
		width: 250px;
		height: 60px;
		font-size: 23px;
		border: none;
		border-radius: 10px;
	}
</style>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<title>INSANE :: Blocked Access To the page Cause Critical Error.</title>
</head>
<body>
	<div id="errorTitle"></div>
	<div id="contentWrapper" align="center">
	<br><br>
	<img src="<%=request.getContextPath()%>/resources/images/logoinsane.png" id="logo">
	<br><br>
	<span class="iconify" data-inline="false" data-icon="el:ban-circle" style="color: #fd0b0b; font-size: 200px;"></span>
	<br>
	<p style="font-size: 30px; font-weight: bolder; color: red;">Detected Runtime Exception </p>
	<p style="font-size: 30px; font-weight: bolder; color: #2E2C8F;">The Reason</p>
	<h1 align="center"> <c:out value="${ msg }" /></h1>
	<br><br>
	<button type="button" onclick="goBack();" id="backBtn">이전 페이지로</button>
	</div>
	<script>
		function goBack(){
			history.back();
		}
	</script>
</body>
</html>