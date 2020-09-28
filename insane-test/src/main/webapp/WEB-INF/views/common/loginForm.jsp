<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#login-icon {
	width: 50px;
	height: 50px;
	position: absolute;
	left: 15.5%;
	padding-top: 30px;
}

#login-menu {
	position: absolute;
	right: 16%;
	bottom: 20%;
}

#imsi-sumbit {
	left: 20%;
	bottom: 20%;
	position: absolute;
	border: none;
	width: 359px;
	height: 95px;
	background: transparent;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/logoinsane.png');
	background-position: top-right;
	background-repeat: no-repeat;
}

.login-text {
	width: 200px;
	height: 25px;
	border: 1px solid lightgray;
}

#loginBtn {
	width: 229px;
	height: 27px;
	border-radius: 5px;
	border: 0px;
	background: #2E2C8F;
	text-align: center;
	color: white;
	background: #2E2C8F;
}

#company-search-btn {
	width: 20px;
	height: 20px;
	background-image:
		url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-repeat: no-repeat;
	background-size: 100%;
	border-radius: 5px;
	border: 0px;
	cursor: pointer;
	padding-top: 7px;
	margin-left: -30px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title></title>
<script type="text/javascript">
	function showPopup() {
		var companyNo;
		/* companyNo = window.open("selectAllList.cp", "a",
				"width=512, height=675, left=100, top=20"); */

		document.getElementById('input-image1').value = window.open(
				"selectAllList.cp", "a",
				"width=512, height=675, left=100, top=20");
	}
</script>
</head>
<body>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<div class="loginArea">
		<c:if test="${ empty sessionScope.loginUser }">

			<!-- 이 아래로 임시용 가입 -->
			<!-- <form action="insert.em" method="post" id="login-form">
				<table style="float: left;">
					<tr>
						<td rowspan="6"></td>
						<td colspan="4"><input type="text" class="login-text"
							name="companyNo2" placeholder="회사코드를 입력하세요."></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="20px;"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" class="login-text"
							name="empNo2" placeholder="사원번호를 입력하세요." autofocus="autofocus"></td>

					</tr>
					<tr>
						<td colspan="5"><input type="password" class="login-text"
							name="empPwd2" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td><input type="submit" id="company-btn2"></td>
					</tr>

				</table>
			</form> -->
			<!-- 이 위로 임시용 가입 -->

			<form action="login.em" method="post">
				<table id="login-menu">
					<tr>
						<td rowspan="6"><img
							src="<%=request.getContextPath()%>/resources/images/loginlogo.png"
							id="img-loginlogo"></td>
						<td colspan="4"><input type="text" class="login-text"
							id="input-image1" name="companyNo" placeholder="회사코드를 선택하세요."
							readonly></td>
						<td><input type="button" id="company-search-btn"
							onclick="showPopup();"></td>
					</tr>
					<tr>
						<td colspan="5" height="20px;"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="text" class="login-text"
							id="input-image2" name="empNo" placeholder="사원번호를 입력하세요."
							autofocus="autofocus"></td>

					</tr>
					<tr>
						<td colspan="5"><input type="password" class="login-text"
							id="input-image3" name="empPwd" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td colspan="5"><input type="submit" id="loginBtn"
							value="로그인"></td>
					<tr>
						<td><input type="checkbox"></td>
						<td><label style="font-size: 12px;">사원번호 저장</label></td>
						<td><input type="checkbox"></td>
						<td><label style="font-size: 12px;">회사코드 저장</label></td>
						<td></td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
	<c:if test="${ !empty sessionScope.loginUser }">
		<form action="logout.em" method="post">
			<input type="submit" value="임시 로그아웃">
		</form>
	</c:if>

</body>
</html>