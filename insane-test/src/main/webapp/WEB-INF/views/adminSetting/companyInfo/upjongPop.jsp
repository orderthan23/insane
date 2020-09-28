<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#titlePop{
		width: 100%;
		background: #2E2C8F;
		height: 50px;
		margin-top: 0;
	}
	#titleName{
		font-size: 20px;
		color: white;
		font-weight: bolder;
		line-height: 50px;
	}
	#upjongCodes{
		width: 80%;
		height: 40px;
		text-align: center;
		border-color: #2E2C8F;
		border-radius: 10px;
		border-collapse: collapse;
	}
	#upjongCodes:focus,
	#upjongCodes:active{
		border-color: #2E2C8F;
		border-radius: 10px;
	}
	
	#searchBar{
		background: #2E2C8F;
		border-radius: 5px;
		color: white;
		font-weight: bolder;
		border: none;
	}
	#codeList th{
		background:#2E2C8F;
		color: white;
		font-weight: bolder;
		font-size: 12px;
		
		
	}
	#codeList td{
		font-size: 12px;
		text-align: center;
		border-bottom: 1px solid lightgray;
	}
	
	#ok,#cancle{
		background: #2E2C8F;
		color : white;
		border: none;
		
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="titlePop" align="center">
		<p id="titleName">업종코드 찾기</p>
	</div>
	<br><br>
	
	
	<div style="width: 100%;" align="center">
  	<form method="post" action="searchUpjongList.cp" id="searchForm">
  	<input type="search" id="upjongCodes" name="keyword" placeholder="업종 명을 입력하세요"><br><br>
  	</form>
  	<button id="searchBar" type="button" onclick="searchUpjong();">업종코드 검색</button>
  	<br><br>
  
  	<c:if test="${empty upjongList }">
  	<p>${ status }</p>
  	</c:if>
  	
  	<c:if test="${ not empty upjongList }">
  		<button id="ok" type="button" onclick="transParent();">확인</button>
  		<button id="cancle" type="button" onclick="cancled();">취소</button>
  		<p><label style="font-weight: bolder;">${ keyword}</label> (으)로 검색하신 결과입니다. <label style="font-weight: bolder;">${fn:length(upjongList)}건</label>
  	<table id="codeList"></p>
  		<tr>
  			<th>코드</th>
  			<th>대분류</th>
  			<th>중분류</th>
  			<th>세분류</th>
  			<th>세세분류</th>
  			<th>연도</th>
  		</tr>
  		<c:forEach var="i" begin="0"  end="${fn:length(upjongList)-1}">
  		<tr>
  			<td><input type="radio" name="choice" class="choice"><p>${ upjongList[i].upjongCode}</p></td>
  			<td>${ upjongList[i].bigSep }</td>
  			<td>${ upjongList[i].mediumSep }</td>
  			<td>${ upjongList[i].smallSep }</td>
  			<td>${ upjongList[i].microSep }</td>
  			<td>${ upjongList[i].years }</td>
  		</tr>
  		</c:forEach>
  	</table>
  	</c:if>
	
	</div>
  	
  	
  	<script>
  	 	function transParent(){
  	 		var values = $("input[name='choice']:checked").siblings('p').text(); 
  	 		$(opener.document).find("#businessTypeCode").val(values); //find를 이용한 jquery
  	 		self.close();

  	 		
  	 	}
  	 	function cancled(){
  	 		self.close();
  	 	}
  	 	
  	 	function searchUpjong(){
  	 		$('#searchForm').submit();
  	 		
  	 	}
  	 	
  		
	 		
  	</script>
</body>
</html>