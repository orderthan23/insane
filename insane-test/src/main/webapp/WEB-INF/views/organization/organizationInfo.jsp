<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hrInfoLayout.css">
<meta charset="UTF-8">
<title>개인 인사정보 관리</title>
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
	#contentOrganization{
/* 		background: #C4C4C4; */
		display: flex;
		margin: 30px;
		width: 1015px;
		height: 690px;
	}
	#organizationChartArea{
		background: #F4F4F4;
		display: inline-block;
		width: 320px;
		height: 610px;
		border: 1px solid black;
		margin-right: 27px;
		padding: 40px;
		overflow: auto;
	}
	#departmentInfoArea{
		background: #F4F4F4;
		display: inline-block;
		width: 580px;
		height: 670px;
		border: 1px solid black;
		padding: 10px;
	}
	/* 조직도 영역 */
	#organizationChartArea::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#organizationChartArea::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	.chart {
		margin: 8px 0px;
		font-family: 'NanumSquare';
		font-size: 18px;
		font-weight: 400;
	}
	.chartList img {
		margin-right: 10px;
	}
	.chartList:hover{
		cursor: pointer;
	}
	.fo {
		display: none;
	}
	/* 조직도 영역 끝 */
	.orBtn{
/* 		display: inline-block; */
		background: #2E2C8F;
		color: white;
/* 		width: 100px; */
		height: 30px;
		padding: 5px 10px;
		font-size: 18px;
		line-height: 30px;
		text-align: center;
	}
	#deptInfoLine{
		display: inline-block;
		width: 100%;
		height: 1px;
		background-color: black;
	}
	#deptInfoTable{
		width: 100%;
	}
	.deptTitle{
		background: #2E2C8F;
		color: white;
		padding: 8px;
		text-align: center;
	}
	.deptContent{
		background: white;
		padding-left: 10px;
	}
	#profileImgArea{
		background-color: rgba(0, 0, 0, 0);
		padding: 0;
		width: 144px;
		height: 210px;
	}
	#directorProfile{
		width: 100%;
		height: 100%;
	}
	#empListHeaderTable{
		width: 100%;
		text-align: center;
		margin-top: 20px;
		border-collapse: collapse;
	}
	#empListHeaderTable th{
		background: #2E2C8F;
		color: white;
		font-size: 16px;
		padding: 8px;
		font-weight: bolder;
	}
	#empListHeaderTable td{
		font-size: 15px;
		padding: 5px;
		font-weight: bolder;
		border-bottom: 2px solid #2E2C8F;
	}
	#empListContentArea{
		height: 311px;
		overflow: overlay;
	}
	#empListContentArea::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#empListContentArea::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
	#empListContentTable{
		width: 100%;
		text-align: center;
		border-collapse: collapse;
	}
	#empListContentTable td{
		border-bottom: 1px solid #2E2C8F;
		font-size: 15px;
		font-weight: 400;
		padding: 3px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/hrPage/hrHeader.jsp" />
	<jsp:include page="../common/hrPage/hrNav.jsp" />
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
                <p style="font-size:20px;">인사정보 관리</p>
                <br><br>
                <a style=" background:#524FE3; text-decoration:none; color:white;" href="organizationChart.or">조직도 관리</a>
                <br>
                <a style="  text-decoration:none; color:white;" href="hrInfoManagementList.em">사원 목록 조회</a>
                <br>
                <a style=" text-decoration:none; color:white;" href="selectList.cr">증명서 발급 내역</a>
                <br>
            </div>
        </aside>
   		<div id="mainContent">
			<div id="contentArea">
			
			<div id="contentHeader">
				<div id="bluebox"></div>
				<label>조직도</label>
			</div>	<!-- contentHeader End -->
			<div id="headerLine"></div>
			
			<div id="contentOrganization">			
				<div id="organizationChartArea">
					<div class="chartList">
						<input type="hidden" id="deptCodeSeq" name="deptCodeSeq" value="999999">
						<pre class="chart"><img class="fc" src="<%=request.getContextPath()%>/resources/images/folder_closed.png" height="20px"><img class="fo" src="<%=request.getContextPath()%>/resources/images/folder_opened.png" height="20px">전사</pre>
					</div>
					<c:forEach var="org" items="${ list }">
						<div class="chartList">
							<input type="hidden" id="deptCodeSeq" name="deptCodeSeq" value="${ org.deptCodeSeq }">
							<pre class="chart">${ org.levelSpace }${ org.levelSpace }<img class="fc" src="<%=request.getContextPath()%>/resources/images/folder_closed.png" height="20px"><img class="fo" src="<%=request.getContextPath()%>/resources/images/folder_opened.png" height="20px">${ org.deptName }</pre>
						</div>
					</c:forEach>
				</div>
				
				<div id="departmentInfoArea">
					<div class="orBtn">조직정보</div>
					<div id="deptInfoLine"></div>
					
					<table id="deptInfoTable">
						<tr>
							<td class="deptTitle" width="120px">부서명</td>
							<td id="deptName" class="deptContent" width="270px">-</td>
							<td rowspan="6" id="profileImgArea" class="deptContent"></td>
						</tr>
						<tr>
							<td class="deptTitle">상위 부서</td>
							<td id="upperDeptName" class="deptContent">-</td>
						</tr>
						<tr>
							<td class="deptTitle">부서장</td>
							<td id="director" class="deptContent">-</td>
						</tr>
						<tr>
							<td class="deptTitle">부서 전화번호</td>
							<td id="deptPhone" class="deptContent">-</td>
						</tr>
						<tr>
							<td class="deptTitle">부서원</td>
							<td id="deptNumber" class="deptContent">-</td>
						</tr>
						<tr>
							<td class="deptTitle">전체 부서원</td>
							<td id="allDeptNumber" class="deptContent">-</td>
						</tr>
					</table>
					
					<table id="empListHeaderTable">
						<tr>
							<th colspan="5">직원리스트</th>
						</tr>
						<tr>
							<td width="20%">이름</td>
							<td width="15%">직급</td>
							<td width="20%">부서</td>
							<td width="15%">직책</td>
							<td width="30%">휴대전화번호</td>
						</tr>
					</table>
					
					<div id="empListContentArea">
						<table id="empListContentTable">
							<tbody>
								<tr>
									<td width="20%">-</td>
									<td width="15%">-</td>
									<td width="20%">-</td>
									<td width="15%">-</td>
									<td width="30%">-</td>
								</tr>
							</tbody>
						</table>
					</div>	<!-- empListContentArea -->
					
				</div>	<!-- departmentInfoArea -->
			</div>	<!-- contentOrganization -->
			
			</div>  <!--   contentArea End -->
		</div>  <!--   mainContent End -->
	</div>

