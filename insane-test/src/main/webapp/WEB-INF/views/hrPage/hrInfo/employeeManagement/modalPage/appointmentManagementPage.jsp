<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#appointmentManagementPage{
		display: none;
	}
	.bluebox2 {
		display: table-cell;
		width: 1000px;
		height: 70px;
		background: #2E2C8F;
		vertical-align: middle;
	}
	.headerTextArea2 {
		display: inline-block;
		width: 300px;
		height: 30px;
		color: white;
		font-size: 20px;
		padding-left: 20px;
		padding-top: 9px;
	}
	.close2 {
		color: #aaa;
		font-size: 30px;
		float: right;
		margin-right: 20px;
		padding-top: 3px;
	}
	.modalSubTitle2 {
		margin: 15px 0;
	}
	.modalTableArea2 {
		margin-left: 20px;
		margin-right: 20px;
		margin-bottom:20px;
		width: 960px;
		height: 410px;
		overflow: hidden;
	}
/* 	.modalBtnArea2 { */
/* 		margin-left: 20px; */
/* 		margin-right: 20px; */
/* 		text-align: right; */
/* 	} */
/* 	.modalBtn2 { */
/* 		background: #2E2C8F; */
/* 		padding: 5px 10px; */
/* 		border-radius: 4px; */
/* 		color: white; */
/* 	} */
/* 	.modalBtn2:hover { */
/* 		cursor: pointer; */
/* 	} */
	.modalResultTable2 {
		width: 100%;
		border: 2px solid #2E2C8F;
		border-collapse: collapse;
	}
	.modalResultTable2 th, .modalResultTable2 td {
		border: 1px solid #2E2C8F;
		padding: 5px 10px;
		text-align: center;
	}
	.modalResultTable2 th {
		background: #2E2C8F;
		color: white;
		font-size: 15px;
	}
	.modalResultTable2 td {
		font-size: 13px;
	}
	.modalResultTable2 input[type=text]{
		width: 140px;
	}
	.colTd1 {
		background: #2E2C8F;
		color: white
	}
	#modalInsertAppointmentBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertAppointmentSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertAppointmentSpan2:hover {
		cursor: pointer;
	}
	#appointmentInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#appointmentInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#appointmentInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#appointmentInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#appointmentInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#appointmentInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#appointmentInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteAppointmentInfoBtn {
		display: inline-block;
		width: 18px;
		height: 18px;
		background: red;
		color: white;
		text-align: center;
		border-radius: 4px;
		font-size: 18px;
		font-weight: 900;
	}
	.deleteAppointmentInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="appointmentManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">발령이력 관리</span>
			<span id="modalAppointmentInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>발령 이력 추가</label>
			</div>
			<form name="insertAppointmentInfoForm" id="insertAppointmentInfoForm">
				<input type="hidden" name="targetEmpNo">
				<table class="modalResultTable2">
					<tr>
						<td class="colTd1" width="80px">발령일자</td>
						<td width="80px"><input type="date" name="gvofodDate"></td>
						<td class="colTd1" width="80px">발령명칭</td>
						<td width="80px">
							<select id="gvofodCode" name="gvofodCode">
								<option value="" selected>선택</option>
								<option value="51">채용</option>
								<option value="52">승진</option>
								<option value="53">발령</option>
								<option value="54">징계</option>
								<option value="55">면직</option>
							</select>
						</td>
						<td class="colTd1" width="80px">근무지역</td>
						<td width="80px">
							<select id="locationCode" name="locationCode">
								<option value="" selected>선택</option>
							</select>
						</td>
						<td class="colTd1" width="80px">발령부서</td>
						<td width="80px">
							<select id="departmentCode" name="departmentCode">
								<option value="" selected>선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="colTd1">직책</td>
						<td>
							<select id="repofcCode" name="repofcCode">
								<option value="" selected>선택</option>
							</select>
						</td>
						<td class="colTd1">직급</td>
						<td>
							<select id="positionCode" name="positionCode">
								<option value="" selected>선택</option>
							</select>
						</td>
						<td class="colTd1">적요사항</td>
						<td colspan="3">
							<input type="text" name="remark" style="width: 300px;">
						</td>
					</tr>
				</table>
				<div id="modalInsertAppointmentBtn2">
					<span id="modalInsertAppointmentSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>발령 이력 삭제</label>
			</div>
			<div id="appointmentInfoTableArea2">
				<table id="appointmentInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
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
						<tr>
							<td><span class="deleteAppointmentInfoBtn">-</span></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>			
					</tbody>
				</table>
			</div>
		</div>	<!-- modalTableArea End -->

	</div>	<!-- modal-body -->	
	
