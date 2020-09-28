<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 150px;
        background : #c4c4c4;           
    }
    section{
       width: 100%;
       height: auto;
       overflow-y: auto;
       background : white;
    }
    #chatTable{
        width: 95%;
        height: 300px;
        margin-right: auto;
        margin-left: auto;
        border-collapse: collapse;
        overflow-y:scroll;
       
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
  
    #makeRoom,
    #backBtn
    {
       display: table-cell;
       height: 30px;
       margin-left: 20px;
       color: white;
       background: #2E2C8F;
       border: none;
       border-radius: 10px;
       width: 100px;
    }
    #chatZone{
       width: 80%;
      
       background : #c4c4c4;
       height:70%;
       font-size:18px;
       line-height: normal;
        
    }
    #chatZone:focus{
       border: none;
       outline: none;
    }
    #submitChat{
       color: white;
       background: #2E2C8F;
       border: none;
       width: 60px;
       height: auto;
       font-size: 15px;
       border-radius: 5px;
    }
	#txtWindow {
        width: 90%;
        margin-left: auto;
        margin-right: auto;
         height:500px;
        overflow-y:scroll;
    }
    #txtWindow p {
        margin-bottom: 20px;
    }
	#chatZone:hover,
	#chatZone:focus,
	#chatZone:active{
		border:none;
		outline:none;
	}
	
</style>

</head>
<body>
    <div id="wrap">
        
    
    <header align="center">
        <div id="headerTitle">
            <label>SANE CHAT </label>     
            
        </div>
        <br>
        <div id="title">
            <label style="text-align: left;">${ requestScope.room.chatRoomName }</label>
             <button type="button" id="backBtn" onclick="history.go(-2);">뒤로가기</button> 
            <button type="button" id="makeRoom" onclick="outRoom()">나가기</button>
           
          
        </div>
        <br>
        <hr>
        <br>
    </header>
    <section>
    <input type="hidden" id="userId" value="${ requestScope.user.userSeq }">
	<input type="hidden" id="roomNum" value="${ requestScope.room.chatSeq }">
	<input type="hidden" id="userNo" value="${ requestScope.user.userNo }">
	<input type="hidden" id="userName" value="${ requestScope.user.userName }">
	<div id="txtWindow">
	</div>
    </section>
  
    <footer>
        <button style="float: right; margin-top:10px; margin-right:10px;" id="submitChat" type="button" onclick="sendMessage()">전송</button>
        <textarea id="chatZone" onkeydown="enter();"></textarea>
    </footer>

	</div>

	<script>
		$(function(){
			var userId = $("#userId").val();
			var roomNum = $("#roomNum").val();
			
			console.log(userId);
			console.log(roomNum);
			
            webSocket = new WebSocket("ws://3.34.245.66:8080" + "${pageContext.request.contextPath}/room/" + roomNum + "/" + userId);
			//webSocket = new WebSocket("ws://192.168.30.107:8001" + "${pageContext.request.contextPath}/room/" + roomNum + "/" + userId);
			
			webSocket.onopen = function(event){
				
			}
			
			webSocket.onmessage = function(message){
				$("#txtWindow").append(message.data);
				
				$("#txtWindow").scrollTop($("#txtWindow")[0].scrollHeight);
			}
			
			webSocket.onerror = function(event){
				$("#txtWindow").val("에러 발생!");
			}
			
			webSocket.onclose = function(event){
				$("#txtWindow").val("누군가가 퇴장했습니다.");
			}			
		});
		
		function sendMessage(){
			/* var message = $("#userNo").val() + ": " + $("#chatZone").val() + "<br>"; */
			if( $("#chatZone").val() == null ||  $("#chatZone").val().length <= 0) {
				return;
			}
			
			var message = "<p>" + $("#userName").val() + ": " + $("#chatZone").val() + "</p>";
			//webSocket.send(message);
			sendingMessage(message);
			
			$("#chatZone").val("");
		}
		
		function sendingMessage(message){
			//var message = $("#tempTest").val() + "<br>";
			//console.log(message);
			webSocket.send(message);
		}
		
		function outRoom(){
			var message = $("#userName").val() + "님이 나가셨습니다.<br>";
			var num = $("#roomNum").val();
			var num2 = $("#userId").val();
			
			console.log(message);
			sendingMessage(message);
			
			webSocket.close();
			
			location.href="${pageContext.request.contextPath}/updateChatUserOut.ch?num=" + num + "&num2=" + num2;			
		}
		
		function enter(){
			var key = window.event.keyCode;
			
			if(key === 13){
				sendMessage();

				return false;
			}
			
			return true;
		}
		
	</script>
</body>
</html>