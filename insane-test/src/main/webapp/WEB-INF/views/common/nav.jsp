<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#navtable tr td a{
		text-decoration: none;
		
	}
</style>
<title>Insert title here</title>

</head>
<body>
 <nav>
									
            <table id="navTable">
                <tr>
                    <td id="imageCol" colspan="2" >
                        <img src="<%=request.getContextPath()%>/resources/images/logoinsane.png" width=" 229px" height="60px" id="insaneLogo" onclick="location.href='groupwareMain.mp'" >
                    </td>
                    <td></td>
                   	<c:if test="${fn:contains(auth,'MP1')}">
                    <td>
                        <a onclick="openHrmPage();">Smart HRM</a>
                    </td>
					</c:if>
                    <td>
                        <a href="selectList.no?type=공지">사내소식</a>
                    </td>

                    <td>
                        <a href="waitAppro.app">전자결재</a>
                    </td>

                    <td>
                        <a href="requestPage.cr?type=경력">서류발급</a>
                    </td>

                    <td>
                        <a href="selectMyAttReport.att">근태기록</a>
                    </td>
                    <td>
                        <a href="mySalReport.sal">급여 조회</a>
                    </td>
                    
                    
             
                </tr>
            </table>
            <form name="openHrm">
					<input type="hidden"  name="keyword" value="openHrm">
				</form>
       </nav>
       <script>
       function openHrmPage(){
    		var openHrm = document.openHrm;
    		// window.open('','SmartHRM','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes','_blank','menubar=yes','scrollbars=yes','titlebar=yes','resizable=yes','directories=yes','toolbar=yes','location=yes');
			window.open('','SmartHRM'); 
    		openHrm.action = 'popupZone.jsp';
			 openHrm.target= 'SmartHRM';
			 openHrm.submit();
       }

       </script>
</body>
</html>