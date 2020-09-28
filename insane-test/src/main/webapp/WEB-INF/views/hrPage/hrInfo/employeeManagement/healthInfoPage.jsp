<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#healthInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#healthInfoTable thead th {
		font-size: 16px; 
		text-align: right;
	}
	#healthInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#healthInfoTable tbody td {
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
	<table id="healthInfoTable">
		<thead>
			<tr>
				<th colspan="11">
					<span id="inserthealthInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="80px;">검진일자</td>
				<td width="140px;">검진기관</td>
				<td width="70px;">신장</td>
				<td width="70px;">체중</td>
				<td width="70px;">혈액형</td>
				<td width="70px;">시력(좌/우)</td>
				<td width="70px;">청력(좌/우)</td>
				<td width="70px;">혈압(고/저)</td>
				<td width="70px;">색맹</td>
				<td width="70px;">재검유무</td>
				<td width="70px;">장애등급</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#inserthealthInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #healthManagementPage")).hide();
		$("#healthManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertHealthInfoForm input[name=empNoSeq]").val(empNoSeq);
		
		$.ajax({
			url: "selectHealthInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#healthInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "healthSeq").attr("name", "healthSeq").val(data.list[key].healthSeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteHealthInfoBtn").text("-");
					$delBtn.append($span);
					$date = $("<td>").text(data.list[key].healthCheckDate);
					$insti = $("<td>").text(data.list[key].institutionName);
					$height = $("<td>").text(data.list[key].height);
					$weight = $("<td>").text(data.list[key].weight);
					$bType = $("<td>").text(data.list[key].bloodType);
					$sight = $("<td>").text(data.list[key].leftSight + "/" + data.list[key].rightSight);
					$hear = $("<td>").text(data.list[key].leftHear + "/" + data.list[key].rightHear);
					$presure = $("<td>").text(data.list[key].bloodPresureType);
					$color = $("<td>").text(data.list[key].colorBlindYN);
					$recheck = $("<td>").text(data.list[key].recheckYN);
					$disorder = $("<td>").text(data.list[key].disorderStep);
					
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($date);
					$tr.append($insti);
					$tr.append($height);
					$tr.append($weight);
					$tr.append($bType);
					$tr.append($sight);
					$tr.append($hear);
					$tr.append($presure);
					$tr.append($color);
					$tr.append($recheck);
					$tr.append($disorder);
					
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