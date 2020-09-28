<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#rpInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#rpInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#rpInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#rpInfoTable tbody td {
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
	<table id="rpInfoTable">
		<thead>
			<tr>
				<th colspan="5">
					<span id="insertRewardPunishInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="80px;">상벌구분</td>
				<td width="80px;">상벌일자</td>
				<td width="80px;">종료일자</td>
				<td width="400px;">상벌사유</td>
				<td width="100px;">상벌내용</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertRewardPunishInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #rewardPunishManagementPage")).hide();
		$("#rewardPunishManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertRewardPunishInfoForm input[name=targetEmpNo]").val(empNoSeq);
		
		$.ajax({
			url: "selectRPInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#rewardPunishInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "rwrdPnshHistorySeq").attr("name", "rwrdPnshHistorySeq").val(data.list[key].rwrdPnshHistorySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteRewardPunishInfoBtn").text("-");
					$delBtn.append($span);
					$rpType = $("<td>").text(data.list[key].rwrdPnshType);
					$rpDate = $("<td>").text(data.list[key].pnshStartDate);
					$endDate = $("<td>").text(data.list[key].pnsgEndDate);
					$rpReason = $("<td>").text(data.list[key].rpReason);
					$rpContent = $("<td>").text(data.list[key].rpContent);
					
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($rpType);
					$tr.append($rpDate);
					$tr.append($endDate);
					$tr.append($rpReason);
					$tr.append($rpContent);
					
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