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
	#hrReviewManagementPage{
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
	#insertHrReviewInfoForm input[type=text]{
		width: 100px;
	}
	.colTd1 {
		background: #2E2C8F;
		color: white
	}
	#modalInsertHrReviewBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertHrReviewSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertHrReviewSpan2:hover {
		cursor: pointer;
	}
	#hrReviewInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#hrReviewInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#hrReviewInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#hrReviewInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#hrReviewInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#hrReviewInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#hrReviewInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteHrReviewInfoBtn {
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
	.deleteHrReviewInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="hrReviewManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">인사고과 이력 관리</span>
			<span id="modalHrReviewInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>인사고과 이력 추가</label>
			</div>
			<form name="insertHrReviewInfoForm" id="insertHrReviewInfoForm">
				<input type="hidden" name="targetEmpNo">
				<table class="modalResultTable2">
					<tr>
						<td class="colTd1" width="80px">평가구분</td>
						<td width="80px">
							<input type="text" name="exmType">
						</td>
						<td class="colTd1" width="80px">종합평가구분</td>
						<td width="80px">
							<input type="text" name="exmResult">
						</td>
						<td class="colTd1" width="80px">종합의견</td>
						<td width="300px">
							<input type="text" name="exmOpnion" style="width: 285px;">
						</td>
					</tr>
				</table>
				<div id="modalInsertHrReviewBtn2">
					<span id="modalInsertHrReviewSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>인사고과 이력 삭제</label>
			</div>
			<div id="hrReviewInfoTableArea2">
				<table id="hrReviewInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
							<td width="100px;">평가구분</td>
							<td width="80px;">종합평가등급</td>
							<td width="500px;">종합의견</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="deleteHrReviewInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertHrReviewSpan2", function() {
		
		var acaInfo = $("form[name=insertHrReviewInfoForm]").serialize();
		
		$.ajax({
			url: "insertHRreviewInfo.em",
			type: "post",
			data: acaInfo,
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
	
	$(document).on("click", "#hrReviewInfoTable2 .deleteHrReviewInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 인사고과 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteHRreviewInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
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
		}
	});
	
	$(document).on("click", "#modalHrReviewInfoClose", function() {
		$.ajax({
			url: "selectHRreviewInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#hrReviewInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$type = $("<td>").text(data.list[key].exmType);
					$grade = $("<td>").text(data.list[key].exmResult);
					$opnion = $("<td>").text(data.list[key].exmOpnion);
					
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
		
		modal2.style.display = "none";
	});

</script>
</body>
</html>