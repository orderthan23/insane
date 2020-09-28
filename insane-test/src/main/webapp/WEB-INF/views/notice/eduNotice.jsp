<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSANE :: 교육 안내 페이지</title>
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
article{
	width: 90%;
	height: 750px;
	margin-left: auto;
	margin-right: auto;
}
#deleteBtn,
#writeBtn{
	color: white;
	background: #2E2C8F;
	border-radius: 3px;
	border: none;
	width: 60px;
	height: 30px;

}
#btnZone td{
	border-bottom: none;
}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
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
				<p style="font-size:20px;">사내 소식</p>
				<br><br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=공지">공지사항</a>
				<br>
				<a style="text-decoration:none; color:white;" href="selectList.no?type=소식">전달사항</a>
				<br>
				<a style="background:#524FE3; color: #ffffff; text-decoration:none;" href="noticeEdu.edu">교육안내</a>
			
			</div>
		</aside>
	<section>
		<article>
			<div id="articleWrap">
				<br><br>
				<span id="blueBox">`</span><label style="font-size:20px;">교육 안내</label>
				<br><br>
				<table id="boardTable">
					
					<tr id="headerTr">
						<th width="10%">번호</th>
						<th width="40%">제목</th>
						<th width="20%">작성자</th>
						<th width="20%">작성일</th>
						<th width="10%">열람</th>
					</tr>
					<c:if test="${!empty eduList  }">
					<c:forEach var="i" begin="0" end="${fn:length(eduList)-1 }">
					
					<c:if test="${eduList[i].status eq '공개' }">
					<tr>
						
						<td class="firstZone">
						<input type="hidden" value="${eduList[i].boardSeq}" class="boardSeq">
						${eduList[i].boardNo }
						</td>
						<td class="info">${eduList[i].boardTitle }</td>
						<td>${eduList[i].empNameKor }</td>
						<td>${fn:substring(eduList[i].enrollDate,0,10) }</td>
						<td>${eduList[i].status}</td>
					</tr>
					
					</c:if>
					<c:if test="${eduList[i].status ne '공개' }">
					<c:if test="${fn:contains(auth,'E1')}">
					<tr>
						
						<td class="firstZone">
						<input type="hidden" value="${eduList[i].boardSeq}" class="boardSeq">
						${eduList[i].boardNo }
						</td>
						<td class="info">${eduList[i].boardTitle }</td>
						<td>${eduList[i].empNameKor }</td>
						<td>${fn:substring(eduList[i].enrollDate,0,10) }</td>
						<td>${eduList[i].status }</td>
					</tr>
					
					</c:if>
					</c:if>
					
					</c:forEach>
					</c:if>
					<tr id="btnZone">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td colspan="1"><br>
						<c:if test="${fn:contains(auth,'E1') }">
						<button type="button" id="writeBtn">글 쓰기</button>
						</c:if>
						</td>
					</tr>
				</table>
				<br><br><br>
			 	 <div id="pagingArea" align="center">
         <c:if test="${ pi.currentPage <= 1 }">
            [이전] &nbsp;
         </c:if>
         <c:if test="${ pi.currentPage > 1 }">
            <c:url var="blistBack" value="/Edulist.edu">
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
			 var boardSeq = $(this).parent().children('.firstZone').find('.boardSeq').val();
			
			 
			 	location.href = 'eduNoticeDetail.edu?boardSeq=' + boardSeq; 
		 });
			
		$('.info').parent().hover(function(){
			$(this).css('background','#f1f1f1');
		},
		function(){
			$(this).css('background','white');
		}
		); 
		
		$('#writeBtn').click(function(){
			location.href = "writeNoticeEdu.edu";
		});
		
	
	</script>
</body>
</html>