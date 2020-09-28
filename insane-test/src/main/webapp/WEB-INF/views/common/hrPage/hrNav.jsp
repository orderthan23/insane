<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav>
 		
            <table>
                <tr>
                    <td id="imageCol" colspan="2" >
                        <img src="<%=request.getContextPath()%>/resources/images/hrLogo.png" width=" 332px" height="60px" id="insaneLogo" onclick="location.href='openHrm.mp';" >
                    </td>
                    <td></td>
                    <td>
                        <a href="hrInfoManagementList.em">인사정보 관리</a>
                    </td>
                    
                    <td>
                        <a href="selectAttendanceHistoryManage.att">근태 관리</a>
                    </td>

                    <td>
                        <a href="Edulist.edu">교육 관리</a>
                    </td>

                    <td>
                        <a href="selectEmpListForSalary.sal">보상 관리</a>
                    </td>
                </tr>
            </table>
       </nav>
</body>
</html>
