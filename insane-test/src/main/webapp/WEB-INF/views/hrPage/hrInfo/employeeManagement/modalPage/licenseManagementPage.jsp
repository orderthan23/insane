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
	#licenseManagementPage{
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
	#insertLicenseInfoForm input[type=text]{
		width: 165px;
	}
	#insertLicenseInfoForm input[type=date]{
		width: 168px;
	}
	.colTd1 {
		background: #2E2C8F;
		color: white
	}
	#modalInsertLicenseBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertLicenseSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertLicenseSpan2:hover {
		cursor: pointer;
	}
	#licenseInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#licenseInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#licenseInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#licenseInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#licenseInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#licenseInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#licenseInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteLicenseInfoBtn {
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
	.deleteLicenseInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="licenseManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">자격/면허 사항 관리</span>
			<span id="modalLicenseInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>자격/면허 정보 추가</label>
			</div>
			<form name="insertLicenseInfoForm" id="insertLicenseInfoForm">
				<input type="hidden" name="empNoSeq">
				<table class="modalResultTable2">
					<tr>
						<td class="colTd1" width="80px">취득일자</td>
						<td width="80px"><input type="date" name="licenseAcqDate"></td>
						<td class="colTd1" width="80px">자격증/면허명</td>
						<td width="80px">
						<select id="licenseCode" name="licenseCode">

						</select>
						</td>
					</tr>
					<tr>
						<td class="colTd1">자격증/면허번호</td>
						<td><input type="text" name="licenseNo"></td>
						<td class="colTd1">발행처</td>
						<td><input type="text" name="licenseIssued"></td>
					</tr>
				</table>
				<div id="modalInsertLicenseBtn2">
					<span id="modalInsertLicenseSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>자격/면허 정보 삭제</label>
			</div>
			<div id="licenseInfoTableArea2">
				<table id="licenseInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
							<td width="70px;">취득일자</td>
							<td width="150px;">자격증/면허명</td>
							<td width="80px;">자격증/면허 번호</td>
							<td width="150px;">발행처</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="deleteLicenseInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertLicenseSpan2", function() {
		
		var acaInfo = $("form[name=insertLicenseInfoForm]").serialize();
		
		$.ajax({
			url: "insertLicenseInfo.em",
			type: "post",
			data: acaInfo,
			success: function(data) {
				
				$tableBody = $("#licenseInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "licenseSeq").attr("name", "licenseSeq").val(data.list[key].licenseSeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteLicenseInfoBtn").text("-");
					$delBtn.append($span);
					$lDate = $("<td>").text(data.list[key].licenseAcqDate);
					$lName = $("<td>").text(data.list[key].licenseName);
					$lNo = $("<td>").text(data.list[key].licenseNo);
					$lIssue = $("<td>").text(data.list[key].licenseIssued);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($lDate);
					$tr.append($lName);
					$tr.append($lNo);
					$tr.append($lIssue);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#licenseInfoTable2 .deleteLicenseInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 자격/면허 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteLicenseInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
				},
				success: function(data) {
					
					$tableBody = $("#licenseInfoTable2 tbody");
					$tableBody.html('');
					
					for(var key in data.list){
						$tr = $("<tr>");
						
						$inputTd = $("<input>").attr("type", "hidden").attr("id", "licenseSeq").attr("name", "licenseSeq").val(data.list[key].licenseSeq);
						$delBtn = $("<td>");
						$span = $("<span>").attr("class", "deleteLicenseInfoBtn").text("-");
						$delBtn.append($span);
						$lDate = $("<td>").text(data.list[key].licenseAcqDate);
						$lName = $("<td>").text(data.list[key].licenseName);
						$lNo = $("<td>").text(data.list[key].licenseNo);
						$lIssue = $("<td>").text(data.list[key].licenseIssued);
					
						$tr.append($inputTd);
						$tr.append($delBtn);
						$tr.append($lDate);
						$tr.append($lName);
						$tr.append($lNo);
						$tr.append($lIssue);
						
						$tableBody.append($tr);
					}
					
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalLicenseInfoClose", function() {
		$.ajax({
			url: "selectLicenseInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#licenseInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$lDate = $("<td>").text(data.list[key].licenseAcqDate);
					$lName = $("<td>").text(data.list[key].licenseName);
					$lNo = $("<td>").text(data.list[key].licenseNo);
					$lIssue = $("<td>").text(data.list[key].licenseIssued);
					
					$tr.append($lDate);
					$tr.append($lName);
					$tr.append($lNo);
					$tr.append($lIssue);
					
					$tableBody.append($tr);
				}
				
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