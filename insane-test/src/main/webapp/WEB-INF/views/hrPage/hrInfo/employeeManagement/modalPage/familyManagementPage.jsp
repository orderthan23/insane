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
	#familyManagementPage{
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
		width: 100px;
	}
	.colTd1 {
		background: #2E2C8F;
		color: white
	}
	#modalInsertFamBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertFamSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertFamSpan2:hover {
		cursor: pointer;
	}
	#famInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#famInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#famInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#famInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#famInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#famInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#famInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteFamInfoBtn {
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
	.deleteFamInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="familyManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">가족사항 관리</span>
			<span id="modalFamInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>가족 정보 추가</label>
			</div>
			<form name="insertFamilyInfoForm" id="insertFamilyInfoForm">
				<input type="hidden" name="empNoSeq">
				<table class="modalResultTable2" style="border-bottom: none;">
					<tr>
						<td class="colTd1" width="80px">가족관계</td>
						<td width="80px"><input type="text" name="relation" maxlength="3"></td>
						<td class="colTd1" width="80px">성명</td>
						<td width="80px"><input type="text" name="famName"></td>
						<td class="colTd1" width="80px">주민등록번호</td>
						<td width="80px"><input type="text" name="residentNo" maxlength="14"></td>
						<td class="colTd1" width="80px">기본공제</td>
						<td width="80px">
							<select id="basicDeductionYN" name="basicDeductionYN">
								<option value="" selected>선택</option>
								<option value="0">해당없음</option>
								<option value="1">본인</option>
								<option value="2">배우자</option>
								<option value="3">직계존속</option>
								<option value="4">직계비속, 입양자</option>
								<option value="5">형제, 자매</option>
								<option value="6">기타 부양가족</option>
							</select>
						</td>
					</tr>
				</table>
				<table class="modalResultTable2" style="border-top: none;">
					<tr>
						<td class="colTd1">세대주</td>
						<td>
							<select id="hshldrYN" name="hshldrYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">부녀자</td>
						<td>
							<select id="womenHshldrYN" name="womenHshldrYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">한부모</td>
						<td>
							<select id="onePrntYN" name="onePrntYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">장애인</td>
						<td>
							<select id="disorderYN" name="disorderYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">경로우대</td>
						<td>
							<select id="olderYN" name="olderYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">6세 이하</td>
						<td>
							<select id="ageSixYN" name="ageSixYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="colTd1">출산입양</td>
						<td>
							<select id="childAdoptYN" name="childAdoptYN">
								<option value="" selected>선택</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
					</tr>
				</table>
				<div id="modalInsertFamBtn2">
					<span id="modalInsertFamSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>가족 정보 삭제</label>
			</div>
			<div id="famInfoTableArea2">
				<table id="famInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
							<td width="80px;">가족관계</td>
							<td width="100px;">성명</td>
							<td width="150px;">주민등록번호</td>
							<td width="150px;">기본공제</td>
							<td width="70px;">세대주</td>
							<td width="70px;">부녀자</td>
							<td width="70px;">한부모</td>
							<td width="70px;">장애인</td>
							<td width="70px;">경로우대</td>
							<td width="70px;">6세 이하</td>
							<td width="70px;">출산입양</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="deleteFamInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertFamSpan2", function() {
		
		var famInfo = $("form[name=insertFamilyInfoForm]").serialize();
		
		$.ajax({
			url: "insertFamInfo.em",
			type: "post",
			data: famInfo,
			success: function(data) {
				
				$tableBody = $("#famInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "familySeq").attr("name", "familySeq").val(data.list[key].familySeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteFamInfoBtn").text("-");
					$delBtn.append($span);
					$relation = $("<td>").text(data.list[key].relation);
					$famName = $("<td>").text(data.list[key].famName);
					$resiNo = $("<td>").text(data.list[key].residentNo);
					var basic;
					switch(data.list[key].basicDeductionYN){
						case "0" : basic = "해당없음"; break;
						case "1" : basic = "본인"; break;
						case "2" : basic = "배우자"; break;
						case "3" : basic = "직계존속"; break;
						case "4" : basic = "직계비속, 입양자"; break;
						case "5" : basic = "형제, 자매"; break;
						case "6" : basic = "기타 부양가족"; break;
					}
					$basic = $("<td>").text(basic);
					$hshldr = $("<td>").text(data.list[key].hshldrYN);
					$womenHsh = $("<td>").text(data.list[key].womenHshldrYN);
					$one = $("<td>").text(data.list[key].onePrntYN);
					$dis = $("<td>").text(data.list[key].disorderYN);
					$older = $("<td>").text(data.list[key].olderYN);
					$ageSix = $("<td>").text(data.list[key].ageSixYN);
					$child = $("<td>").text(data.list[key].childAdoptYN);
					
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($relation);
					$tr.append($famName);
					$tr.append($resiNo);
					$tr.append($basic);
					$tr.append($hshldr);
					$tr.append($womenHsh);
					$tr.append($one);
					$tr.append($dis);
					$tr.append($older);
					$tr.append($ageSix);
					$tr.append($child);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#famInfoTable2 .deleteFamInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 가족 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteFamInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
				},
				success: function(data) {
					
					$tableBody = $("#famInfoTable2 tbody");
					$tableBody.html('');
					
					for(var key in data.list){
						$tr = $("<tr>");
						
						$inputTd = $("<input>").attr("type", "hidden").attr("id", "familySeq").attr("name", "familySeq").val(data.list[key].familySeq);
						$delBtn = $("<td>");
						$span = $("<span>").attr("class", "deleteFamInfoBtn").text("-");
						$delBtn.append($span);
						$relation = $("<td>").text(data.list[key].relation);
						$famName = $("<td>").text(data.list[key].famName);
						$resiNo = $("<td>").text(data.list[key].residentNo);
						var basic;
						switch(data.list[key].basicDeductionYN){
							case "0" : basic = "해당없음"; break;
							case "1" : basic = "본인"; break;
							case "2" : basic = "배우자"; break;
							case "3" : basic = "직계존속"; break;
							case "4" : basic = "직계비속, 입양자"; break;
							case "5" : basic = "형제, 자매"; break;
							case "6" : basic = "기타 부양가족"; break;
						}
						$basic = $("<td>").text(basic);
						$hshldr = $("<td>").text(data.list[key].hshldrYN);
						$womenHsh = $("<td>").text(data.list[key].womenHshldrYN);
						$one = $("<td>").text(data.list[key].onePrntYN);
						$dis = $("<td>").text(data.list[key].disorderYN);
						$older = $("<td>").text(data.list[key].olderYN);
						$ageSix = $("<td>").text(data.list[key].ageSixYN);
						$child = $("<td>").text(data.list[key].childAdoptYN);
						
						$tr.append($inputTd);
						$tr.append($delBtn);
						$tr.append($relation);
						$tr.append($famName);
						$tr.append($resiNo);
						$tr.append($basic);
						$tr.append($hshldr);
						$tr.append($womenHsh);
						$tr.append($one);
						$tr.append($dis);
						$tr.append($older);
						$tr.append($ageSix);
						$tr.append($child);
						
						$tableBody.append($tr);
					}
					
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalFamInfoClose", function() {
		$.ajax({
			url: "selectFamInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#famInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$relation = $("<td>").text(data.list[key].relation);
					$famName = $("<td>").text(data.list[key].famName);
					$resiNo = $("<td>").text(data.list[key].residentNo);
					var basic;
					switch(data.list[key].basicDeductionYN){
						case "0" : basic = "해당없음"; break;
						case "1" : basic = "본인"; break;
						case "2" : basic = "배우자"; break;
						case "3" : basic = "직계존속"; break;
						case "4" : basic = "직계비속, 입양자"; break;
						case "5" : basic = "형제, 자매"; break;
						case "6" : basic = "기타 부양가족"; break;
					}
					$basic = $("<td>").text(basic);
					$hshldr = $("<td>").text(data.list[key].hshldrYN);
					$womenHsh = $("<td>").text(data.list[key].womenHshldrYN);
					$one = $("<td>").text(data.list[key].onePrntYN);
					$dis = $("<td>").text(data.list[key].disorderYN);
					$older = $("<td>").text(data.list[key].olderYN);
					$ageSix = $("<td>").text(data.list[key].ageSixYN);
					$child = $("<td>").text(data.list[key].childAdoptYN);
					
					$tr.append($relation);
					$tr.append($famName);
					$tr.append($resiNo);
					$tr.append($basic);
					$tr.append($hshldr);
					$tr.append($womenHsh);
					$tr.append($one);
					$tr.append($dis);
					$tr.append($older);
					$tr.append($ageSix);
					$tr.append($child);
					
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