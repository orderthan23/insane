<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#createBtn{
		width:50px;
		height:50px;
		color:white;
		background-color:#2E2C8F;
		border-radius:5px;
	}
</style>
</head>
<body>
	<!-- String roomName = request.getParameter("roomName");
	String password = request.getParameter("password");		
	Employee emp = (Employee) request.getSession().getAttribute("loginUser"); -->
	<form method="post" action="insertRoom.ch">
		<table align="center">
			<thead></thead>
			<tbody>
				<tr>
					<td>방 이름:</td>
					<td><input type="text" name="roomName" id="roomName"></td>
					<td rowspan="2"><button id="createBtn">생성</button></td>
				</tr>
				<tr>
					<td>방 비밀번호 : </td>
					<td><input type="password" name="password" id="num"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>