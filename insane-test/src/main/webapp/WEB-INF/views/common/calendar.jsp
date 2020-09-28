<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table thead td{
	  font-size: 20px;
	  background: white;
	  padding: 10px;
	  height: 30px;
	}
	#calendar td {
	  padding: 10px;
	  vertical-align: top;
	  height: 30px;
	}
	.btn-wrap .day{
	
	}
	
	#sun{
	  color:#ef3333;
	}
	#sat{
	  color:#2107e0;
	}
	.active{
	  border-radius: 50%;
	  background: #c4c4c4;
	  color: #ffffff;
	}
	.content-wrap{
	  width: 100%;
	  margin:0 auto;
	  border: 1px solid rgba(161, 161, 161, 0.5); 
	  border-radius: 20px;
	  overflow: hidden;
	  text-align: center;
	}
</style>
</head>
<body>
  <div class="main">
    <div class="content-wrap">
        <table id="calendar" style="width: 100%;" align="center">
          <thead>
            <tr class="btn-wrap clearfix">
              <td>
                <label id="prev">
                    &#60;
                </label>
              </td>
              <td align="center" id="current-year-month" colspan="5"></td>
              <td>
                <label id="next">
                    &#62;
                </label>
              </td>
            </tr>
            <tr>
                <td class="day" id="sun" align="center" width="10%">일</td>
                <td class="day" align="center" width="10%">월</td>
                <td class="day" align="center" width="10%">화</td>
                <td class="day" align="center" width="10%">수</td>
                <td class="day" align="center" width="10%">목</td>
                <td class="day" align="center" width="10%">금</td>
                <td class="day" id="sat" align="center" width="10%">토</td>
             </tr>
          </thead>
          <tbody id="calendar-body" class="calendar-body"></tbody>
        </table>
    </div>
  </div>
