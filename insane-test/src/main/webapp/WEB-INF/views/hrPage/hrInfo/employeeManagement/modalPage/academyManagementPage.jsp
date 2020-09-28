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
	#academyManagementPage{
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
	#modalInsertAcaBtn2 {
		text-align: right;
		margin: 10px 0px;
	}
	#modalInsertAcaSpan2 {
		padding: 3px 10px;
		font-size: 13px;
		color: #2E2C8F;
		border: 2px solid #2E2C8F;
		border-radius: 5px;
	}
	#modalInsertAcaSpan2:hover {
		cursor: pointer;
	}
	#acaInfoTable2 {
		margin-top: 10px;
		width: 100%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#acaInfoTable2 thead th {
		font-size: 16px;
		text-align: right;
	}
	#acaInfoTable2 thead td {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-weight: 300;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#acaInfoTable2 tbody td {
		font-weight: 300;
		padding: 8px;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#acaInfoTableArea2 {
		height: 215px;
		overflow: auto;
	}
	#acaInfoTableArea2::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#acaInfoTableArea2::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.deleteAcaInfoBtn {
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
	.deleteAcaInfoBtn:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="academyManagementPage" class="modal-content2">
		
	<div class="modal-header">
		<div class="bluebox2">
			<span class="headerTextArea2">학력사항 관리</span>
			<span id="modalAcaInfoClose" class="close2">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="modalTableArea2">
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>학력 정보 추가</label>
			</div>
			<form name="insertAcademyInfoForm" id="insertAcademyInfoForm">
				<input type="hidden" name="empNoSeq">
				<table class="modalResultTable2" style="border-bottom: none;">
					<tr>
						<td class="colTd1" width="80px">기관명</td>
						<td width="80px"><input type="text" name="institutionName" maxlength="20"></td>
						<td class="colTd1" width="80px">전공</td>
						<td width="80px"><input type="text" name="major" maxlength="20"></td>
						<td class="colTd1" width="80px">부전공/복수전공</td>
						<td width="80px"><input type="text" name="subMajor" maxlength="20"></td>
					</tr>
				</table>
				<table class="modalResultTable2" style="border-top: none;">
					<tr>
						<td class="colTd1">입학일자</td>
						<td>
							<input type="date" name="entscDate">
						</td>
						<td class="colTd1">졸업일자</td>
						<td>
							<input type="date" name="graduDate">
						</td>
						<td class="colTd1">졸업여부</td>
						<td>
							<select id="graduYN" name="graduYN">
								<option value="" selected>선택</option>
								<option value="졸업">졸업</option>
								<option value="재학">재학</option>
								<option value="휴학">휴학</option>
								<option value="수료">수료</option>
							</select>
						</td>
						<td class="colTd1">학위</td>
						<td>
							<select id="degree" name="degree">
								<option value="" selected>선택</option>
								<option value="학사">학사</option>
								<option value="석사">석사</option>
								<option value="박사">박사</option>
							</select>
						</td>
					</tr>
				</table>
				<div id="modalInsertAcaBtn2">
					<span id="modalInsertAcaSpan2">추가하기</span>
				</div>
			</form>
			
			<div class="modalSubTitle2">
				<div id="bluebox"></div>
				<label>학력 정보 삭제</label>
			</div>
			<div id="acaInfoTableArea2">
				<table id="acaInfoTable2">
					<thead>
						<tr>
							<td width="20px;"></td>
							<td width="150px;">기관명</td>
							<td width="150px;">전공</td>
							<td width="150px;">부전공/복수전공</td>
							<td width="80px;">입학일자</td>
							<td width="80px;">졸업일자</td>
							<td width="80px;">졸업여부</td>
							<td width="80px;">학위</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="deleteAcaInfoBtn">-</span></td>
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

	$(document).on("click", "#modalInsertAcaSpan2", function() {
		
		var acaInfo = $("form[name=insertAcademyInfoForm]").serialize();
		
		$.ajax({
			url: "insertAcaInfo.em",
			type: "post",
			data: acaInfo,
			success: function(data) {
				
				$tableBody = $("#acaInfoTable2 tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$inputTd = $("<input>").attr("type", "hidden").attr("id", "academicCareerSeq").attr("name", "academicCareerSeq").val(data.list[key].academicCareerSeq);
					$delBtn = $("<td>");
					$span = $("<span>").attr("class", "deleteAcaInfoBtn").text("-");
					$delBtn.append($span);
					$insti = $("<td>").text(data.list[key].institutionName);
					$major = $("<td>").text(data.list[key].major);
					$sMajor = $("<td>").text(data.list[key].subMajor);
					$eDate = $("<td>").text(data.list[key].entscDate);
					$gDate = $("<td>").text(data.list[key].graduDate);
					$gYN = $("<td>").text(data.list[key].graduYN);
					$degree = $("<td>").text(data.list[key].degree);
				
					$tr.append($inputTd);
					$tr.append($delBtn);
					$tr.append($insti);
					$tr.append($major);
					$tr.append($sMajor);
					$tr.append($eDate);
					$tr.append($gDate);
					$tr.append($gYN);
					$tr.append($degree);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error");
			}
		});
	});
	
	$(document).on("click", "#acaInfoTable2 .deleteAcaInfoBtn", function() {
		var num = $(this).parent().parent().children("input").val();
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		var check = window.confirm("해당 학력 사항을 삭제하시겠습니까?");
		
		if(check) {
			$.ajax({
				url: "deleteAcaInfo.em",
				type: "post",
				data: {
					num: num,
					empNoSeq: empNoSeq
				},
				success: function(data) {
					
					$tableBody = $("#acaInfoTable2 tbody");
					$tableBody.html('');
					
					for(var key in data.list){
						$tr = $("<tr>");
						
						$inputTd = $("<input>").attr("type", "hidden").attr("id", "academicCareerSeq").attr("name", "academicCareerSeq").val(data.list[key].academicCareerSeq);
						$delBtn = $("<td>");
						$span = $("<span>").attr("class", "deleteAcaInfoBtn").text("-");
						$delBtn.append($span);
						$insti = $("<td>").text(data.list[key].institutionName);
						$major = $("<td>").text(data.list[key].major);
						$sMajor = $("<td>").text(data.list[key].subMajor);
						$eDate = $("<td>").text(data.list[key].entscDate);
						$gDate = $("<td>").text(data.list[key].graduDate);
						$gYN = $("<td>").text(data.list[key].graduYN);
						$degree = $("<td>").text(data.list[key].degree);
					
						$tr.append($inputTd);
						$tr.append($delBtn);
						$tr.append($insti);
						$tr.append($major);
						$tr.append($sMajor);
						$tr.append($eDate);
						$tr.append($gDate);
						$tr.append($gYN);
						$tr.append($degree);
						
						$tableBody.append($tr);
					}
					
				},
				error: function() {
					console.log("error");
				}
			});
		}
	});
	
	$(document).on("click", "#modalAcaInfoClose", function() {
		$.ajax({
			url: "selectAcaInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
			},
			success: function(data) {
				
				$tableBody = $("#acaInfoTable tbody");
				$tableBody.html('');
				
				for(var key in data.list){
					$tr = $("<tr>");
					
					$insti = $("<td>").text(data.list[key].institutionName);
					$major = $("<td>").text(data.list[key].major);
					$sMajor = $("<td>").text(data.list[key].subMajor);
					$eDate = $("<td>").text(data.list[key].entscDate);
					$gDate = $("<td>").text(data.list[key].graduDate);
					$gYN = $("<td>").text(data.list[key].graduYN);
					$degree = $("<td>").text(data.list[key].degree);
				
					
					$tr.append($insti);
					$tr.append($major);
					$tr.append($sMajor);
					$tr.append($eDate);
					$tr.append($gDate);
					$tr.append($gYN);
					$tr.append($degree);
					
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