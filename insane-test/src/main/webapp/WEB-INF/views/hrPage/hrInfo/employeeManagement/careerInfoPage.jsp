<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#careerInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#careerInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#careerInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#careerInfoTable tbody td {
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
	<table id="careerInfoTable">
		<thead>
			<tr>
				<th colspan="7">
					<span id="insertcareerInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="110px;">회사명</td>
				<td width="80px;">입사일자</td>
				<td width="80px;">퇴사일자</td>
				<td width="55px;">경력인정개월</td>
				<td width="80px;">담당업무</td>
				<td width="50px;">최종직위</td>
				<td width="190px;">퇴직사유</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertcareerInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #careerManagementPage")).hide();
		$("#careerManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertCareerInfoForm input[name=empNoSeq]").val(empNoSeq);
		
		$.ajax({
			url: "selectCareerInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#careerInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "careerSeq").attr("name", "careerSeq").val(data.list[key].careerSeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteCareerInfoBtn").text("-");
					$delBtn.append($span);
					$companyName = $("<td>").text(data.list[key].lastCompanyName);
					$eDate = $("<td>").text(data.list[key].enrollDate);
					$rDate = $("<td>").text(data.list[key].retireDate);
					$recog = $("<td>").text(data.list[key].recogMonths);
					$job = $("<td>").text(data.list[key].job);
					$posi = $("<td>").text(data.list[key].lastPosition);
					$retire = $("<td>").text(data.list[key].retireReason);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($companyName);
					$tr.append($eDate);
					$tr.append($rDate);
					$tr.append($recog);
					$tr.append($job);
					$tr.append($posi);
					$tr.append($retire);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log();
			}
		});
	});
</script>
</body>
</html>