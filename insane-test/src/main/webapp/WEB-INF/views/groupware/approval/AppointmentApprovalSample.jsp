<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#sampleWrap{
		width: 100%;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid gray;
	}
	#sampleTitle{
		width: 100%;
		text-align: center;
	}
	#sampleTitle p {
		padding : 0;
		margin : 0;
		font-size: 20px;
	}
	#sampleTable{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
	}
	#sampleTable{
		font-weight: normal;
		font-size: 15px;
		font-family: san-serif;
	}
	#searchBtn{
		background: #2E2C8F;
		color: white;
		border:none;
		height: 21px;
		border-radius: 3px;
	}
	#sampleTable tr td{
		height: 50px;
	}
	

</style>
<body>
	<div id="sampleWrap" align="center">
		<br>
		<div id="sampleTitle">
			<p>발령명령서</p>
			
		</div>
		<br>
		<table id="sampleTable">
			<tr  style="border-bottom:none;" >
				<td width="10%">사원번호</td>
				<td width="40%"><input type="text" readonly="readonly" width="100%" id="empNo" >&nbsp;<button type="button" id="searchBtn1">검색</button>
					<input type="hidden" id="empNoSeq">
				</td>
				<td width="10%">이름</td>
				<td width="40%"><input type="text" readonly="readonly" width="100%" id="empNameKor"></td>
			</tr>
			<tr  style="border-bottom:none;">
				<td>근무지역</td>
				<td><input type="text" id="locationName">
					<input type="hidden" id="empLocationCode">
				</td>
				<td>근무부서</td>
				<td><input type="text" id="deptName">
					<input type="hidden" id="empDeptCode">
				</td>
			</tr>
			<tr>
				<td width="10%">발령명칭</td>
				<td width="40%"><input type="text"></td>
				<td width="15%">직책</td>
				<td width="35%"><input type="text" readonly="readonly" width="100%" id="educationSeq" >&nbsp;<button type="button" id="searchBtn2">검색</button></td>
				
			</tr>
			<tr>
				<td>직급</td>
				<td><input type="text" readonly="readonly" width="100%" id="educationSeq" >&nbsp;<button type="button" id="searchBtn3">검색</button></td>
				<td>적용일자</td>
				<td><input type="date"></td>
			</tr>
			<tr>
				
				<td colspan="4" rowspan="2" style="border-bottom:none;">
					<br>
					<textarea style="width: 100%; height: 400px; resize: none; overflow-y:auto;"></textarea>
				</td>
			</tr>
		</table>
		<br><br>
		<form name="empNoPop" id="empNoPop">
			<input type="hidden" value="addEmp" name="keyword">
		</form>
	</div>
	<script>
			$('#searchBtn1').click(function(){
				var empNoPoper = document.empNoPop;
				 window.open('','empNoPop','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no');
				 empNoPoper.action = 'popupZone.jsp';
				 empNoPop.target= 'empNoPop';
				 empNoPop.submit();
			});
			
			$('#searchBtn2').click(function(){
				var eduCodePoper = document.eduCodePop;
				 window.open('','eduCodePop','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
				 eduCodePoper.action = 'popupZone.jsp';
				 eduCodePop.target= 'eduCodePop';
				 eduCodePop.submit();
			});
			
			$('#searchBtn3').click(function(){
				var eduCodePoper = document.eduCodePop;
				 window.open('','eduCodePop','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
				 eduCodePoper.action = 'popupZone.jsp';
				 eduCodePop.target= 'eduCodePop';
				 eduCodePop.submit();
			});
			
		
	</script>
</body>
</html>