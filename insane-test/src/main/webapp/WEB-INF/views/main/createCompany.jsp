<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insane 회원생성</title>
</head>
<body>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
		<form action="insertCompany.cp" method="post">
			<h1>회사 생성기</h1>
			<table>
				<tr>
					<td><label>회사명</label><input type="text" name="companyName"></td>					
				</tr>
				<tr>
					<td><label>관리자id</label><input type="text" name="cadminId"></td>
				</tr>
				<tr>
					<td><label>관리자PW</label><input type="password" name="cadminPwd"></td>
				</tr>
			
			</table>
			<button>회사 생성</button>
		
		
	
	</form>
</body>
</html>