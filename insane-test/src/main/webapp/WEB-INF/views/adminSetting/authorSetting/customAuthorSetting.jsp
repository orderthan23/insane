<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		overflow-y: auto;
		/* text-align: -webkit-center; */
	}
	#article2 {
		display: inline-block;
		width: 25%;
		height: 100%;
		overflow-y: auto;
	}
	#article3 {
		display: inline-block;
		width: 49%;
		height: 100%;
		overflow-y: auto;
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
	.headTable {
		width: 100%
	}
	.btn {
		display: inline-block;
		width: 18px;
		height: 18px;
		background: #2E2C8F;
		color: white;
		text-align: center;
		border-radius: 50%;
	}
	.btn:hover {
		cursor: pointer;
	}
	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		border-radius: 10px;
		width: 30%; /* Could be more or less, depending on screen size */
		height: 30%;
	}
	
	/* The Close Button */
	.close {
		height: 21px;
		color: #aaa;
		float: right;
		font-size: 30px;
		font-weight: bold;
		text-align: right;
	}
	
	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	#modal-title{
		display: inline-block;
		height: 21px;
		line-height: 25px;
	}
	#model-headerLine{
		display: inline-block;
		width: 100%;
		height: 1px;
		background-color: black;
	}
	.modal-body {
		height: 80%;
	}
	#insertForm {
		text-align: -webkit-center;
		padding-top: 11%;
		padding-bottom: 11%;
	}
	#insertTable {
		width: 400px;
		border: 1px solid #2E2C8F;
		border-radius: 3px;
		border-collapse: collapse;
		text-align: center;
	}
	#insertTable th {
		background: #2E2C8F;
		color: white;
		padding: 10px;
		font-size: 15px;
	}
	#insertTable td {
		padding: 10px;
	}
	#modalBtnArea {
		margin: 20px;
	}
	.modalBtn {
		margin: 10px;
		display: inline-block;
		width: 80px;
		height: 20px;
		border-radius: 5px;
		background: #2E2C8F;
		color: white;
		padding: 5px;
		font-size: 15px;
		line-height: 20px;
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
					<label>사용자 정의 권한 설정</label>
				</div>
				<div id="headerLine"></div>
				
				<div id="tableArea">
					<div id="article1">
						<div class="tableInfoArea">
							<table class="headTable">
								<tr>
									<td><span class="tableInfoHeader">커스텀 권한</span></td>
									<td><span>${fn:length(customList)}개</span></td>
									<td>
										<span id="insertCuntom" class="btn">&#43;</span>
										<span class="btn" onclick="deleteCustom();">&#45;</span>
									</td>
								</tr>
							</table>
						</div>
						<table class="tableType1 table">
							<thead>
								<tr>
									
									<th>명칭</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty customList }">
							 	<c:forEach var="i"  begin="0" end="${fn:length(customList)-1}">
								<tr class="customList">
									
									<td class="customTd">
									<input type="hidden" value="${customList[i].authorityCodeSeq }" class="customSeq">
									${customList[i].authorityTypeName }
									</td>
								</tr>
								</c:forEach> 
								</c:if>
							</tbody>
						</table>
					</div>	<!-- article1 end -->
					
 					<div id="article2">
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
							
							</tbody>
							</c:forEach>
							</c:if>
						</table>
						</form>
 					</div>	<!-- article2 end -->
 					
 					<div id="article3">
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
	
	<!-- modal -->
	<div id="insertCustomAuthor" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<div id="bluebox"></div>
				<h3 id="modal-title">커스텀 권한 추가</h3>
				<div class="close">&times;</div>
				<div id="model-headerLine"></div>
			</div>	<!-- modal-header end -->
			<div class="modal-body">
				<form id="insertForm" action="">
					<table id="insertTable">
						<thead>
							<tr>
							
								<th>명칭</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="customName" style="width: 250px;"></td>
							</tr>
						</tbody>
					</table>
					<div id="modalBtnArea">
						<span id="insertCustomAuthorBtn" class="modalBtn" onclick="addCustomAuth();">권한추가</span>
						<span id="outModal2" class="modalBtn">취소</span>
					</div>
				</form>
			</div>	<!-- modal-body -->
		</div>	<!-- modal-content end -->
	</div>	<!-- modal end -->
	<input type="hidden" id="hiddenCustom">
	
<script type="text/javascript">

	var modal = document.getElementById("insertCustomAuthor");
	var outModal = document.getElementsByClassName("close")[0];
	var outModal2 = document.getElementById("outModal2");
	
	$(document).on("click", "#insertCuntom", function() {
		modal.style.display = "block";
	});
	
	outModal.onclick = function() {
		modal.style.display = "none";
	}
	
	outModal2.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	
	function addCustomAuth(){
		var name = $('#customName').val();
		if(name == "" || name==null){
			alert("권한을 입력해주세요");
		}else{
			$.ajax({
				url : 'addCustomAuth.cp',
				type: 'post',
			    data: {name: name},
			    success: function(data){
			    	switch(data){
			    	case '1' : location.reload(true); break;
			    	case '2' : alert("중복된 커스텀 권한 명입니다."); break;
			    	case '3' : alert("알수 없는 에러입니다 다시 시도해주세요"); break;
			    	}
			    },
			    error: function(){
			    	console.log('error...');
			    }
			});				
		}
	}
	
	var type = 'custom';
	$('.customList').click(function(){
	
		$('.useful').remove();
		$('.authCode:checked').each(function() {
			$(this).removeAttr('checked');
		});
		
		$(this).css('background','#c4c4c4');
		$('.customList').not(this).css('background','white');
		var seq = $(this).children('.customTd').find('.customSeq').val();
		
		$('#hiddenCustom').val(seq);
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
		var customNum = $('#hiddenCustom').val();
		var queryString = $('#authKind').serialize();
		$.ajax({
			url : 'updateAuth.cp',
			type: 'post',
			data: {
				seq : customNum,
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
	
	
	function deleteCustom(){
		var customNumber = $('#hiddenCustom').val();
		if(customNumber == "" || customNumber == null){
			alert('삭제하실 커스텀 명칭을 선택해 주세요');
		}else{
			if(window.confirm('해당 커스텀 권한을 삭제하시겠습니까? 해당 권한은 복구 되지 않습니다.')){
				$.ajax({
					url : 'deleteCustomCode.cp',
					type : 'post',
					data : {customNumber : customNumber},
					success: function(data){
						switch(data){
						case '1' : location.reload(true); break;
						case '2' : alert("알수 없는 에러 발생 삭제에 실패하였습니다."); break;
						}
						
					},
					error: function(){
						console.log('error...');
					}
				});
				
			}else{
				return;
			}
		}
	}
	
	$('#selectBar').change(function(){
		var customNumber2 = $('#hiddenCustom').val();
		if(customNumber2 == "" || customNumber2 == null){
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