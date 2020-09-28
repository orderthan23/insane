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
	#findEmpNoModal{
		display: none;
	}
	.bluebox {
		display: table-cell;
		width: 400px;
		height: 70px;
		background: #2E2C8F;
		vertical-align: middle;
	}
	.headerTextArea {
		display: inline-block;
		width: 300px;
		height: 30px;
		color: white;
		font-size: 20px;
		padding-left: 20px;
		padding-top: 9px;
	}
	.close {
		color: #aaa;
		font-size: 30px;
		float: right;
		margin-right: 20px;
		padding-top: 3px;
	}
	.searchModalTitle {
		display: inline-block;
		border: 2px solid #2E2C8F;
		border-radius: 4px;
		margin: 10px 20px;
		padding: 5px 10px;
		font-size: 15px;
	}
	.searchModalInput {
		height: 15px;
		padding: 5px 10px;
		width: 202px;
		margin-right: 20px;
	}
	.modalTableArea {
		margin-left: 20px;
		margin-right: 20px;
		margin-bottom:20px;
		width: 360px;
		height: 320px;
		overflow: auto;
	}
	.modalTableArea::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	.modalTableArea::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.modalBtnArea {
		margin-left: 20px;
		margin-right: 20px;
		text-align: right;
	}
	.modalBtn {
		background: #2E2C8F;
		padding: 5px 10px;
		border-radius: 4px;
		color: white;
	}
	.modalBtn:hover {
		cursor: pointer;
	}
	.modalResultTable {
		width: 100%;
		border: 2px solid #2E2C8F;
		border-collapse: collapse;
	}
	.modalResultTable th, .modalResultTable td {
		border: 1px solid #2E2C8F;
		padding: 5px 10px;
		text-align: center;
	}
	.modalResultTable th {
		background: #2E2C8F;
		color: white;
		font-size: 15px;
	}
	.modalResultTable td {
		font-size: 13px;
	}
	.modalResultTable tbody tr:hover {
		cursor: pointer;
	}
</style>
</head>
<body>

<div id="findEmpNoModal" class="modal-content">
		
	<div class="modal-header">
		<div class="bluebox">
			<span class="headerTextArea">사원 번호 조회</span>
			<span class="close">&times;</span>
		</div>
	</div>	<!-- modal-header end -->
	
	<div class="modal-body">
		<div class="searchModalTitle">사원번호 검색</div>
		<input class="searchModalInput" type="text" name="searchModalEmpNo">
		<div class="modalTableArea">
			<table id="findEmpNoModalTable" class="modalResultTable">
				<thead>
					<tr>
						<th width="80px">회사번호</th>
						<th>사원번호</th>
						<th width="80px">계정 활성화</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modalBtnArea">
			<span id="modalEmpBtn" class="modalBtn">선택하기</span>
		</div>
	</div>	<!-- modal-body -->	
	
</div>	<!-- modal-content end -->
<script type="text/javascript">
	
	var empNoSeq;
	var empNo;
	
	$(document).on("click", "#findEmpNoModalTable td", function() {
		empNoSeq = $(this).parent().children("input").val();
		empNo = $(this).parent().children("td").eq(1).text();
		console.log("num : " + empNoSeq);
		console.log("no : " + empNo);
		
		var checkTr = $(this).parent("tr");
		$("#findEmpNoModalTable tbody tr").css({"background":"white", "color":"black"});
		checkTr.css({"background-color":"rgba(46, 44, 143, 0.5)", "color":"white"});
	});
	
	$(document).on("click", "#modalEmpBtn", function () {
		console.log("num : " + empNoSeq);
		console.log("no : " + empNo);
		$("#empNoSeq").val(empNoSeq);
		$("#empNo").val(empNo);
		modal.style.display = "none";
	});
	
	$(document).on("click", ".close", function () {
		modal.style.display = "none";
	});

</script>
</body>
</html>