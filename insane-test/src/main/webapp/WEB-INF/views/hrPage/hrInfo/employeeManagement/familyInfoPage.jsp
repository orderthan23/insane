<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#famInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#famInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#famInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#famInfoTable tbody td {
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
	<table id="famInfoTable">
		<thead>
			<tr>
				<th colspan="11">
					<span id="insertFamilyInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
				<td width="80px;">가족관계</td>
				<td width="120px;">성명</td>
				<td width="150px;">주민등록번호</td>
				<td width="120px;">기본공제</td>
				<td width="80px;">세대주</td>
				<td width="80px;">부녀자</td>
				<td width="80px;">한부모</td>
				<td width="80px;">장애인</td>
				<td width="80px;">경로우대</td>
				<td width="80px;">6세 이하</td>
				<td width="80px;">출산입양</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertFamilyInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #familyManagementPage")).hide();
		$("#familyManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertFamilyInfoForm input[name=empNoSeq]").val(empNoSeq);
		
		$.ajax({
			url: "selectFamInfo.em",
			type: "post",
			data: {
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
				console.log();
			}
		});
	});
</script>
</body>
</html>