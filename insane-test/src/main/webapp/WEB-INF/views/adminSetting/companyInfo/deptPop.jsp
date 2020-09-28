<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#popTitleZone{
		width: 100%;
		height: 40px;
		text-align: center;
		background: #2E2C8F;
	}
	#popTitle{
		font-size: 20px;
		font-weight: bolder;
		line-height: 40px;
		color: white;
	}
	
	#popTable{
	 width: 100%;
	 align: center;
	}
	
	#popTable td{
		text-align : center;
		border-bottom: 1px solid lightgray;
	}
	
	#tableHeader{
		font-size: 20px;
		font-weight: bolder;
		color: white;
		background: #2E2C8F;
		text-align: center;
	}
	
	#warning{
		font-weight : bolder;
		color: red;
		font-size: 15px;
	}
	.choiceBtn{
		border: none;
		border-radius: 10px;
		background: #2E2C8F; 
		color: white;
		font-weight: bolder;
	}
</style>
<title>INSANE 부서 검색 서비스</title>
</head>
<body>
	<div id="popTitleZone">
		<p id="popTitle">INSANE 부서 검색 서비스</p>
	</div>
	
	
	<c:if test="${empty deptList }">
		<p id="warning"> 사내 등록된 부서가 없습니다.</p>
	</c:if>
	<c:if test="${!empty deptList }">
		<p>사내 등록된 부서가 총 <label style="font-size:20px; color:#2E2C8F; font-weight:bolder;">${fn:length(deptList)}</label>개 있습니다.</p>
		<br>
		<table id="popTable">
			<tr>
				<td id="tableHeader" colspan="2"> 부서명 </td>
			</tr>
			<c:forEach var="i" begin="0" end="${fn:length(deptList)-1}">
			<tr>
				<td><input type="hidden" class="deptCodeSeq" value="${deptList[i].deptCodeSeq}">
					<p class="deptName">${deptList[i].deptName }</p>
				</td>
				<td>
					<button type="button" onclick = "transParents(this)" class="choiceBtn">선택</button>
				</td>
			</tr>
			
			</c:forEach>
		</table>
	
	</c:if>
	<script>
		function transParents(who){
			var value = $(who).parent().prev().find('.deptName').text();
			$(opener.document).find("#managerDept").val(value); //find를 이용한 jquery
  	 		self.close();

			
		}
	</script>
	
</body>
</html>