</div>	<!-- modal-content end -->
<script type="text/javascript">

	$(document).on("click", "#modalInsertAppointmentSpan2", function() {
		
		var acaInfo = $("form[name=insertAppointmentInfoForm]").serialize();
		
		$.ajax({
			url: "insertAppointmentInfo.em",
			type: "post",
			data: acaInfo,
			success: function(data) {
				console.log(data);
				$tableBody = $("#appointmentInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "gvofodHistorySeq").attr("name", "gvofodHistorySeq").val(data.list[key].gvofodHistorySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteAppointmentInfoBtn").text("-");
					$delBtn.append($span);
					$aDate = $("<td>").text(data.list[key].gvofodDate);
					$aName = $("<td>").text(data.list[key].codeName);
					$lName = $("<td>").text(data.list[key].locationName);
					$dName = $("<td>").text(data.list[key].deptName);
					$rName = $("<td>").text(data.list[key].repofcName);
					$pName = $("<td>").text(data.list[key].positionName);
					$remark = $("<td>").attr("class", "remarkTd").text(data.list[key].remark);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($aDate);
					$tr.append($aName);
					$tr.append($lName);
					$tr.append($dName);
					$tr.append($rName);
					$tr.append($pName);
					$tr.append($remark);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#appointmentInfoTable2 .deleteAppointmentInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 발령 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteAppointmentInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
				},
				success: function(data) {
					
					$tableBody = $("#appointmentInfoTable2 tbody");
					$tableBody.html('');
					
					for(var key in data.list){
						$tr = $("<tr>");
						
						$inputTd = $("<input>").attr("type", "hidden").attr("id", "gvofodHistorySeq").attr("name", "gvofodHistorySeq").val(data.list[key].gvofodHistorySeq);
						$delBtn = $("<td>");
						$span = $("<span>").attr("class", "deleteAppointmentInfoBtn").text("-");
						$delBtn.append($span);
						$aDate = $("<td>").text(data.list[key].gvofodDate);
						$aName = $("<td>").text(data.list[key].codeName);
						$lName = $("<td>").text(data.list[key].locationName);
						$dName = $("<td>").text(data.list[key].deptName);
						$rName = $("<td>").text(data.list[key].repofcName);
						$pName = $("<td>").text(data.list[key].positionName);
						$remark = $("<td>").attr("class", "remarkTd").text(data.list[key].remark);
					
						$tr.append($inputTd);
						$tr.append($delBtn);
						$tr.append($aDate);
						$tr.append($aName);
						$tr.append($lName);
						$tr.append($dName);
						$tr.append($rName);
						$tr.append($pName);
						$tr.append($remark);
						
						$tableBody.append($tr);
					}
					
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalAppointmentInfoClose", function() {
		$.ajax({
			url: "selectAppointInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#appointmentInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$aDate = $("<td>").text(data.list[key].gvofodDate);
					$aName = $("<td>").text(data.list[key].codeName);
					$lName = $("<td>").text(data.list[key].locationName);
					$dName = $("<td>").text(data.list[key].deptName);
					$rName = $("<td>").text(data.list[key].repofcName);
					$pName = $("<td>").text(data.list[key].positionName);
					$remark = $("<td>").attr("class", "remarkTd").text(data.list[key].remark);
					
					$tr.append($aDate);
					$tr.append($aName);
					$tr.append($lName);
					$tr.append($dName);
					$tr.append($rName);
					$tr.append($pName);
					$tr.append($remark);
					
					$tableBody.append($tr);
				}
				$("#appointmentInfoTable tbody .remarkTd").attr("style", "text-align: left;")
			},
			error: function() {
				console.log("error");
			}
		});
		
		modal2.style.display = "none";
	});

</script>
</body>
</html>