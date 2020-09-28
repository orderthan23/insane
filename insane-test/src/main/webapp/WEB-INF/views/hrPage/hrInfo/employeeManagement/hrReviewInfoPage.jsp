<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#hrReviewInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#hrReviewInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#hrReviewInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#hrReviewInfoTable tbody td {
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
	<table id="hrReviewInfoTable">
		<thead>
			<tr>
				<th colspan="5">
					<span id="insertHrReviewInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="100px;">평가구분</td>
				<td width="80px;">종합평가등급</td>
				<td width="500px;">종합의견</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertHrReviewInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #hrReviewManagementPage")).hide();
		$("#hrReviewManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertHrReviewInfoForm input[name=targetEmpNo]").val(empNoSeq);
		
		$.ajax({
			url: "selectHRreviewInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#hrReviewInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "prsnlExmHistorySeq").attr("name", "prsnlExmHistorySeq").val(data.list[key].prsnlExmHistorySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteHrReviewInfoBtn").text("-");
					$delBtn.append($span);
					$type = $("<td>").text(data.list[key].exmType);
					$grade = $("<td>").text(data.list[key].exmResult);
					$opnion = $("<td>").text(data.list[key].exmOpnion);
					
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($type);
					$tr.append($grade);
					$tr.append($opnion);
					
					$tableBody.append($tr);
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