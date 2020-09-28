<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/layout.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#popTitle{
		
		color: white;
		width: 100%;
		text-align: center;
		background:#2E2C8F;
		margin : 0;
		padding : 0;
		height: 40px;
		border: none;
	}
	#popTitle p{
		margin: 0;
		padding: 0;
		line-height: 40px;
		font-size: 23px;
		font-weight: normal;
	}
	aside{
		background : white;
		width: 400px;
	}
	#organizationChartArea{
		display: inline-block;
		
		margin-right: 27px;
		padding: 40px;
		overflow: auto;
	}
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
		color : black;
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
</style>
<title>INSANE :: 결재선 선택</title>
</head>
<body>
	<div id="popTitle">
		<p>결재선 추가</p>
	</div>
	<div id="contentWrapper">
		<aside  id="organizationChartArea">
		
					<c:forEach var="org" items="${ organiZationList }">
						<div class="chartList">
							<input type="hidden" id="deptCodeSeq" name="deptCodeSeq" value="${ org.deptCodeSeq }">
							<pre class="chart">${ org.levelSpace }${ org.levelSpace }<img class="fc" src="<%=request.getContextPath()%>/resources/images/folder_closed.png" height="20px"><img class="fo" src="<%=request.getContextPath()%>/resources/images/folder_opened.png" height="20px">${ org.deptName }</pre>
						</div>
					</c:forEach>
			
		</aside>

		<section>
		<article>
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
						</div>
		
		</article>
		</section>
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
				
				$("#deptName").html(data.hmap.orChart[0].deptName);
				$("#upperDeptName").html(data.hmap.orChart[0].upperDeptName);
				$("#director").html(data.hmap.director.empNameKor);
				$("#deptPhone").html(data.hmap.dept.deptTel);
				$("#deptNumber").html(data.hmap.orChart[0].deptPresent);
				$("#allDeptNumber").html(data.hmap.orChart[0].sumPresent);
				
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