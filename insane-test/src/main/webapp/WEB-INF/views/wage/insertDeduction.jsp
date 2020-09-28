<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertDeduction.sal" method="post" name="insertForm">
	공제사항코드 : <input type="text" name="deductionSeq" value="0"><br>
	공제항목명 : <input type="text" name="deductionName"><br>
	공제소득유형 : <input type="text" name="deductionType"><br>
	구분월급여액 : <input type="text" name="divSalary"><br>
	공제항목별 요율 : <input type="text" name="deductionPt"><br>
	자동등록여부 : <input type="text" name="autoRegist" value="Y"><br>
	사용여부 : <input type="text" name="usageStatus" value="Y"><br>
	비고 : <input type="text" name="remark" value="-"><br>
	회사번호 : <input type="text" name="companyNo" value="1001"><br>
	<br>
	공제사항내역번호 : <input type="text" name="deductionHistorySeq" value="0"><br>
	지급일자 : <input type="text" name="payDate" value="0"><br>
	금액 : <input type="text" name="amount" value="0"><br>
	사원번호 : <input type="text" name="empNoSeq" value="100001"><br>
	<input type="submit"><br><br>
</form>
<a id="moveBack" onclick="moveBack();">뒤로가기</a>
</body>
<script type="text/javascript">
function insert(){
	var deductionSeq = $("input[name=deductionSeq]").val();
	var deductionName = $("input[name=deductionName]").val();
	var deductionType = $("input[name=deductionType]").val();
	var divSalary = $("input[name=divSalary]").val();
	var deductionSeq = $("input[name=deductionPt]").val();
	var deductionPt = $("input[name=deductionSeq]").val();
	var autoRegist = $("input[name=autoRegist]").val();
	var usageStatus = $("input[name=usageStatus]").val();
	var remark = $("input[name=remark]").val();
	var companyNo = $("input[name=companyNo]").val();
	
	var deductionHistorySeq = $("input[name=deductionHistorySeq]").val();
	var payDate = $("input[name=payDate]").val();
	var amount = $("input[name=amount]").val();
	var empNoSeq = $("input[name=empNoSeq]").val();
}
function moveBack(){
	location.href = "mySalReport.sal";
}
</script>
</html>