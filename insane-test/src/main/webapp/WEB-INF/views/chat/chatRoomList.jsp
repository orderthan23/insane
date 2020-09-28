<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        *{margin : 0;
          font-family: 'nanumSquare';
        }
        html,body{
            height: 100%;
            overflow-y:hidden;
        }
        #wrap{
            min-height: 100%;
            padding-bottom: 100px;
            width: 100%;
            margin-right: auto;
            margin-left: auto;
            box-sizing: border-box;
        }
        header{
            
            width: 100%;
            font-size: 20px;
            font-weight: bolder;
           
            height: 140px;
        }
        #headerTitle{
            width: 100%;
            background: #2E2C8F;
            height: 50px;
        }
        #headerTitle label{

            line-height: 50px;
            color: white;
        }
        footer{
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 50px;
            background: #2E2C8F;
        }
        section{
            width: 100%;
            height: 600px;
            overflow-y: auto;
            background : white;
            
        }
        #chatTable{
            width: 95%;
            
            margin-right: auto;
            margin-left: auto;
            border-collapse: collapse;
           
        }
        #title{
            display: table;
            width: 95%;
            margin-right: auto;
            margin-left: auto;
        }
        #title label{
            font-size: 22px;
            font-weight: bold;
            display: table-cell;
        }
        #chatTable th{
            background: darkgray;
            color: black;
            height: 30px;
            vertical-align: middle;
            text-align: center;
        }
        #chatTable td{
            text-align: center;
            overflow: hidden;
            height: 60px;
        
        }
        #chatTable tr:hover{
            background: #f1f1f1;
        }
      
        #makeRoom{
            display: table-cell;
            height: 30px;
            margin-left: 100px;
            color: white;
            background: #2E2C8F;
            border: none;
            border-radius: 10px;
            width: 100px;

        }
    </style>
</head>
<body>
    <div id="wrap">
        
    
    <header align="center">
        <div id="headerTitle">
            <label>SANE CHAT</label>
        </div>
        <br>
        <div id="title">
        <label style="text-align: left;">개설된 채팅방 (${fn:length(requestScope.list)})</label>
        	<form method="post" action="createRoom.ch">
				<button id="makeRoom">방 개설하기</button>
			</form>
            <%-- <label style="text-align: left;">개설된 채팅방 (${fn:length(requestScope.list)})</label><button type="button" id="makeRoom">방 개설하기</button> --%>
            
        </div>
        <br>
        <hr>
        <br>
    </header>
    
    <section>
   		<input type="hidden" id="userSeq" value="${ sessionScope.loginUser.empNoSeq }">
        <table id="chatTable">
       
        
            <tr>
                <th width="60%;">방제</th> 
                <th width="20%;">만든 이</th> 
                <th width="20%;">인원 수</th> 
            </tr>
            
            <c:forEach var="room" items="${requestScope.list}">
					<tr class="roomTr">
						<input class="chatSeq" type="hidden" value="${ room.chatSeq }">
						<td>${ room.chatRoomName }</td>
						<td>${ room.makerName }</td>
						<td>${ room.userNum }</td>
						<td><input type="hidden" class="roomPwdLength" value="${ !empty room.password? room.password.length() : 0 }"></td>
					</tr>
				</c:forEach>
        </table>
    </section>
    
    <footer></footer>
<script>
	$(function() {
		/* $(".roomTr").click(function(){
			
			//var roomSeq = $("#chatSeq").val();
			var userSeq = $("#userSeq").val();
			
			var num = $(this).children(".chatSeq").val();
		
			console.log(num);
			location.href="${pageContext.request.contextPath}/selectOne.ch?num=" + num + "&userNum=" + userSeq;
		}); */
		$(".roomTr").click(function(){
			
			//var roomSeq = $("#chatSeq").val();
			var userSeq = $("#userSeq").val();
			
			var num = $(this).children(".chatSeq").val();
			var length = $(this).children("td").children(".roomPwdLength").val();
		
			console.log(num);
			console.log(length);
			
			if(length > 0){
				location.href="${pageContext.request.contextPath}/inputPwd.ch?num=" + num;
			} else{
				location.href="${pageContext.request.contextPath}/selectOne.ch?num=" + num + "&userNum=" + userSeq;
			}
			//location.href="${pageContext.request.contextPath}/selectOne.ch?num=" + num + "&userNum=" + userSeq;
		});
	});
	
	
	/* $(function() {
    	$(".writeArea").removeAttr("style");
        $(".answerContent").hide();
        var tr = $(".answerContent");
        console.log(tr);            
        $(".answerTitle").each(function(i, e){                
        	$(this).click(function(){            		
       		//$(this).parent().click(function(){
        		console.log(i);
                var idx = i;   
                for(var j = 0; j < tr.length; j++){
                    if(j == i){
                        continue;
                    }
                    $(tr[j]).hide();
                }
                if($(tr[idx]).is(":visible")){
                    $(tr[idx]).hide();
                } else{
                    $(tr[idx]).show();
                }                                        
            })
        })

    }); */
	
	</script>
</body>
</html>

