<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	#popHeader{
		width: 100%;
		height: 40px;
		background: #2E2C8F;
	}
	#popTitle{
		width: 90%;
		margin-right: auto;
		margin-left: auto;
		text-align : center;
	}
	#logoImg{
		width: 80%;
		margin-right: auto;
		margin-left: auto;
	}
	#loginText{
		text-align : center;
		font-size: 23px;
		font-weight : bolder;
	}
	body{
		background : white;
	}
	#inputTable{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	#inputTable tr td{
		width: 100%;
		text-align : center;
		height : 45px;
		vertical-align: middle;
	}
	.popBtn{
		border: none;
		border-radius: 10px;
		font-family: 'nanumSquare';
		font-size: 13px;
		font-weight: normal;
		background: #2E2C8F;
		color: white;
		width: 70px;
		height: 40px;
	}
</style>
<body>
	<div id="popHeader"></div>
	<br><br>
	<div id="popTitle">
		<img src="<%=request.getContextPath()%>/resources/images/logoinsane.png" id="logoImg">
		<br><br>
		<p id="loginText">로그인</p>
	</div>
	<br>
	<p style="text-align: center; font-size: 13px; font-weight:normal;">관리자 비밀번호를 수정하시게 되면 <br> 해당 사번으로 수정 내역이 저장 됩니다.</p>
	<br>
	<form method="post" action="startChangeSystemPwd.cp" id="loginForm">
	<table id="inputTable">
		<tr>
			<td><label>사원번호  :</label>&nbsp;&nbsp;<input type="text" id="userId" name="userId"></td>
			
		</tr>
		<tr>
			<td><label>비밀번호  :</label>&nbsp;&nbsp;<input type="password" id="userPwd" name="userPwd"></td>
		
		</tr>
		<tr>
			<td><input type="hidden" name="updator"></td>
		</tr>
		<tr>
			<td><button class="popBtn" type="button" onclick="loginCheck();" >확인</button>&nbsp;&nbsp;
				<button class="popBtn" type="button" onclick="closePop();">취소</button>
			</td>
		</tr>
	</table>
	</form>
	
	<script>
		function closePop(){
			self.close();
		}
		
		function loginCheck(){
			var userId = $('#userId').val();
			var userPwd = $('#userPwd').val();
			$.ajax({
				url : "changeSystemPwdLogin.cp",
				type: 'post',
				data: {
					userId: userId,
					userPwd: userPwd
				},
				success: function(data){
					if(data > 0){
						alert("로그인 성공");
						$('input[name=updator]').val(data);
						$('#loginForm').submit();
					}
					else if(data == -1){
						alert('권한이 없습니다.');
						self.close();
					}
					else{
						alert("로그인 실패 다시 시도해주세요");
					}
				},
				error: function(){
					console.log('error...');
				}
			});
		}
	</script>
</body>
</html>