<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#payStepInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#payStepInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#payStepInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#payStepInfoTable tbody td {
		font-weight: 400;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	.btn {
		display: inline-block;
		width: 18px;
		height: 18px;
		background: #2E2C8F;
		color: white;
		text-align: center;
		border-radius: 4px;
	}
	.btn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>
	<table id="payStepInfoTable">
		<thead>
			<tr>
				<th colspan="3">
					<span id="insertPayStepInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="100px;">변동직급</td>
				<td width="100px;">변동호봉</td>
				<td width="300px;">사유</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertPayStepInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #payStepManagementPage")).hide();
		$("#payStepManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertPayStepInfoForm input[name=targetEmpNo]").val(empNoSeq);
		
		$.ajax({
			url: "selectModalPayStepInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				console.log(data);
				$tableBody = $("#payStepInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.hmap.list){
					console.log(data.hmap.list[key]);
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "payStepHistorySeq").attr("name", "payStepHistorySeq").val(data.hmap.list[key].payStepHistorySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deletePayStepInfoBtn").text("-");
					$delBtn.append($span);
					$pName = $("<td>").text(data.hmap.list[key].positionName);
					$payStep = $("<td>").text(data.hmap.list[key].payStep + "호봉");
					$reason = $("<td>").text(data.hmap.list[key].reason);
					
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($pName);
					$tr.append($payStep);
					$tr.append($reason);
					
					$tableBody.append($tr);
				}
				
				$positionCode = $("#insertPayStepInfoForm #positionCode2");
				$positionCode.html('');
				
				$positionOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$positionCode.append($positionOption);
				
				for(var key in data.hmap.poList){
					$positionOption = $("<option>").attr("value", data.hmap.poList[key].positionSeq).text(data.hmap.poList[key].positionName);
					$positionCode.append($positionOption);
				}
				
				$changePayStep = $("#insertPayStepInfoForm #changePayStep");
				$changePayStep.html('');
				
				$changePayStepOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$changePayStep.append($changePayStepOption);
				
				for(var key in data.hmap.psList){
					$changePayStepOption = $("<option>").attr("value", data.hmap.psList[key].payStepSeq).text(data.hmap.psList[key].payStep + "호봉");
					$changePayStep.append($changePayStepOption);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
</script>
</body>
</html>