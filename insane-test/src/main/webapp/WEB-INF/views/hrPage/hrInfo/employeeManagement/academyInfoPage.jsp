<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#acaInfoTable {
		margin-top: 10px;
		display: none;
		width: 99%;
		text-align: center;
		font-size: 13px;
		border-collapse: collapse;
	}
	#acaInfoTable thead th {
		font-size: 16px;
		text-align: right;
	}
	#acaInfoTable thead td {
		background: #EFEFFA;
		padding: 10px;
		font-weight: 800;
		border-top: 0.5px solid #2E2C8F;
		border-bottom: 0.5px solid #2E2C8F;
	}
	#acaInfoTable tbody td {
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
	<table id="acaInfoTable">
		<thead>
			<tr>
				<th colspan="7">
					<span id="insertAcaInfoBtn" class="btn">&#43;</span>
				</th>
			</tr>
			<tr>
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
		</tbody>
	</table>
<script type="text/javascript">
	$("#insertAcaInfoBtn").click(function() {
		modal2.style.display = "block";
		$("#modalPage2 .modal-content2").not($("#modalPage2 #academyManagementPage")).hide();
		$("#academyManagementPage").show();
		
		var empNoSeq = $("#basicEmpInfo #empNoSeq").val();
		
		$("#insertAcademyInfoForm input[name=empNoSeq]").val(empNoSeq);
		
		$.ajax({
			url: "selectAcaInfo.em",
			type: "post",
			data: {
				empNoSeq: $("#basicEmpInfo #empNoSeq").val()
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
				console.log();
			}
		});
	});
</script>
</body>
</html>