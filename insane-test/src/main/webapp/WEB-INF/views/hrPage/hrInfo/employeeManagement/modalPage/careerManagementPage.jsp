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
	#careerManagementPage{
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
	#insertCareerInfoForm input[type=text]{
		width: 100px;
	}
	#insertCareerInfoForm input[type=date]{
		width: 120px;
	}
	.colTd1 {
		background: #2E2C8F;
		color: white
	}
	#modalInsertCareerBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertCareerSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertCareerSpan2:hover {
		cursor: pointer;
	}
	#careerInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#careerInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#careerInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#careerInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#careerInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#careerInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#careerInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteCareerInfoBtn {
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
	.deleteCareerInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="careerManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">경력사항 관리</span>
			<span id="modalCareerInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>경력 정보 추가</label>
			</div>
			<form name="insertCareerInfoForm" id="insertCareerInfoForm">
				<input type="hidden" name="empNoSeq">
				<table class="modalResultTable2" style="border-bottom: none;">
					<tr>
						<td class="colTd1" width="80px">회사명</td>
						<td width="80px"><input type="text" name="lastCompanyName" maxlength="30"></td>
						<td class="colTd1" width="80px">입사일자</td>
						<td width="80px"><input type="date" name="enrollDate"></td>
						<td class="colTd1" width="80px">퇴사일자</td>
						<td width="80px"><input type="date" name="retireDate"></td>
						<td class="colTd1" width="80px">경력인정개월</td>
						<td width="80px"><input type="text" name="recogMonths"></td>
					</tr>
				</table>
				<table class="modalResultTable2" style="border-top: none;">
					<tr>
						<td class="colTd1" width="80px">담당업무</td>
						<td width="80px"><input type="text" name="job" style="width: 150px;"></td>
						<td class="colTd1" width="80px">최종직위</td>
						<td width="80px"><input type="text" name="lastPosition"></td>
						<td class="colTd1" width="80px">퇴직사유</td>
						<td width="80px"><input type="text" name="retireReason" style="width: 350px;"></td>
					</tr>
				</table>
				<div id="modalInsertCareerBtn2">
					<span id="modalInsertCareerSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>경력 정보 삭제</label>
			</div>
			<div id="careerInfoTableArea2">
				<table id="careerInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
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
						<tr>
							<td><span class="deleteCareerInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertCareerSpan2", function() {
		
		var acaInfo = $("form[name=insertCareerInfoForm]").serialize();
		
		$.ajax({
			url: "insertCareerInfo.em",
			type: "post",
			data: acaInfo,
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
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#careerInfoTable2 .deleteCareerInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 경력 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteCareerInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
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
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalCareerInfoClose", function() {
		$.ajax({
			url: "selectCareerInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#careerInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$companyName = $("<td>").text(data.list[key].lastCompanyName);
					$eDate = $("<td>").text(data.list[key].enrollDate);
					$rDate = $("<td>").text(data.list[key].retireDate);
					$recog = $("<td>").text(data.list[key].recogMonths);
					$job = $("<td>").text(data.list[key].job);
					$posi = $("<td>").text(data.list[key].lastPosition);
					$retire = $("<td>").text(data.list[key].retireReason);
					
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
				console.log("error");
			}
		});
		
		modal2.style.display = "none";
	});

</script>
</body>
</html>