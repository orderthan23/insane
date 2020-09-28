<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 교육 일정 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
	
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
#boardTable{
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border-collapse: collapse;
	
}
#boardTable td{
	height: 40px;
	border-bottom: 1px solid lightgray;
	font-weight: normal;
	color: black;
		font-size: 13px;
}
#headerTr{
 	border-collapse: collapse;
 	background: #2E2C8F;
 	color: white;
 	border: none;
 	height: 45px;
 
 	
}
#headerTr th{
	border-collapse: collapse;
	border: none;
	font-size: 18px;
	font-weight: bolder;
	background: #2E2C8F;
}
#addEdu{
	border: none;
	color: white;
	background: #2E2C8F;
	border-radius: 5px;
	height: 30px;
	font-size: 15px;
}
	

</style>
</head>
<body>
			<c:if test="${!fn:contains(auth,'EP5') }">
				<c:redirect url="/errorPage.mp" context="/insane"> <c:param name="msg" value="권한이 없습니다."/> </c:redirect>
			</c:if>			
	
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
				<br><br>
				<table id="boardTable">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>
						<c:if test="${fn:contains(auth,'EP1') }">
						<button id="addEdu" type="button">교육일정 추가</button>
						</c:if>
						</td>
					</tr>
					<tr id="headerTr">
						<th width="40%">교육명</th>
						<th width="20%">교육시작일</th>
						<th width="20%">교육종료일</th>
						<th width="20%">상태</th>
					</tr>
					<c:if test="${!empty eduList}">
					<c:forEach var="i" begin="0" end="${fn:length(eduList)-1 }">
					<tr class="info">
						
						<td class="firstZone">
							<input type="hidden" class="eduScheduleSeq" value="${eduList[i].eduScheduleSeq }">
							${eduList[i].eduTitle }
						</td>
						<td>${fn:substring(eduList[i].eduStartDate,0,10) }</td>
						<td>${fn:substring(eduList[i].eduEndDate,0,10) }</td>
						
						<td>
						
							 <c:if test="${eduList[i].eduStatus eq 'YET' }">
								예정
							</c:if>
							<c:if test="${eduList[i].eduStatus eq 'ING' }">
								진행중
							</c:if>
							<c:if test="${eduList[i].eduStatus eq 'DONE' }">
								완료
							</c:if>
							<c:if test="${eduList[i].eduStatus eq 'CANCLE' }">
								취소됨
							</c:if>
						</td>
					</tr>
					
					</c:forEach>
					</c:if>
				</table>
				<br><br><br>
				 <div id="pagingArea" align="center">
         <c:if test="${ pi.currentPage <= 1 }">
            [이전] &nbsp;
         </c:if>
         <c:if test="${ pi.currentPage > 1 }">
            <c:url var="blistBack" value="/selectList.bo">
               <c:param name="currentPage" value="${ pi.currentPage - 1}" />
            </c:url>
            <a href="${ blistBack }">[이전]</a>
         </c:if>
         
         <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:if test="${ p eq pi.currentPage }">
               <font color="#2E2C8F" size="4"><b>[${ p }]</b></font>
            </c:if>
            <c:if test="${ p ne pi.currentPage }">
               <c:url var="blistCheck" value="Edulist.edu">
                  <c:param name="currentPage" value="${ p }"/>
               </c:url>
               <a href="${ blistCheck }">${ p }</a>
            </c:if>
         </c:forEach>
         
         
         
         <c:if test="${ pi.currentPage >= pi.maxPage }">
            &nbsp; [다음]
         </c:if>
         <c:if test="${ pi.currentPage < pi.maxPage }">
         
            <c:url var="blistEnd" value="Edulist.edu">
               <c:param name="currentPage" value="${ pi.currentPage + 1 }"></c:param>
            </c:url>
            &nbsp; <a href="${ blistEnd }">[다음]</a>
         </c:if>
      </div>
			
			</div>
		</article>
	</section>
	
	
	
	</div>
	<script>
		 $('.info').click(function(){
			 var eduScheduleSeq = $(this).children('.firstZone').find('.eduScheduleSeq').val();
			
				location.href = 'eduDetail.edu?eduScheduleSeq=' + eduScheduleSeq
		 });
			
		$('#addEdu').click(function(){
			location.href = "insertEdu.edu";
		});
		
	</script>
</body>
</html>