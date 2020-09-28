<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	width: 100%;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/loginBackground.png');
	background-repeat: no-repeat;
	background-position: bottom 125% center;
	background-color: white;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

#login-icon {
	width: 50px;
	height: 50px;
	position: absolute;
	left: 15.5%;
	padding-top: 30px;
}

.login-logo {
	width: 359px;
	height: 95px;
	position: absolute;
}

#login-logo1 {
	left: 20%;
	padding-top: 7px;
}

/* #login-logo2 {
	left: 20%;
	bottom: 20%;
} */
#imsi-sumbit {
	left: 20%;
	bottom: 20%;
	position: absolute;
	border: none;
	width: 359px;
	height: 95px;
	background:transparent;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/logoinsane.png');
	background-position: top-right;
	background-repeat: no-repeat;
}

#login-menu {
	position: absolute;
	right: 16%;
	bottom: 20%;
}

.login-text {
	width: 200px;
	height: 25px;
	border: 1px solid lightgray;
}

.login-btn {
	width: 232px;
	height: 27px;
	border-radius: 5px;
	border: 0px;
	background: #2E2C8F;
	text-align: center;
	color: white;
	background: #2E2C8F;
}

#login-phrase {
	width: 245px;
	height: 180px;
	position: absolute;
	left: 21.5%;
	top: 35%;
}

#input-image1 {
	background-image:
		url('<%=request.getContextPath()%>/resources/images/companyLogo.png');
	background-repeat: no-repeat;
	background-position: 5px center;
	padding-left: 25px;
}

#input-image2 {
	margin-bottom: 3px;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/empLogo.png');
	background-repeat: no-repeat;
	background-position: 5px center;
	padding-left: 25px;
}

#input-image3 {
	background-image:
		url('<%=request.getContextPath()%>/resources/images/pwlockLogo.png');
	background-repeat: no-repeat;
	background-position: 5px center;
	padding-left: 25px;
}

#company-btn {
	width: 20px;
	height: 20px;
	background-image:
		url("<%=request.getContextPath()%>/resources/images/lensBtn.png");
	background-repeat: no-repeat;
	background-size: 100%;
	border-radius: 5px;
	border: 0px;
	cursor: pointer;
	padding-top: 5px;
	margin-left: -20px;
}
</style>
<title>EveryWhere, Smart HR Works, Solution :: I N S A N E</title>
</head>
<body>
	<jsp:include page="../common/loginForm.jsp" />
	<img src="<%=request.getContextPath()%>/resources/images/INSANE.png"
		id="login-icon">

	<img
		src="<%=request.getContextPath()%>/resources/images/logoinsane.png"
		class="login-logo" id="login-logo1">

	<img
		src="<%=request.getContextPath()%>/resources/images/catchPhrase.png"
		id="login-phrase">

	<form action="imsiCreate.cp" method="post">
		<input type="submit" id="imsi-sumbit" value="">
	</form>
	<%-- <img src="<%=request.getContextPath()%>/resources/images/logoinsane.png"
				id="login-logo2" class="login-logo"> --%>
	
</body>
</html>