<script>
	
	$(document).on("click", ".chartList", function() {
		var num = $(this).children("input").val();
		console.log(num);
		$(".fo").not($(this).children("pre").children(".fo")).hide();
		$(this).children("pre").children(".fo").show()
		$(".fc").not($(this).children("pre").children(".fc")).show();
		$(this).children("pre").children(".fc").hide()
		$(".chart").not($(this).children("pre")).css({"font-weight":"400", "color":"black"});
		$(this).children("pre").css({"font-weight":"bolder", "color":"#2E2C8F"});
		
		$.ajax({
			url: "selectOrChartInfo.or",
			type: "post",
			data: {
				deptCodeSeqNum: num
			},
			success: function(data) {
				console.log(data);
				
				$("#deptInfoTable .deptContent").html("");
				
				if(data.hmap.dept == null && data.hmap.director == null && data.hmap.orChart == null && data.hmap.profile == null){
					
				} else {
					if(data.hmap.director != null && data.hmap.profile != null){
						$("#deptName").html(data.hmap.orChart[0].deptName);
						$("#upperDeptName").html(data.hmap.orChart[0].upperDeptName);
						$("#director").html(data.hmap.director.empNameKor);
						$("#profileImgArea").html("<img id='directorProfile' src='/insane" + data.hmap.profile.filePath + data.hmap.profile.changeName + "'>");
						$("#deptPhone").html(data.hmap.dept.deptTel);
						$("#deptNumber").html(data.hmap.orChart[0].deptPresent);
						$("#allDeptNumber").html(data.hmap.orChart[0].sumPresent);	
					} else if(data.hmap.director != null) {
						$("#deptName").html(data.hmap.orChart[0].deptName);
						$("#upperDeptName").html(data.hmap.orChart[0].upperDeptName);
						$("#director").html(data.hmap.director.empNameKor);
						$("#deptPhone").html(data.hmap.dept.deptTel);
						$("#deptNumber").html(data.hmap.orChart[0].deptPresent);
						$("#allDeptNumber").html(data.hmap.orChart[0].sumPresent);			
					} else {
						$("#deptName").html(data.hmap.orChart[0].deptName);
						$("#upperDeptName").html(data.hmap.orChart[0].upperDeptName);
						$("#deptPhone").html(data.hmap.dept.deptTel);
						$("#deptNumber").html(data.hmap.orChart[0].deptPresent);
						$("#allDeptNumber").html(data.hmap.orChart[0].sumPresent);			
					}
				}
				
				$tableBody = $("#empListContentTable tbody");
				$tableBody.html("");
				
				for(var key in data.hmap.list) {
					var $tr = $("<tr>");
					var $nameTd = $("<td>").attr("width", "20%").text(data.hmap.list[key].empNameKor);
					var $poTd = $("<td>").attr("width", "15%").text(data.hmap.list[key].positionName);
					var $deptTd = $("<td>").attr("width", "20%").text(data.hmap.list[key].deptName);
					var $rsTd = $("<td>").attr("width", "15%").text(data.hmap.list[key].rspofcName);
					var $phoneTd = $("<td>").attr("width", "30%").text(data.hmap.list[key].empPhone);
					
					$tr.append($nameTd);
					$tr.append($poTd);
					$tr.append($deptTd);
					$tr.append($rsTd);
					$tr.append($phoneTd);
					
					$tableBody.append($tr);
				}
				
			},
			error: function() {
				console.log("error!");
			}
		});
	});
	
</script>
</body>
</html>