</body>
<script type="text/javascript">
	var currentTitle = document.getElementById('current-year-month');
	var calendarBody = document.getElementById('calendar-body');
	var today = new Date();
	var first = new Date(today.getFullYear(), today.getMonth(),1);
	var dayList = ['일','월','화','수','목','금','토'];
	var monthList = [1,2,3,4,5,6,7,8,9,10,11,12];
	var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
	var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
	var pageFirst = first;
	var pageYear;
	if(first.getFullYear() % 4 === 0){
	    pageYear = leapYear;
	}else{
	    pageYear = notLeapYear;
	}
	
	var holidayList = [];
	
	<c:forEach items="${holidayList}" var="h">
		holidayList.push({holidayDate:"${h.holidayDate}", name:"${h.holidayName}"})
	</c:forEach>
	
	function getKeyValue(today){
		var month = monthList[today.getMonth()];
		var date = today.getDate();
		if(month < 10){
			month = "0" + month;
		}
		if(date < 10){
			date = "0" + date;
		}
		return today.getFullYear() + "-" + month + "-" + date;
	}
	var keyValue = getKeyValue(today);
	console.log("first" + keyValue);
	
	function showCalendar(){
	    let monthCnt = 100;
	    let cnt = 1;
	    for(var i = 0; i < 6; i++){
	        var $tr = document.createElement('tr');
	        $tr.setAttribute('id', monthCnt);   
	        for(var j = 0; j < 7; j++){
	            if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
	                var $td = document.createElement('td');
	                $tr.appendChild($td);     
	            }else{
	                var $td = document.createElement('td');
	                $td.textContent = cnt;
	                $td.setAttribute('id', getKeyValue(new Date(first.getFullYear(), first.getMonth(), cnt)));
	                if(j === 0){
	                	$td.style.color='red';
	                } else if(j === 6) {
	                	$td.style.color='blue';
	                }
	                $tr.appendChild($td);
	                cnt++;
	            }
		        /* console.log($td.getAttribute('id')) */
	        }
	        monthCnt++;
	        calendarBody.appendChild($tr);
	    }
        currentTitle.innerHTML = monthList[first.getMonth()] + "월" + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear() + ' 년';
	}
	showCalendar();
	
	function removeCalendar(){
	    let catchTr = 100;
	    for(var i = 100; i< 106; i++){
	        var $tr = document.getElementById(catchTr);
	        $tr.remove();
	        catchTr++;
	    }
	}
	function prev(){
	    if(pageFirst.getMonth() === 1){
	        pageFirst = new Date(first.getFullYear()-1, 12, 1);
	        first = pageFirst;
	        if(first.getFullYear() % 4 === 0){
	            pageYear = leapYear;
	        }else{
	            pageYear = notLeapYear;
	        }
	    }else{
	        pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
	        first = pageFirst;
	    }
	    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	    currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
	    removeCalendar();
	    showCalendar();
	    keyValue = getKeyValue(today);
	    clickedDate1 = document.getElementById(getKeyValue(today));
	    clickedDate1.classList.add('active');
	    clickStart();
	    holidayCheck();
	}
	
	function next(){
	    if(pageFirst.getMonth() === 12){
	        pageFirst = new Date(first.getFullYear()+1, 1, 1);
	        first = pageFirst;
	        if(first.getFullYear() % 4 === 0){
	            pageYear = leapYear;
	        }else{
	            pageYear = notLeapYear;
	        }
	    }else{
	        pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
	        first = pageFirst;
	    }
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;'+ first.getFullYear();
	    removeCalendar();
	    showCalendar();
	    keyValue = getKeyValue(today);
	    clickedDate1 = document.getElementById(getKeyValue(today));
	    clickedDate1.classList.add('active');
	    clickStart();
	    holidayCheck();
	}
	var clickedDate1 = document.getElementById(getKeyValue(today));
	clickedDate1.classList.add('active');
	/* console.log("check : " + clickedDate1.id); */
	var prevBtn = document.getElementById('prev');
	var nextBtn = document.getElementById('next');
	prevBtn.addEventListener('click',prev);
	nextBtn.addEventListener('click',next);
	var tdGroup = [];
	
	function clickStart(){
	    for(let i = 0; i < pageYear[first.getMonth()]; i++){
	        tdGroup[i] = document.getElementById(getKeyValue(new Date(first.getFullYear(), first.getMonth(), (i+1))));
	        tdGroup[i].addEventListener('click',changeToday);
	    }
	}
	clickStart();
	console.log(tdGroup);
	function changeToday(e){
	    for(let i = 0; i < pageYear[first.getMonth()]; i++){
	        if(tdGroup[i].classList.contains('active')){
	            tdGroup[i].classList.remove('active');
	        }
	    }
	    clickedDate1 = e.currentTarget;
	    clickedDate1.classList.add('active');
	    today = new Date(clickedDate1.id.substring(0,4), (clickedDate1.id.substring(5,7) - 1), clickedDate1.id.substring(8,10));
	    console.log(today);
	    /* keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate(); */
	    keyValue = getKeyValue(today);
		console.log("keyValue : " + keyValue);
		console.log("id : " + clickedDate1.id);
	}
	
	function holidayCheck(){
		for(var j = 0; j < tdGroup.length; j++){
			for(var i = 0; i < holidayList.length; i++){
				if(holidayList[i].holidayDate == tdGroup[j].id){
					var $td = document.getElementById(tdGroup[j].id);
					var $div = document.createElement('div');
					$td.style.color = 'red';
					$div.textContent = holidayList[i].name;
					$td.append($div);
				} else {
					
				}
			}
			if (tdGroup[j].id == "2020-01-01"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "신정";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-01-24" || tdGroup[j].id == "2020-01-25" || tdGroup[j].id == "2020-01-26"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "구정";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-03-01"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "3.1절";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-04-30"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "석가탄신일";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-05-05"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "어린이날";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-06-06"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "현충일";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-08-15"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "광복절";
				$td.append($div);
			} else if(tdGroup[j].id == "2020-09-30" || tdGroup[j].id == "2020-10-01" || tdGroup[j].id == "2020-10-02"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "추석";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-10-03"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "개천절";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-10-09"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "한글날";
				$td.append($div);
			} else if (tdGroup[j].id == "2020-12-25"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "크리스마스";
				$td.append($div);
			} else if (tdGroup[j].id == "2021-01-01"){
				var $td = document.getElementById(tdGroup[j].id);
				var $div = document.createElement('div');
				$td.style.color = 'red';
				$div.textContent = "신정";
				$td.append($div);
			}
		}
	}
	holidayCheck();
</script>
</html>