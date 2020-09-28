<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#popTitle{
		width: 100%;
		top: 0px;
		background: #2E2C8F;
		height: 60px;
		left: 0px;
		
	}
	#popTitle p{
		text-align: center;
		font-size: 25px;
		color: white;
		padding: 0;
		margin: 0;
		line-height: 60px;
		font-weight: bolder;
	
	}
	
	#popTable{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		border-collapse: collapse;
	}
	#popTable tr td{
		border-bottom: 1px solid lightGray;
		font-weight: lighter;
	}
	#popTable tr th{
		background: #2E2C8F;
		color: white;
		font-size: 18px;
		height: 40px;
	}
	#btnZone{
		width: 90%;
		margin-right: auto;
		margin-left: auto;
		margin-bottom: 15px;
	}
	#choiceBtn{
		float: right;
		width: 60px;
		height: 25px;
		color: white;
		border-radius: 5px;
		border: none;
		background: #2E2C8F;
	}
	
	
</style>
<title>INSANE :: 교육 코드 조회 서비스</title>
</head>

<body>
	<div id="popTitle">
		<p>교육코드 조회</p>
	</div>
	<br><br>
	<div id="btnZone">
		<button id="choiceBtn" type="button">확인</button>
	</div>
	<br>
	<table id="popTable">
		
		<tr>
				
			<th width="25%" colspan="2">코드번호</th>
			<th width="75%">교육타입</th>
		</tr>
		
		<c:forEach var="i" begin="0" end="${fn:length(eduCodeList)-1 }">
		<tr>
			<td ><input type="radio" name="check"></td>
			<td style="border-right: 1px solid lightgray; text-align:left; ">${eduCodeList[i].educationSeq }</td>
			<td style="background: #F1F1F1;">${eduCodeList[i].educationType }</td>
			
		</tr>
		</c:forEach>
	</table>
	<script>
		$('#choiceBtn').click(function(){
			var length = $('input[type=radio]:checked').length;
			
			if(length != 1){
				alert("원하는 항목을 체크해 주세요");
			}else{
				var code = $('input[type=radio]:checked').parent().next().text();
				var type = $('input[type=radio]:checked').parent().next().next().text();
				
				$("#educationSeq", opener.document).val(code);
				$("#educationType", opener.document).val(type);
				self.close();
			}
			
		});
	</script>
</body>
</html>