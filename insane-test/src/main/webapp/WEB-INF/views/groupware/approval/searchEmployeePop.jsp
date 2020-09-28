<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#popHeader{
		width: 100%;
		text-align: center;
		background: #2E2C8F;
		color: white;
		font-size: 25px;
		height: 40px;
		margin-top: 0;
	}
	#PopHeader p {
		line-height: 40px;
		margin : 0;
	}
	p{
		margin : 0 ;
	}
	#popContent{
		text-align: center;
		width: 100%;
	}

	#popContent input[type=search]{
		width: 60%;
		height: 30px;
		border-radius: 10px;
		border: 1px solid  #2E2C8F;
	}
	
	#searchBtn,#addEmp{
		background : #2E2C8F;
		color: white;
		border: none;
		width: 60px;
		height: 25px;
		font-size: 15px;
		border-radius: 10px;
	}
	#addZone{
		width: 85%;
		text-align: right;
	}
	#tableTitle{
		background : #2E2C8F;
		color: white;
		font-size: 15px;
		height: 35px;
		
	}
	#searchTable{
		border-collapse: collapse;
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		text-align : center;
		
	}
	#searchTable tr td{
		font-size: 13px;
		height: 30px;
	}

	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>INSANE 사원 검색 서비스</title>
</head>
<body>
	<div id="popHeader">
		<p>사원 찾기</p>
	</div>
	<br><br>
	<div id="popContent">
	<form id="searchForm" action="searchEmployee.app">
		
	<input type="search" id="searchBar" name="keyword">
		<br><br>
		<button type="button" id="searchBtn">검색</button>
		<br>
		
		<c:if test="${ empty keyword }">
		<p>검색어를 입력해주세요<br>(사원명,부서,직급)</p>
		</c:if>
		<c:if test="${ !empty keyword }">
		<p>${keyword}(으)로 검색한 결과입니다.<br>결과 :${fn:length(empList) }건</p>
		</c:if>
		<br>
	</form>
		<c:if test="${!empty empList }">
		<div id="addZone">
			<button type="button" id="addEmp">추가</button>
		</div>
		<br>
		<table id="searchTable">
			<tr id="tableTitle">
				<th></th>
				<th>사원코드</th>
				<th>사원명</th>
				<th>부서</th>
				<th>직급</th>
				<th>직책</th>
				<th>지역</th>
			</tr>
			<tr>
				<c:forEach var="i"  begin="0" end="${fn:length(empList)-1 }">
					<tr>
						<td class="empNoSeq"><input type="radio" name="emp" value=${ empList[i].empNoSeq } id="empNoSeq">	
						<td class="empNo">${empList[i].empNo }</td>
						<td class="empNameKor">${empList[i].empNameKor }</td>
						<td><p class="deptName">${empList[i].deptName }</p>
							<input  class="empDeptCode" type="hidden" value="${empList[i].empDeptCode }">
						</td>
						<td><p class="positionName">${empList[i].positionName }</p>
							<input  class="empPositionCode" type="hidden" value="${empList[i].empPositionCode }">
						</td>
						<td><p class="rspofcName">${empList[i].rspofcName }</p>
							<input class="empRspofcCode"  type="hidden" value="${empList[i].empRspofcCode }">
						</td>
						<td><p class="locationName">${empList[i].locationName }</p>
							<input class="empLocationCode" type="hidden" value="${empList[i].empLocationCode }">
						</td>
					</tr>
				</c:forEach>
			</tr>
		
		</table>
		
				
		
		
		</c:if>
		
	</div>	
	<script>
		$('#searchBtn').click(function(){
			
			 var keyword = $('#searchBar').val()
			 if(keyword ==""){
				 alert('검색어를 입력해 주세요');
			 }else{
				$('#searchForm').submit();
			 }
		});
		
		$('#addEmp').click(function(){
			var length = $('input:checkbox[name=emp]:checked').length;
			var empNoSeq = $( "#empNoSeq", opener.document ).val();
			var empName = $( "#empNoSeq", opener.document ).val();
			if(length == 0){
				alert('선택된 항목이 없습니다.');
			}else{
				
			}
			
		});
	
	</script>
</body>
</html>