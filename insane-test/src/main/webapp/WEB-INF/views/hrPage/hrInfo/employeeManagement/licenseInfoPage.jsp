<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#licenseInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#licenseInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#licenseInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#licenseInfoTable tbody td {
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
	<table id="licenseInfoTable">
		<thead>
			<tr>
				<th colspan="6">
					<span id="insertlicenseInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="70px;">취득일자</td>
				<td width="150px;">자격증/면허명</td>
				<td width="80px;">자격증/면허 번호</td>
				<td width="150px;">발행처</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertlicenseInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #licenseManagementPage")).hide();
		$("#licenseManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertLicenseInfoForm input[name=empNoSeq]").val(empNoSeq);
		
		$.ajax({
			url: "selectModalLicenseInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#licenseInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.hmap.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "licenseSeq").attr("name", "licenseSeq").val(data.hmap.list[key].licenseSeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteLicenseInfoBtn").text("-");
					$delBtn.append($span);
					$lDate = $("<td>").text(data.hmap.list[key].licenseAcqDate);
					$lName = $("<td>").text(data.hmap.list[key].licenseName);
					$lNo = $("<td>").text(data.hmap.list[key].licenseNo);
					$lIssue = $("<td>").text(data.hmap.list[key].licenseIssued);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($lDate);
					$tr.append($lName);
					$tr.append($lNo);
					$tr.append($lIssue);
					
					$tableBody.append($tr);
				}
				
				$select = $("#insertLicenseInfoForm #licenseCode");
				$select.html('');
				
				$basicOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$select.append($basicOption);
				
				for(var key in data.hmap.lcList){
					$option = $("<option>").attr("value", data.hmap.lcList[key].licenseCompanySeq).text(data.hmap.lcList[key].licenseName);
					$select.append($option);
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