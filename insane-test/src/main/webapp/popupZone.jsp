<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String keyword = (String)request.getParameter("keyword");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<script>
	
		var keyword = "<%=keyword%>";
		console.log(keyword);
	
		 window.onload= function(){
			
			
				
				console.log(keyword);
				switch(keyword){
				case 'upjongPop': location.href = "showUpjongPop.cp"; break;
				case 'dept' : location.href = "showDeptPop.cp"; break;
				case 'changeSystemPwd' : location.href = "changeSystemPwdPop.cp"; break;
				case 'openHrm' : location.href = "openHrm.mp"; break;
				case 'addComplete': location.href = "addCompletePop.edu"; break;
				case 'sanction' : location.href = "popSanctionLine.app"; break;
				case 'eduCodePop' : location.href = "searchEduCode.edu"; break;
				case 'addEmp' : location.href="popSearchEmployee.app"; break;
				case 'chat' : location.href = "selectList.ch"; break;
				case 'yageun' : location.href = "letsYageun.mp"; break;
				}
				
				
				
			} 
			
		</script>			
		
	</body>
	</html>

