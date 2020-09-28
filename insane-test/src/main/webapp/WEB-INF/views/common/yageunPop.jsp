<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#popHeader{
		width: 100%;
		height: 40px;
		background: #2E2C8F;
		text-align: center;
	}
	#popHeader p {
		margin: 0;
		color: white;
		font-weight: bolder;
		line-height: 40px;
		font-size: 20px;
		
	}
	#popContent{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		
	}
	
	.labelt{
		width: 80px;
		
	}
	label{
		font-weight: bolder;
	}
	
	
	#popTable{
		width: 100%;
	
	}
	#popTable tr {
	 	height: 40px;
	 	
	}
	#popTable tr td{
		border-bottom: 1px solid lightgray;
	
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>INSANE :: 연장 근로 신청 서비스</title>
</head>
<body>
	<div id="popHeader">
		<p>연장근로 신청</p>
	</div>
	<br>
	<div id="popContent" align="center">
		<form id="insertExtraWork">
			<p style="font-size:18px; font-weight: bolder;">연장근로 신청서</p>
			<hr noshade="noshade" style="border-color:lightgray">
			<table id="popTable" align="left">
				<tr>
					<td class="labelt"><label>신청인</label></td>
					<td><input type="text" value="${sessionScope.loginUser.empNameKor }"></td>
					<td class="lablet"><label>부서</label></td>
					<td><input type="text" value="${sessionScope.loginUser.deptName }"></td>
				</tr>
			
				<tr>
					<td class="lablet"><label>직급</label></td>
					<td><input type="text" value="${sessionScope.loginUser.positionName }"></td>
					<td class="lablet"><label>추가 근무 신청일</label></td>
					<td><input type="date" id="workDate"></td>
				</tr>
				<tr>
					<td><label>신청 시간</label></td>
					<td colspan="3">
					<input type="time" style="margin-right:70px; width:170px;" id="startTime" value="${ limitTime.allowedWorkStart }" readonly>
					<label style="font-size:25px;">~</label>
					<input type="time" style="margin-left:70px; width:170px;" id="endTime">
					</td>
					
				</tr>
				<tr>
					<td colspan="4">
						<br>
						<label>내용</label>&nbsp;&nbsp;<select style="width: 400px;" id="macro">
							<option disabled="disabled" selected="selected">자주 쓰는 문구</option>
							<option>내일까지 마감기한이 있는 업무가 있습니다.</option>
							<option>긴박한 협업사와의 일정이 있습니다.</option>
							<option>업무의 양이 많습니다.</option>
							<option>야간에 반드시 진행해야할 작업이 있습니다.</option>
							<option>이른 아침에 반드시 진행해야할 작업이 있습니다.</option>
						</select>
						<br><br>
						
						<textarea style="width:100%; resize: none; height:200px; " id="issue"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="button" onclick="transfer();">확인</button>
						<button type="button" onclick="cancle();">취소</button>
					</td>
				</tr>
			</table>
		
		
		</form>
	</div>
	
	<script>
		$(function(){
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd='0'+dd
			} 

			if(mm<10) {
			    mm='0'+mm
			} 

			today = yyyy+'-'+mm+'-'+dd;
			$('#workDate').val(today);
			
		});
		
		function cancle(){
				self.close();
		}
		function transfer(){
			var extraWorkDate = $('#workDate').val();
			var startTime = $('#startTime').val();
			var endTime = $('#endTime').val();
			var issue = $('#issue').val();
			
		
			 $.ajax({
					 url : 'insertExtraWork.mp',
					 type: 'post',
					 data: {
						 extraWorkDate : extraWorkDate,
						 startTime : startTime,
						 endTime: endTime,
						 issue : issue
					 },
					 success: function(data){
						 	switch(data){
						 	case '1' : alert('정상적으로 접수 완료 되었습니다'); self.close(); break;
						 	case '2' :  alert("이미 신청하셨습니다"); break;
						 	case '3' : alert("알수 없는 에러발생!"); break;
						 	}
					 },
					 error: function(){
						 console.log('error....');
					 }
			}); 
				
		}
		
		$('#macro').change(function(){
			var sentence = $('#macro option:selected').text();
	
			$('#issue').text(sentence);
		})
	
	</script>
</body>
</html>