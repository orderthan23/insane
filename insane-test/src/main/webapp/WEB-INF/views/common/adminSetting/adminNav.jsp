<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p {
	    margin-left: 20px;
	    color : black;
	    font-size: 20px;
	    font-family: 'NanumSquare';
	    font-weight: bolder;
	}
	.td-name {
	    color : black;
	    font-size: 15px;
	    font-family: 'NanumSquare';
	    font-weight: bolder;
	}
	.td-name:hover {
		font-size: 18px;
		color: #2E2C8F;
	}
	nav a{
		text-decoration: none;
	}
</style>

</head>
<body>
 <nav>
 		
            <table>
                <tr>
                    <td id="imageCol" colspan="2" >
                        <img src="<%=request.getContextPath()%>/resources/images/logoinsane.png" width=" 229px" height="60px" id="insaneLogo" >
                    </td>
                    <td><p>기초 정보 설정</p></td>
                    <td>
                        <a></a>
                        
                    </td>
                    
                    <td>
                        <a></a>
                    </td>

                    <td>
                        <a></a>
                    </td>

                    <td>
                        <a></a>
                    </td>

                    <td>
                        <p> </p>
                    </td>
                    <td>
                        <a class="td-name" onclick= "openChangeSystemPwd();">시스템 비밀번호 수정</a>
                        <form name="changeSystemPwd">
                        	<input type="hidden" value="changeSystemPwd" name="keyword">
                        </form>
                    </td>
                    
                </tr>
            </table>
       </nav>
       <script>
       		function openChangeSystemPwd(){
       			var popup = document.changeSystemPwd;
   			 window.open('','changeSystemPwd','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
   			 popup.action = 'popupZone.jsp';
   			 changeSystemPwd.target= 'changeSystemPwd';
   			 changeSystemPwd.submit();
       		}
       </script>
       
       <!-- <form name="pop">
					<input type="hidden"  name="keyword" value="upjongPop">
				</form>
				
			function openUpjongPop(){
			var popup = document.pop;
			 window.open('','upjong','top=100px, left=100px, height=600px, width=400px, menubar=no, toolbar=no' );
			 popup.action = 'popupZone.jsp';
			 pop.target= 'upjong';
			 pop.submit();
		} -->
</body>
</html>