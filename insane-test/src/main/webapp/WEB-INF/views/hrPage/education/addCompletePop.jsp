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
<title>INSANE 교육 이수자 추가 서비스</title>
</head>
<body>
	<div id="popHeader">
		<p>이수자 추가</p>
	</div>
	<br><br>
	<div id="popContent">
	<form id="searchForm" action="searchMemberInEdu.edu">
		
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
				<th width="5%"></th>
				<th width="20%">사원코드</th>
				<th width="15%">사원명</th>
				<th width="30%">부서</th>
				<th width="15%">직급</th>
				<th width="15%">직책</th>
			</tr>
			<tr>
				<c:forEach var="i"  begin="0" end="${fn:length(empList)-1 }">
					<tr>
						<td><input type="checkBox" name="emp" value=${ empList[i].empNoSeq }>	
						<td>${empList[i].empNo }</td>
						<td>${empList[i].empNameKor }</td>
						<td>${empList[i].deptName }</td>
						<td>${empList[i].positionName }</td>
						<td>${empList[i].rspofcName }</td>
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
			var eduScheduleSeq = $( "#eduScheduleSeq", opener.document ).val();
			if(length == 0){
				alert('선택된 항목이 없습니다.');
			}else{
				var array = new Array();
				var i= 0 ;
				$('input:checkbox[name=emp]:checked').each(function(){
					array[i] = $(this).val();
					
					
					i++;
					
				});
				var empNoSeq="";
				for(var i=0; i<array.length ; i++){
					if(i==(array.length-1)){
						empNoSeq+= array[i];
					} else{
						
					empNoSeq+= array[i]+",";
					}
				}
			/* 	$('#hiddenForm input').val(empNoSeq); */
				console.log(empNoSeq);
				$.ajax({
					url: 'insertCompleteEmp.edu',
				    type: 'post',
				    data: { empNoSeq : empNoSeq,
				    		eduScheduleSeq: eduScheduleSeq} ,
				    success: function(data){
				    	if(data=='1'){
				    		alert("이수자 추가가 정상적으로 완료 되었습니다");
				    		opener.parent.reset();
				    		self.close();
				    	}else{
				    		alert("에러 발생 다시 시도해주세요.");
				    	}
				    },
				    error: function(){
				    	console.log('error...');
				    }
				    
				});
			}
			
		});
	
	</script>
</body>
</html>