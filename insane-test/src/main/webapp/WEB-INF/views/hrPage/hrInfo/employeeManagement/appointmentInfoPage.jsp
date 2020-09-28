<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#appointmentInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#appointmentInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#appointmentInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#appointmentInfoTable tbody td {
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
	<table id="appointmentInfoTable">
		<thead>
			<tr>
				<th colspan="7">
					<span id="insertAppointmentInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="80px;">발령일자</td>
				<td width="80px;">발령명칭</td>
				<td width="80px;">근무지역</td>
				<td width="80px;">발령부서</td>
				<td width="50px;">직책</td>
				<td width="50px;">직급</td>
				<td width="120px;">적요사항</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertAppointmentInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #appointmentManagementPage")).hide();
		$("#appointmentManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertAppointmentInfoForm input[name=targetEmpNo]").val(empNoSeq);
		
		$.ajax({
			url: "selectModalAppointInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#appointmentInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.hmap.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "gvofodHistorySeq").attr("name", "gvofodHistorySeq").val(data.hmap.list[key].gvofodHistorySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteAppointmentInfoBtn").text("-");
					$delBtn.append($span);
					$aDate = $("<td>").text(data.hmap.list[key].gvofodDate);
					$aName = $("<td>").text(data.hmap.list[key].codeName);
					$lName = $("<td>").text(data.hmap.list[key].locationName);
					$dName = $("<td>").text(data.hmap.list[key].deptName);
					$rName = $("<td>").text(data.hmap.list[key].repofcName);
					$pName = $("<td>").text(data.hmap.list[key].positionName);
					$remark = $("<td>").attr("class", "remarkTd").text(data.hmap.list[key].remark);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($aDate);
					$tr.append($aName);
					$tr.append($lName);
					$tr.append($dName);
					$tr.append($rName);
					$tr.append($pName);
					$tr.append($remark)
					
					$tableBody.append($tr);
				}
				
				$locationCode = $("#insertAppointmentInfoForm #locationCode");
				$locationCode.html('');
				
				$locationOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$locationCode.append($locationOption);
				
				for(var key in data.hmap.loList){
					$locationOption = $("<option>").attr("value", data.hmap.loList[key].locationSeq).text(data.hmap.loList[key].locationName);
					$locationCode.append($locationOption);
				}
				
				$departmentCode = $("#insertAppointmentInfoForm #departmentCode");
				$departmentCode.html('');
				
				$departmentOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$departmentCode.append($departmentOption);
				
				for(var key in data.hmap.deList){
					$departmentOption = $("<option>").attr("value", data.hmap.deList[key].deptCodeSeq).text(data.hmap.deList[key].deptName);
					$departmentCode.append($departmentOption);
				}
				
				$repofcCode = $("#insertAppointmentInfoForm #repofcCode");
				$repofcCode.html('');
				
				$repofcOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$repofcCode.append($repofcOption);
				
				for(var key in data.hmap.rsList){
					$repofcOption = $("<option>").attr("value", data.hmap.rsList[key].rspofcSeq).text(data.hmap.rsList[key].rspofcName);
					$repofcCode.append($repofcOption);
				}
				
				$positionCode = $("#insertAppointmentInfoForm #positionCode");
				$positionCode.html('');
				
				$positionOption = $("<option>").attr("value", "").attr("selected", "selected").text("선택");
				$positionCode.append($positionOption);
				
				for(var key in data.hmap.poList){
					$positionOption = $("<option>").attr("value", data.hmap.poList[key].positionSeq).text(data.hmap.poList[key].positionName);
					$positionCode.append($positionOption);
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