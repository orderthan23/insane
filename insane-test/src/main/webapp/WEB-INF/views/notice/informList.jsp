<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/layout.css">
	
<style>

	thead{
		background-color:#2E2C8F;
	}
	
	th{
		color:white;
	}
	
	tr{
		border-bottom:1px solid lightgray;
	}
	#section{
		display:inline-block;
		overflow:hidden;
		width:1000px;
		height:750px;
		background:white;
		position:absolute;
		top:150px;
		left:300px;		
		border-radius:20px;
		
	}
	
	.bluerect{
		display:inline-block;		
		width:15px;
		height:30px;
		background-color:#2E2C8F;
		position:relative;
		top:5px;
		left:20px;
	}	
	#pageTitle{
		font-size: 20px;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	.boardTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}
	.boardTable td{
		font-weight: normal;
		font-size: 15px;
		
	}
	
	.pageArea{
		position:absolute;
		left:400px;
		bottom:20px;
	}
	
	 .pageBtn{
	 	text-decoration:none;
	 	color:white;
	 	background:#2E2C8F;
	 	margin:auto auto;
	 	border-radius:5px;
	 	display:inline-block;
	 	width:35px;
	 	text-align:center;	 	
	 }
	 
	 .noticeBtn{
	 	background:#2E2C8F;
	 	color:white;
	 	margin:auto auto;
	 	border-radius:5px;
	 }
	 
	 .btnArea{
	 
	 }
	 
	 .boardTitle{
	 	display: block;
  		width: 200px;
  		white-space: nowrap;
  		overflow: hidden;
  		text-overflow: ellipsis;
  		margin: 0;
	 }
	
	/* button{
		color:white;
		width:150px;
		height:40px;
		background-color:#2E2C8F;
		border-radius:5px;
	} */
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
	
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
				<a style=" background:#524FE3; text-decoration:none; color:white;" href="selectList.no?type=소식">전달사항</a>
				<br>
				<a style=" color: #ffffff; text-decoration:none;" href="noticeEdu.edu">교육안내</a>
			</div>
		</aside>
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="pageTitle">전달사항</span><br><br>
		<hr>
		<br><br>		
		<input type="hidden" id="auth" value="${auth}">
		<div align="center">
			<form id="noticeForm" method="post">
			<input type="hidden" name="type" value="소식">
			
			<table class="boardTable">
				<thead>
					<th><input type="checkbox" name="selectAll" class="selectAll"></th>
					<th width="80">번호</th>
					<th width="200">분류</th>
					<th width="100">제목</th>
					<th width="100">사원번호</th>
					<th width="200">작성일자</th>
				</thead>
				<tbody>
					<c:forEach var="no" items="${ requestScope.list }">
						<tr class="item">
							<input type="hidden" class="boardSeq" value="${ no.boardSeq }">
							<input type="hidden" class="boardStatus" value="${ no.status }">
							<td><input type="checkbox" name="selected" class="selected" value="${ no.boardSeq }"></td>							
							<td class="item_td">${ no.boardNo }</td>
 							<td class="item_td">${ no.boardType }</td>
							<td class="item_td"><div class="boardTitle">${ no.boardTitle }</div></td>
							<td class="item_td">${ no.writerNo }</td>
							<td class="item_td">${ no.enrollDate }</td>
						</tr>
					</c:forEach>
						<tr style="border-bottom:none;">
							<td></td>
							<td></td>
							<td></td>
							<td>
							
							</td>
							<td></td>
							<td colspan="1" rowspan="2">
								<div class="btnArea" style="margin-top: 10px;">
				<c:if test="${fn:contains(auth,'S1')}">
					<button class="noticeBtn" type="button" onclick="writeNotice();">글쓰기</button>
				</c:if>
				<c:if test="${fn:contains(auth,'S3')}">
					<button class="noticeBtn" type="button" onclick="deleteNotice();">삭제</button>
				</c:if>
			</div>
							
							</td>
						</tr>				
				</tbody>
			</table>
			<br>
			
			<br><br><br>
			<div class="pageArea" align="center">								
				<c:if test="${ requestScope.pi.currentPage < 2 }">
					<a href="#" class="pageBtn" id="prevPage" style="pointer-events:none; cursor:default;">이전</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage > 1 }">
					<c:url var="blistCheck" value="selectList.no">
						<c:param name="currentPage" value="${requestScope.pi.currentPage - 1}"/>
					</c:url>
					<a href="${ blistCheck }" class="pageBtn" id="prevPage">이전</a>
				</c:if>
				
				<c:forEach var="page" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }">					
					<c:if test="${ requestScope.pi.currentPage eq page }">
						<a href="#" class="pageBtn" style="pointer-events:none; cursor:default;">${ page }</a>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage ne page }">
						<c:url var="blistCheck" value="selectList.no">
							<c:param name="currentPage" value="${ page }"/>
						</c:url>
						<a href="${ blistCheck }" class="pageBtn">${ page }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
					<a href="#" class="pageBtn" id="nextPage" style="pointer-events:none; cursor:default;">다음</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
					<c:url var="blistCheck" value="selectList.no">
						<c:param name="currentPage" value="${ requestScope.pi.currentPage + 1 }"/>
					</c:url>
						<a href="${ blistCheck }" class="pageBtn" id="nextPage">다음</a>
				</c:if>
			</div>
			</form>
		</div>
	</div>
	<script>
		function writeNotice() {
			location.href="${pageContext.request.contextPath}/move.no?type=소식";
		}
		
		function deleteNotice() {
			$("#noticeForm").attr("action", "${pageContext.request.contextPath}/deleteList.no")
			$("#noticeForm").submit();
		}
	
		$(function() {
			$(".selectAll").click(function() {
				if($(".selectAll").prop("checked")){
					$(".selected").prop("checked", true);
				} else {
					$(".selected").prop("checked", false);
				}
			});
			
			$(".item_td").click(function(){
				
				if($(this).parent().children(".boardStatus").val() == "비공개"){
					var author = $("#auth").val();
					
					//console.log(author.indexOf('N1'));
					if(author.indexOf('S1') == -1 && author.indexOf('S2') == -1 && author.indexOf('S3') == -1 ){
						alert("접근 권한이 없습니다.");
						return;
					}
				}
				
    			var num = $(this).parent().children(".boardSeq").val();    		
    			console.log(num);
    			location.href="${pageContext.request.contextPath}/selectOne.no?num=" + num;
    		});	
		});
	</script>
</body>
</html>