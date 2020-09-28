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
	#healthManagementPage{
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
	#modalInsertHealthBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertHealthSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertHealthSpan2:hover {
		cursor: pointer;
	}
	#healthInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#healthInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#healthInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#healthInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#healthInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#healthInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#healthInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteHealthInfoBtn {
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
	.deleteHealthInfoBtn:hover {
		cursor: pointer;
	}
	#insertHealthInfoForm input[type=text] {
		width: 50px;
		text-align: center;
	}
	#insertHealthInfoForm input[type=date] {
		width: 120px;
	}
</style>
</head>
<body>

<div id="healthManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">건강검진 사항 관리</span>
			<span id="modalHealthInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>건강검진 정보 추가</label>
			</div>
			<form name="insertHealthInfoForm" id="insertHealthInfoForm">
				<input type="hidden" name="empNoSeq">
				<table class="modalResultTable2" style="border-bottom: none;">
					<tr>
						<td class="colTd1" width="80px">검진일자</td>
						<td width="80px"><input type="date" name="healthCheckDate"></td>
						<td class="colTd1" width="80px">검진기관</td>
						<td width="80px"><input type="text" name="institutionName" maxlength="50" style="width: 110px;"></td>
						<td class="colTd1" width="80px">신장</td>
						<td width="80px"><input type="text" name="height"></td>
						<td class="colTd1" width="80px">체중</td>
						<td width="80px"><input type="text" name="weight"></td>
						<td class="colTd1" width="80px">혈액형</td>
						<td width="80px">
						<select id="bloodType" name="bloodType">
								<option value="" selected>선택</option>
								<option value="A+">A+</option>
								<option value="A-">A-</option>
								<option value="B+">B+</option>
								<option value="B-">B-</option>
								<option value="O+">O+</option>
								<option value="O-">O-</option>
								<option value="AB+">AB+</option>
								<option value="AB-">AB-</option>
								<option value="특수">특수</option>
							</select>
						</td>
					</tr>
				</table>
				<table class="modalResultTable2" style="border-top: none;">
					<tr>
						<td class="colTd1" width="75px">시력(좌/우)</td>
						<td width="65px">
							<input class="sText" type="text" name="leftSight" style="width: 20px;">
							<input class="sText" type="text" name="rightSight" style="width: 20px;">
						</td>
						<td class="colTd1" width="75px">청력(좌/우)</td>
						<td width="95px">
							<input class="sText" type="text" name="leftHear" style="width: 30px; padding: 0;">
							<input class="sText" type="text" name="rightHear" style="width: 30px; padding: 0;">
						</td>
						<td class="colTd1" width="75px">혈압(고/저)</td>
						<td>
							<input type="text" name="bloodPresureType">
						</td>
						<td class="colTd1" width="30px">색맹</td>
						<td>
							<select id="colorBlindYN" name="colorBlindYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1" width="65px">재검유무</td>
						<td>
							<select id="recheckYN" name="recheckYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1" width="65px">장애등급</td>
						<td>
							<select id="disorderStep" name="disorderStep">
								<option value="" selected>선택</option>
								<option value="X">없음</option>
								<option value="6급">6급</option>
								<option value="5급">5급</option>
								<option value="4급">4급</option>
								<option value="3급">3급</option>
								<option value="2급">2급</option>
								<option value="1급">1급</option>
							</select>
						</td>
					</tr>
				</table>
				<div id="modalInsertHealthBtn2">
					<span id="modalInsertHealthSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>건강검진 정보 삭제</label>
			</div>
			<div id="healthInfoTableArea2">
				<table id="healthInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
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
						<tr>
							<td><span class="deleteHealthInfoBtn">-</span></td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
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

	$(document).on("click", "#modalInsertHealthSpan2", function() {
		
		var acaInfo = $("form[name=insertHealthInfoForm]").serialize();
		
		$.ajax({
			url: "insertHealthInfo.em",
			type: "post",
			data: acaInfo,
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
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#healthInfoTable2 .deleteHealthInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 건강검진 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteHealthInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
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
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalHealthInfoClose", function() {
		$.ajax({
			url: "selectHealthInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#healthInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
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
				console.log(data);
			}
		});
		
		modal2.style.display = "none";
	});

</script>
</body>
</html>