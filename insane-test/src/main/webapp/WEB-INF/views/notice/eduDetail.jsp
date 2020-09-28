<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
</head>
<style>
	#articleWrap{
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}
#blueBox{
	
	width: 10px;
	height: 25px;
	background: #2E2C8F;
	margin-right: 5px;
}
#infoTable{
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	
}
#infoTable td{
	
	height: 40px;
	border-top : 1px solid lightgray;
	font-size: 15px;
}
#infoTable td input{
	width: 100%;
	font-size: 15px;
	
}
#infoTable td p{
	
	
	
	
	
}
.tableTitle{
	text-align: center;
	width: 20%;
}
.tableContent{
  width: 30%;
}
#buttonZone{
 width: 90%;
 margin-left: auto;
 margin-right: auto;
}
#tableBtnZone td{
	border: none;
}
#backBtn,#cancleBtn,#writeBtn{
	background : #2E2C8F;
	color: white;
	border-radius: 10px;
	border: none;
}
#backBtn,#writeBtn{
	width: 120px;
	height: 40px;
	font-size: 15px;
}
#cancleBtn{
	width: 80px;
	height: 30px;
	font-size: 15px;
}
article{
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	overflow-y: auto;
	height: 750px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp"/>
	<div id="contentWrapper">
	<aside>
			<div id="profileZone">
			<c:if test="${empty companyInfo.companyLogoImgPath }">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
        	</c:if>
        	<c:if test="${!empty companyInfo.companyLogoImgPath }">
        	<img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
        	</c:if><br><br>
			 <p style="font-size: 17px;">${companyInfo.companyName }</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">${companyInfo.businessBigType}</p>
			</div>
			<br> <br>
			<div id="sideMenu" align="center">
				<p style="font-size:20px;">교육관리</p>
				<br><br>
				<a style="background:#524FE3; color: #ffffff; text-decoration:none;" href="Edulist.edu">교육일정관리</a>
				<br>
				<a style="text-decoration:none; color:white;" href="moveEduAssessment.edu">교육이수내역</a>
			
			</div>
		</aside>
	<section>
		<article>
			<div id="articleWrap">
				<br><br>
				<span id="blueBox">`</span><label style="font-size:20px;">교육일정 관리</label>	
				<hr>
				<br><br>
				
				<table id="infoTable">
					<tr id="tableBtnZone">
							<td></td>					
							<td></td>					
							<td></td>					
							<td align="center">
								<c:if test="${edu.eduStatus eq 'YET' }">
									<c:if test="${fn:contains(auth,'EP3') }">
									<button style="float: right;" id="cancleBtn">교육 취소</button>
									</c:if>			
								</c:if>
							</td>					
					</tr>
					<tr>
						<td class="tableTitle">교육제목</td>
						<td colspan="3"><input type="text" value="${edu.eduTitle }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="tableTitle">교육코드</td>
						<td class="tableContent"><input type="text" value="${edu.educationSeq }" readonly="readonly"></td>
						<td class="tableTitle">교육종류</td>
						<td class="tableContent"><input type="text" value="${edu.educationType }" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="tableTitle" >교육기간</td>
						<td class="tableContent">${fn:substring(edu.eduStartDate,0,10)}&nbsp;  ~ &nbsp; ${fn:substring(edu.eduEndDate,0,10)}</td>
						<td class="tableTitle"></td>
						<td class="tableContent"></td>
					
					</tr>
					<tr>
						<td class="tableTitle">교육장소</td>
						<td class="tableContent"><input type="text" value="${edu.eduPlace }" readonly="readonly"></td>
						<td class="tableTitle">대상인원</td>
						<td class="tableContent"><input type="text" value="${edu.targetAmount }" readonly="readonly"></td>
						
					</tr>
					<tr>
						<td class="tableTitle">담당강사</td>
						<td class="tableContent"><input type="text" value="${edu.instrInfo }" readonly="readonly"></td>
						<td class="tableTitle">사내외구분</td>
						<td class="tableContent">
						<c:if test="${edu.inOfficeYn eq 'Y' }"><input type="text" value="내부" readonly="readonly"></c:if>
						<c:if test="${edu.inOfficeYn eq 'N' }"><input type="text" value="외부" readonly="readonly"></c:if>
						</td>
					</tr>
					<tr>
						<td class="tableTitle">교육비</td>
						<td class="tableContent"><input type="text" value="${edu.eduCost }" readonly="readonly"></td>
						<td class="tableTitle">교육 상태</td>
						<td class="tableContent">
							<c:if test="${edu.eduStatus eq 'YET' }"><p>진행 전</p></c:if>
							<c:if test="${edu.eduStatus eq 'ING' }"><p style="color: blue;">진행 중</p></c:if>
							<c:if test="${edu.eduStatus eq 'DONE' }"><p style="color: green">완료</p></c:if>
							<c:if test="${edu.eduStatus eq 'RDONE' }"><p style="color: green">최종완료</p></c:if>
							<c:if test="${edu.eduStatus eq 'CANCLE' }"><p style="color: red;">취소 됨</p></c:if>
						</td>
					</tr>
					<tr>
						<td class="tableTitle">교육내용</td>
						<td class="tableContent" colspan="3">
						 	<textarea style="width: 100%; resize:none; height:400px;" readonly="readonly">${edu.eduContent}</textarea>
						</td>
					</tr>
					<c:if test="${edu.eduStatus eq 'DONE' || edu.eduStatus eq 'RDONE' }">
					
					<tr>
						<td class="tableTitle">변동사항</td>
						<td class="tableContent" colspan="3" rowspan="2" style="height: 70px;">
						<textarea id="textZone" style="resize: none; width:100%; height: 60px; vertical-align: middle; margin-top:10px;"readonly="readonly">${edu.changeIssue }</textarea>
						</td>
					</tr>
					</c:if>
				</table>
					<br><br>
					<div id="buttonZone" align="center">
						<button id="backBtn" onclick="back();">이전 페이지로</button>
						<c:if test="${edu.eduStatus eq 'DONE' || edu.eduStatus eq 'RDONE' }">
							<c:if test="${fn:contains(auth,'EP2') }">
								<button id="writeBtn" onclick="writeChange();">변동사항 작성</button>
							</c:if>			
						</c:if>
					</div>
					<br><br>
				</div>
		</article>
	</section>
	</div>
	
	<script>
		var eduScheduleSeq = "${edu.eduScheduleSeq}";
		var origin;
		$('#cancleBtn').click(function(){
			if(window.confirm("정말 해당 교육을 취소하시겠습니까? 취소된 교육은 복구 할 수 없습니다.")){
				$.ajax({
					url : 'cancleEdu.edu',
					type: 'post',
					data: {eduScheduleSeq : eduScheduleSeq},
					success: function(data){
						if(data == '1'){
							alert("교육이 정상적으로 취소 되었습니다");
							location.href = "Edulist.edu";
						}else{
							alert("취소 실패 다시 시도해 주세요");
						}
						
					},
					error: function(){console.log("error...")}
				});
					
			
			}else{
				return;
			}
		});
		
		function writeChange(){
			alert("수정 모드로 전환 되었습니다");
			$('#textZone').removeAttr('readOnly');
			$('#writeBtn').text('취소');
			$('#writeBtn').attr('onclick',"cancle();");
			$('#backBtn').text('저장')
			$('#backBtn').attr('onclick',"save();");
			
		}
		function cancle(){
			 origin = "${edu.changeIssue}";
			 $('#textZone').val(origin);
			 $('#textZone').prop('readOnly',true);
			 $('#writeBtn').text("변동사항 작성");
			 $('#writeBtn').attr('onclick','writeChange();');
			 $('#backBtn').text("이전 페이지로");
			 $('#backBtn').attr('onclick','back();');
			 
		}
		function save(){
			var changeIssue = $('#textZone').val();
			$.ajax({
				url : 'updateChangeIssue.edu',
				type: 'post',
				data: {eduScheduleSeq : eduScheduleSeq,
					   changeIssue : changeIssue		
				},
				success: function(data){
					if(data == '1'){
						alert("변동사항 입력 완료")
						window.reload(true);
					}else{
						alert("이유를 알수 없는 에러가 발생했습니다. 다시 시도해 주세요.");
					}
				},
				error: function(){
					console.log("error...")
				}
				
			});
		}
		
		function back(){
			history.back();
		}
	</script>
		

	
</body>
</html>