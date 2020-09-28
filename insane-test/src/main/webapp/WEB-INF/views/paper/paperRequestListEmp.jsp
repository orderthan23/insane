<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		overflow:auto;
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
	#paperTitle{
		font-size:x-large;
		position:relative;
		top:-5px;
		left:30px;
	}
	
	#paperKind{
		float:right;
		margin-right: 100px;	
		margin-top: 10px;
	}
	
	#searchKind{
		position:absolute;
		left:30%;
	}
	
	#searchingBox {
		position:absolute;
		left:40%;
		bottom:	35px;
	}
	
	.boardTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}	
	
	.pageArea{
		position:absolute;
		/* left:25%; */
		/*  top:95%; */
		bottom:20px;
		width:100%;
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
	<jsp:include page="/WEB-INF/views/common/hrPage/hrHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/hrPage/hrNav.jsp"/>
	
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
				<p style="font-size:20px;">서류 발급</p>
				<br><br>
				
				<a style=" background:#524FE3; text-decoration:none; color:white;" href="selectListEmp.cr">나의 요청</a>
				<br>
				<a style=" text-decoration:none; color:white;" href="requestPage.cr?type=경력">경력 증명서</a>
				<br>
				<a style=" text-decoration:none; color:white;" href="requestPage.cr?type=재직">재직 증명서</a>
				<br>
			
			
			</div>
		</aside>
		
	<div id="section">
		<br>
		<div class="bluerect"></div><span id="paperTitle">서류발급</span><br><br>
		<hr>
		
		<%-- ${ requestScope.crtfcKind != null } --%>
		<select id="paperKind" name="kind" onchange="changePaperKind(this.value);">
			<option value="all">전체보기</option>
			<option value="career" ${ requestScope.crtfcKind != null && requestScope.crtfcKind eq "career" ? "selected" : ""}>경력증명서</option>
			<option value="employment" ${ requestScope.crtfcKind != null && requestScope.crtfcKind eq "employment" ? "selected" : ""}>재직증명서</option>
			<option value="leaving" ${ requestScope.crtfcKind != null && requestScope.crtfcKind eq "leaving" ? "selected" : ""}>퇴직증명서</option>
		</select>
		<br><br>		
		<div align="cetner">
			<table class="boardTable">
				<thead>
					<th width="80">번호</th>
					<th width="200">요청분류</th>
					<th width="100">상태</th>
					<th width="100">요청자</th>
					<th width="200">요청일자</th>
					<th width="200">처리일자</th>
				</thead>
				<tbody>
					<c:forEach var="paper" items="${requestScope.list}" varStatus="status">
						<tr class="item">
							<%-- <td class="testNum">${ status.index }</td> --%>
							<input type="hidden" name="crtfcSeq" value="${paper.crtfcSeq}">
							<td class="seqNum">${paper.crtfcSeq}</td>
							<td>${paper.crtfcType}</td>
							<!-- <td>경력증명서발급</td> -->
							<%-- <td name="crtfcStatus">${paper.processStatus}</td> --%>
							<input type="hidden" name="crtfcStatus" value="${paper.processStatus}">
							<c:if test="${paper.processStatus eq 'Y'}"> 
								<td>발급 승인</td>
							</c:if>
							<c:if test="${paper.processStatus eq 'D'}"> 
								<td>발급 거부</td>
							</c:if>							
							<c:if test="${paper.processStatus eq 'N'}"> 
								<td>발급 대기</td>
							</c:if>
							<input type="hidden" name="requestEmp" value="${paper.empNoSeq}">
							<%-- <td name="requestEmp">${paper.empNoSeq}</td> empNo --%>
							<td>${paper.empName}</td>
							<td name="requestEnrollDate">${paper.applyDate}</td>
							<input type="hidden"  name="issueEmp" value="${ paper.issueEmpSeq}">
							<c:if test="${ paper.issueEmpSeq > 0 }"> 
								<td>${ paper.issueEmpSeq }</td>
							</c:if>							
							<c:if test="${ paper.issueEmpSeq <= 0 }"> 
								<td>-</td>
							</c:if>
						</tr>
					</c:forEach>					
				</tbody>
			</table>
			<br>			
			<br><br>
			<div class="pageArea" align="center">								
				<c:if test="${ requestScope.pi.currentPage < 2 }">
					<a href="#" class="pageBtn" id="prevPage" style="pointer-events:none; cursor:default;">이전</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage > 1 }">
					<c:url var="blistCheck" value="selectListEmp.cr">
						<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'career'}">
							<!-- ?kind=" + object; -->
								<c:param name="kind" value='career'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'employment'}">
								<c:param name="kind" value='employment'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'leaving'}">
								<c:param name="kind" value='leaving'/>
							</c:if>
						<c:param name="currentPage" value="${requestScope.pi.currentPage - 1}"/>
					</c:url>
					<a href="${ blistCheck }" class="pageBtn" id="prevPage">이전</a>
				</c:if>
				
				<c:forEach var="page" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }">					
					<c:if test="${ requestScope.pi.currentPage eq page }">
						<a href="#" class="pageBtn" style="pointer-events:none; cursor:default;">${ page }</a>
					</c:if>
					<c:if test="${ requestScope.pi.currentPage ne page }">
						<c:url var="blistCheck" value="selectListEmp.cr">
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'career'}">
							<!-- ?kind=" + object; -->
								<c:param name="kind" value='career'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'employment'}">
								<c:param name="kind" value='employment'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'leaving'}">
								<c:param name="kind" value='leaving'/>
							</c:if>
							<c:param name="currentPage" value="${ page }"/>
						</c:url>
						<a href="${ blistCheck }" class="pageBtn">${ page }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${ requestScope.pi.currentPage >= requestScope.pi.maxPage }">
					<a href="#" class="pageBtn" id="nextPage" style="pointer-events:none; cursor:default;">다음</a>
				</c:if>
				<c:if test="${ requestScope.pi.currentPage < requestScope.pi.maxPage }">
					<c:url var="blistCheck" value="selectListEmp.cr">
						<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'career'}">
							<!-- ?kind=" + object; -->
								<c:param name="kind" value='career'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'employment'}">
								<c:param name="kind" value='employment'/>
							</c:if>
							<c:if test="${ requestScope.crtfcKind != null && requestScope.crtfcKind eq 'leaving'}">
								<c:param name="kind" value='leaving'/>
							</c:if>
						<c:param name="currentPage" value="${ requestScope.pi.currentPage + 1 }"/>
					</c:url>
						<a href="${ blistCheck }" class="pageBtn" id="nextPage">다음</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<script>
		/* $(function(){
			$(".item").click(function(){
				var seqNum = $(this).children(".seqNum").text();
				// var testNum = $(this).children(".testNum").text(); 
				
				//console.log(testNum); 
				
				location.href="selectOne.cr?num=" + seqNum;				
			})
		}) */
	
		function changePaperKind(object){
			//location.href="${pageContext.request.contextPath}/selectList.cr";
			//var kind = $("paperKind").val();
			//var kind = object.val();
			
			console.log(object);
			
			location.href="${pageContext.request.contextPath}/selectListEmp.cr?kind=" + object;
		}
	</script>
</body>
</html>