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
	
	#blueRect{
		display:inline-block;
		width: 11px;
		height: 21px;
		background-color: #2E2C8F;
		vertical-align: text-bottom;
		margin-right:30px;
	}
	
	#articleWrapper{
		width:90%;
		margin-right:auto;
		margin-left:auto;
	}
	
	#overtimeTable{
		margin:auto auto;
		border-collapse:collapse;
		text-align:center;
		line-height:2;
	}
	
	#overtimeTable thead{
		background-color: #2E2C8F;
		color:white;
	}
	
	#overtimeTable tr{
		border-bottom:1px solid lightgray;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    <div id="contentWrapper">
       <aside>
			<div id="profileZone">
            <img src="<%=request.getContextPath()%>/resources/images/INSANE.png" id="companyProfile">
        	<img src="<%=request.getContextPath()%>${companyInfo.companyLogoImgPath}" id="companyProfile">
        	<br><br>
			 <p style="font-size: 17px;">회사이름</p>
            <p style="margin-top: 5px; font-size:13px; font-weight: normal;">비즈니스</p>
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
                	<div id="articleWrapper">
                		<br><br>
						<span id="blueRect">`</span><label style="font-size:20px;">연장근무 신청내역</label>	
						<hr>
						<br><br>
						<span>년월선택</span>&nbsp;&nbsp;&nbsp;<input type="date" name="overtimeDate" id="overtimeDate">
						<br><br>
						<table id="overtimeTable">
							<thead>
								<th width="80px">사번</th>
								<th width="140px">사원명</th>
								<th width="160px">부서</th>
								<th width="120px">직급</th>
								<th width="80px">구분</th>
								<th width="200px">근무일자</th>
								<th width="160px">연장근무시간</th>
								<th width="160px">야간근무시간</th>
								<th width="200px">연장근무신청일자</th>
								<th width="100px">상태</th>
							</thead>
							<tbody>
								<tr>
									<th>100020</th>
									<th>김수한무</th>
									<th>경영지원본부부서</th>
									<th>직급</th>
									<th>구분</th>
									<th>근무일자</th>
									<th>연장근무시간</th>
									<th>야간근무시간</th>
									<th>연장근무신청일자</th>
									<th>상태</th>
								</tr>
								<tr>
									<th>888888</th>
									<th>거부기와두루미</th>
									<th>부서</th>
									<th>직급</th>
									<th>구분</th>
									<th>근무일자</th>
									<th>연장근무시간</th>
									<th>야간근무시간</th>
									<th>연장근무신청일자</th>
									<th>상태</th>
								</tr>
							</tbody>
						</table>
						<br><br><br><br>
                	</div>
                </article>
            </section>
        </div>
</body>
</html>