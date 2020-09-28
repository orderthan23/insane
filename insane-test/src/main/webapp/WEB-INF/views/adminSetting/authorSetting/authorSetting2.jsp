<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#mainContent{
	    display: block;
	    order: 2;   
	    height : 100%;
	    padding: 2em;
	    margin-left: auto;
	    margin-right: auto;
	}
	#contentArea{
	    background : #ffffff;
	    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	    border-radius: 15px;
	    width: 1075px;
	    height: 820px;
	}
	#bluebox{
		display: inline-block;
		width: 11px;
		height: 21px;
		background-color: #2E2C8F;
		vertical-align: text-bottom;
	}
	#contentHeader{
		padding-top: 30px;
		padding-left: 30px;
		padding-right: 30px;
		font-size: 18px;
		font-weight: 700;
	}
	#headerLine{
		display: inline-block;
		width: 1015px;
		margin-left: 30px;
		height: 1px;
		background-color: black;
	}
	#tableArea{
		height: 88%;
		padding: 15px 28px;
		text-align: center;
	}
	#article1 {
		display: inline-block;
		width: 25%;
		height: 100%;
		overflow-y:auto; 
		/* text-align: -webkit-center; */
	}
	#article2 {
		display: inline-block;
		width: 25%;
		height: 100%;
		overflow-y:auto; 
	}
	#article3 {
		display: inline-block;
		width: 49%;
		height: 100%;
		overflow-y:auto; 
	}
	input[type=text]{
		width: 90px;
		border-radius: 5px;
		border-color: #2E2C8F;
	}
	.tableInfoArea {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: left;
	}
	.tableInfoHeader {
		font-weight: bolder;
		font-size: 18px;
		
	}
	.table {
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	.table th {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-size: 15px;
	}
	.table tbody td {
		font-size: 12px;
		text-align: center;
		padding: 10px;
		border-bottom: 1px solid black;
	}
	.tableType1 tbody tr:hover {
		cursor: pointer;
		background: #B3B3CD;
		color: white;
	}
	.tableWrap::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	.tableWrap::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.headTable {
		width: 100%
	}
	#saveBtn{
		background: #2E2C8F;
		color: white;
		border-radius: 5px;
		border: none;
		width: 70px;
		height: 25px;
		
	}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../../common/adminSetting/adminNav.jsp" />
	<div id="contentWrapper">
		<jsp:include page="../../common/adminSetting/adminAside.jsp" />
		<div id="mainContent">
	        <div id="contentArea">
				<div id="contentHeader">
					<div id="bluebox"></div>
					<label>계정별 권한 설정</label>
				</div>
				<div id="headerLine"></div>
				
				<div id="tableArea">
					<div id="article1" class="tableWrap">
						<div class="tableInfoArea">
							<table class="headTable">
								<tr>
									<td><span class="tableInfoHeader">계정</span></td>
									<td><span>${fn:length(empList) }개</span></td>
									<td><span><input type="text"></span></td>
								</tr>
							</table>
						</div>
						
						<table class="tableType1 table">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>상태</th>
									
								</tr>
							</thead>
							
							<tbody>
								<c:if test="${!empty empList }">
								<c:forEach var="i"  begin="0" end="${fn:length(empList)-1 }">
								<tr class="empList">
									<td class="empNumber"><input type="hidden" value="${empList[i].empNoSeq }" name="empNoSeq" class="empNoSeq">${empList[i].empNo }</td>
									<td>${empList[i].empNameKor }</td>
									<td>
										<c:if test="${empList[i].empStatus == 'Y' }">사용중</c:if>
										<c:if test="${empList[i].empStatus == 'D' }">활성</c:if>
										<c:if test="${empList[i].empStatus == 'N'}">비활성</c:if>
										<c:if test="${empList[i].empStatus == 'R'}">퇴사자</c:if>
									</td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
						
					</div>	<!-- article1 end -->
					
 					<div id="article2" class="tableWrap">
						<div class="tableInfoArea">
							<table class="headTable">
								<tr>
									<td><span class="tableInfoHeader">권한타입</span></td>
									<td><span>${fn:length(authList) }개</span></td>
									<td><span><input type="text"></span></td>
								</tr>
							</table>
						</div>
						<form id="authKind">
						<table class="tableType1 table">
							<thead>
								<tr>
									<th colspan="2">권한종류</th>
								</tr>
							</thead>
								<c:if test="${!empty authList }">
								<c:forEach var="i"  begin="0" end="${fn:length(authList)-1 }">
							<tbody>
								<tr>
									<td width="10px"><input type="checkbox" value="${authList[i].authCode }" class="authCode" name="authCode"></td>
									<td class="authName">${authList[i].authName }</td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
						</form>
 					</div>	<!-- article2 end -->
						
 					
 					<div id="article3" class="tableWrap">
						<div class="tableInfoArea">
							<table class="headTable">
								<tr>
									<td><span class="tableInfoHeader">유효권한</span></td>
									<td><span><label id="amount">0</label>개</span></td>
									<td><span><input type="text"></span></td>
									<td>
										<select id="selectBar">
											<option>사용자 정의 권한</option>
												<c:if test="${!empty customList }">
										<c:forEach var="i"  begin="0" end="${fn:length(customList)-1 }">
											<option value="${customList[i].authCode }">${customList[i].authorityTypeName}</option>	
										</c:forEach>
										</c:if>
										</select>
										&nbsp;
										<button type="button"  id="saveBtn" onclick="save();">저장하기</button>
									</td>
								</tr>
							</table>
						</div>
						<table class="tableType2 table">
							<thead>
								<tr>
									<th colspan="2">사용가능권한</th>
					
								</tr>
							</thead>
							<tbody id="usefulAuthList">
							
							</tbody>
						</table>
 					</div>	<!-- article3 end -->
					
				</div>	<!-- tableArea End -->
			</div>  <!--   contentArea End -->
		</div>  <!--   mainContent End -->
	</div>	<!-- contentWrapper -->
	<input type="hidden" id="hiddenEmp">
	
	
