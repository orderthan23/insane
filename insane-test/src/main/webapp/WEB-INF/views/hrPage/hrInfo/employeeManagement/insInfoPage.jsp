<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#insInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#insInfoTable th {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#insInfoTable td {
		font-weight: 400;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
</style>
</head>
<body>
	<table id="insInfoTable">
		<thead>
			<tr>
				<th width="80px;"></th>
				<th width="120px;">입사일자</th>
				<th width="150px;">가입만료일자</th>
				<th width="120px;">가입일자</th>
				<th width="80px;">가입완료 버튼</th>
			</tr>
		</thead>
		<tbody>
			<tr id="hltIns">
				<td>건강보험</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td><span id="hltInsBtn" class="joinBtn">[가입완료]</span></td>
			</tr>			
			<tr id="accIns">
				<td>산재보험</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td><span id="accInsBtn" class="joinBtn">[가입완료]</span></td>
			</tr>			
			<tr id="empIns">
				<td>고용보험</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td><span id="empInsBtn" class="joinBtn">[가입완료]</span></td>
			</tr>			
			<tr id="ntnIns">
				<td>국민연금</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td><span id="ntnInsBtn" class="joinBtn">[가입완료]</span></td>
			</tr>			
		</tbody>
	</table>
<script type="text/javascript">
	$("#hltInsBtn").click(function() {
		var check = window.confirm("가입완료 버튼을 누르시겠습니까?");
		if(check){
			$.ajax({
				url: "updateHltIns.em",
				type: "post",
				data: {
					empNoSeq: $("#basicEmpInfo #empNoSeq").val()
				},
				success: function(data) {
					$("#hltIns").children("td").eq(3).html(data.fourIns.hltEnrollDate);
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$("#accInsBtn").click(function() {
		var check = window.confirm("가입완료 버튼을 누르시겠습니까?");
		if(check){
			$.ajax({
				url: "updateAccIns.em",
				type: "post",
				data: {
					empNoSeq: $("#basicEmpInfo #empNoSeq").val()
				},
				success: function(data) {
					$("#accIns").children("td").eq(3).html(data.fourIns.accEnrollDate);
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$("#empInsBtn").click(function() {
		var check = window.confirm("가입완료 버튼을 누르시겠습니까?");
		if(check){
			$.ajax({
				url: "updateEmpIns.em",
				type: "post",
				data: {
					empNoSeq: $("#basicEmpInfo #empNoSeq").val()
				},
				success: function(data) {
					$("#empIns").children("td").eq(3).html(data.fourIns.empEnrollDate);
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$("#ntnInsBtn").click(function() {
		var check = window.confirm("가입완료 버튼을 누르시겠습니까?");
		if(check){
			$.ajax({
				url: "updateNtnIns.em",
				type: "post",
				data: {
					empNoSeq: $("#basicEmpInfo #empNoSeq").val()
				},
				success: function(data) {
					$("#ntnIns").children("td").eq(3).html(data.fourIns.ntnEnrollDate);
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
</script>
</body>
</html>