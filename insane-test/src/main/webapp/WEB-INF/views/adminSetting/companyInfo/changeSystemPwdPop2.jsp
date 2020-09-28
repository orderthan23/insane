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
		<p id="loginText">관리자 비밀번호 수정</p>
	</div>
	<br>
	<p style="text-align: center; font-size: 13px; font-weight:normal;">관리자 비밀번호를 수정하시게 되면 <br> 해당 사번으로 수정 내역이 저장 됩니다.</p>
	<br>
	<form method="post" action="startChangeSystemPwd.cp" id="loginForm">
	<table id="inputTable">
		<tr>
			<td style="text-align:right; margin-right:10px;"><label>기존 비밀번호  :</label></td>
			<td><input type="password" name="beforePwd"></td>
			
		</tr>
		<tr>
			<td style="text-align:right; margin-right:10px;"><label>새로운 비밀번호  :</label></td>
			<td><input type="password" name="newPwd"></td>
		
		</tr>
		<tr>
			<td style="text-align:right; margin-right:10px;"><label>새로운 비밀번호 확인  :</label></td>
			<td><input type="password" name="pwdCheck"></td>
		</tr>
		<tr>
			<td><input type="hidden" value="${updator}" name="updator"></td>
			<td></td>
	   </tr>
		<tr>
		
			<td colspan="2"><button class="popBtn" type="button" onclick="updatePwd();" >확인</button>&nbsp;&nbsp;
				<button class="popBtn" type="button" onclick="closePop();">취소</button>
			</td>
		</tr>
	</table>
	</form>

	<script>
		function closePop() {
			self.close();
		}

		function updatePwd() {
			var beforePwd = $('input[name=beforePwd]').val();
			var newPwd = $('input[name=newPwd]').val();
			var pwdCheck = $('input[name=pwdCheck]').val();
			console.log(beforePwd + " "  + " " + newPwd + " "+pwdCheck);
			if (newPwd == pwdCheck) {
				if (beforePwd == newPwd) {
					alert('기존 비밀번호와 새로운 비밀번호가 같습니다');
				} else {
					$
							.ajax({
								url : "updateSystemPwd.cp",
								type : 'post',
								data : {
									beforePwd : beforePwd,
									newPwd : newPwd
								},
								success : function(data) {
									console.log(data);
									switch (data) {
									case '1':
										alert("시스템 비밀번호 변경 성공! ");
										self.close();
										break;
									case '2':
										alert("비밀번호가 다릅니다.");
										break;
									case '3':
										alert("적합하지 않은 비밀번호입니다  \n 1. 영문(대소문자 구분), 숫자, 특수문자 조합 \n 2. 8~20자리 사이 문자 \n 3. 같은 문자 4개 이상 사용 불가 \n 4. 비밀번호에 ID 포함 불가 \n 5. 공백문자 사용 불가");
										break;
									case '4':
										alert("알수 없는 에러 발생!");
										break;
									}
								},
								error : function() {
									console.log('error...');
								}
							});
				}
			} else {
				alert("새로운 비밀번호와 비밀번호 확인이  같지 않습니다.");
			}
		}
	</script>
</body>
</html>