<script type="text/javascript">
	var type = 'emp';
	$('.empList').click(function(){
	
		$('.useful').remove();
		$('.authCode:checked').each(function() {
			$(this).removeAttr('checked');
		});
		
		$(this).css('background','#c4c4c4');
		$('.empList').not(this).css('background','white');
		var seq = $(this).children('.empNumber').find('.empNoSeq').val();
		
		$('#hiddenEmp').val(seq);
		$.ajax({
			url:'loadUsefulAuth.cp',
			type:'post',
			data:{
				seq: seq,
				type: type
			},
			success: function(data){
						
				addUsefulAuth(data);
			},
			error : function(){
				console.log('error...');
			}
		});
		
	});
	
	function addUsefulAuth(data){

		
		var authLength = parseInt("${fn:length(authList)}");
		var array = data.split(',');
		for(var i = 0; i<array.length; i++){
			
			for(var j = 0; j<authLength; j++){
			  var authCode = 	$('.authCode:nth('+ j +')').val()
				
				if(array[i] == authCode){
					$('.authCode:nth('+ j +')').attr("checked",true);		
				}
				
			}
			
		}
		var checkedLength = $('.authCode:checked').length;
		
		 $('.authCode:checked').each(function() {
		       var authName = $(this).parent().next().text();
		      $('#usefulAuthList').append('<tr class="useful"><td>'+ authName + '</td></tr');

		  });

		  $('#amount').text(checkedLength);
	}
	
	
	function save(){
		var empNum = $('#hiddenEmp').val();
		var queryString = $('#authKind').serialize();
		console.log(empNum);
		console.log(queryString);
		console.log(type);
		$.ajax({
			url : 'updateAuth.cp',
			type: 'post',
			data: {
				seq : empNum,
				queryString : queryString,
				type: type
			},
			success: function(data){
				switch(data){
				case '1' : location.reload(true); break;
				case '2','3' : alert('에러가 발생하였습니다 다시 시도해주세요'); break;
				 
				}
				
			},
			error : function(){
				console.log('error...');
			}
			
		});
	}
	
	
	$('#selectBar').change(function(){
		var empNumber2 = $('#hiddenEmp').val();
		if(empNumber2 == "" || empNumber2 == null){
			alert("권한을 먼저 선택해주세요 ");
		}else{
			
			 $('.authCode:checked').each(function() {
					$(this).attr('checked',false);
			  });
		
			
			 
		var authCodes = $('#selectBar option:selected').val();
		console.log(authCodes);
		var authLength2 = parseInt("${fn:length(authList)}");
		var array2 = authCodes.split(',');
		for(var i = 0; i<array2.length; i++){
			
			for(var j = 0; j<authLength2; j++){
			  var authCode2 = 	$('.authCode:nth('+ j +')').val()
				
				if(array2[i] == authCode2){
					$('.authCode:nth('+ j +')').attr("checked",true);		
				}
				
			}
			
		}
		}
	});
	
</script>
</body>
</html>