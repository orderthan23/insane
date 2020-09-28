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
	#rewardPunishManagementPage{
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
	#modalInsertRewardPunishBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertRewardPunishSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertRewardPunishSpan2:hover {
		cursor: pointer;
	}
	#rewardPunishInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#rewardPunishInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#rewardPunishInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#rewardPunishInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#rewardPunishInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#rewardPunishInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#rewardPunishInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteRewardPunishInfoBtn {
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
	.deleteRewardPunishInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="rewardPunishManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">상벌 이력 관리</span>
			<span id="modalRewardPunishInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>상벌 이력 추가</label>
			</div>
			<form name="insertRewardPunishInfoForm" id="insertRewardPunishInfoForm">
				<input type="hidden" name="targetEmpNo">
				<table class="modalResultTable2">
					<tr>
						<td class="colTd1" width="80px">상벌구분</td>
						<td width="80px">
							<select id="rwrdPnshType" name="rwrdPnshType">
								<option value="" selected>선택</option>
								<option value="포상">포상</option>
								<option value="징계">징계</option>
							</select>
						</td>
						<td class="colTd1" width="80px">상벌일자</td>
						<td width="80px">
							<input type="date" name="pnshStartDate">
						</td>
						<td class="colTd1" width="80px">종료일자</td>
						<td width="80px">
							<input type="date" name="pnsgEndDate">
						</td>
					</tr>
					<tr>
						<td class="colTd1">상벌사유</td>
						<td colspan="3">
							<input type="text" name="rpReason" style="width: 95%;">
						</td>
						<td class="colTd1">상벌내용</td>
						<td>
							<input type="text" name="rpContent" style="width: 90%;">
						</td>
					</tr>
				</table>
				<div id="modalInsertRewardPunishBtn2">
					<span id="modalInsertRewardPunishSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>상벌 이력 삭제</label>
			</div>
			<div id="rewardPunishInfoTableArea2">
				<table id="rewardPunishInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
							<td width="80px;">상벌구분</td>
							<td width="80px;">상벌일자</td>
							<td width="80px;">종료일자</td>
							<td width="400px;">상벌사유</td>
							<td width="100px;">상벌내용</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="deleteRewardPunishInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertRewardPunishSpan2", function() {
		
		var acaInfo = $("form[name=insertRewardPunishInfoForm]").serialize();
		
		$.ajax({
			url: "insertRewardPunishInfo.em",
			type: "post",
			data: acaInfo,
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
	
	$(document).on("click", "#rewardPunishInfoTable2 .deleteRewardPunishInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 상벌 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteRewardPunishInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
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
		}
	});
	
	$(document).on("click", "#modalRewardPunishInfoClose", function() {
		$.ajax({
			url: "selectRPInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#rpInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$rpType = $("<td>").text(data.list[key].rwrdPnshType);
					$rpDate = $("<td>").text(data.list[key].pnshStartDate);
					$endDate = $("<td>").text(data.list[key].pnsgEndDate);
					$rpReason = $("<td>").text(data.list[key].rpReason);
					$rpContent = $("<td>").text(data.list[key].rpContent);
					
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
		
		modal2.style.display = "none";
	});

</script>
</body>
</html>