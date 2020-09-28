<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	aside {
	    display:block; 
	    height: 100vh;
	    order: 1;
	    width: 220px;
	    padding: 2em;
	    background: white;
		color:black;
		font-weight : normal;
	}
	#aside-body {
		
		color: black;
		overflow: auto;
		overflow-x: hidden;
	}
	#aside-body a {
		text-decoration:none;
		color: black;
	}
	#aside-body p {
		text-align: center;
	}
	.list {
		padding: 0;
		list-style: none;
		text-align: center;
	}
	.bluebar {
		display: inline-block;
		width: 364px;
		height: 18px;
		background: #2E2C8F;
	}
	p.title {
		width: 100%;
		box-sizing: border-box;
		margin-top: 10px;
		margin-bottom: 15px;
		margin-left: 0px;
		padding: 5px;
	}
	.con {
		padding-left: 35px;
		display: none;
		text-align: left;
		list-style: none;
	}
	.con>li {
		margin-top: 15px;
		margin-bottom: 10px;
	}
	p.title:hover, .con>li:hover {
		cursor: pointer;
		color: #2E2C8F;
		font-weight: bolder;
	}
	#aside-body::-webkit-scrollbar {
		width: 5px;
		padding-top: 10px;
	}
	#aside-body::-webkit-scrollbar-thumb {
		background-color: #D9D9D9;
		border-radius: 3px;
	}
</style>
</head>
<body>
	<aside>
        <div id="aside-body">
        
        	<ul class="list">
        		<li>	<!-- 회사 정보 관리 start -->
        			<div class="bluebar"></div>
        			<p class="title">회사 정보 관리</p>
        			<ul class="con">
        				<li><a href="basicInfo.cp">기초 사항</a></li>
        				<li><a href="additionalInfo.cp">추가 사항</a></li>
        				<li><a href="managerInfo.cp">회사 담당자</a></li>
        			</ul>
        		</li>	<!-- 회사 정보 관리 end -->
        		<li>	<!-- 기초코드 start -->
        			<div class="bluebar"></div>
        			<p class="title">기초코드</p>
        			<ul class="con">
        				<li><a href="payStep.bc">호봉 코드</a></li>
        				<li><a href="location.bc">지역 코드</a></li>
        				<li><a href="position.bc">직급 코드</a></li>
        				<li><a href="rspofc.bc">직책 코드</a></li>
        				<li><a href="education.bc">교육 코드</a></li>
        				<li><a href="license.bc">자격 면허 코드</a></li>
        			</ul>
        		</li>	<!-- 기초코드 end -->
        		<li>	<!-- 부서설정 start -->
        			<div class="bluebar"></div>
        			<p class="title">부서설정</p>
        			<ul class="con">
        				<li><a href="deptset.or">부서 설정</a></li>
        			</ul>
        		</li>	<!-- 부서설정 end -->
        		<li>	<!-- 권한설정 start -->
        			<div class="bluebar"></div>
        			<p class="title">권한설정</p>
        			<ul class="con">
        				<li><a href="loadDeptAuth.cp">부서별 권한 설정</a></li>
        				<li><a href="loadEmpAuth.cp">계정별 권한 설정</a></li>
        				<li><a href="loadCustomAuth.cp">사용자 정의 권한 설정</a></li>
        			</ul>
        		</li>	<!-- 권한설정 end -->
        		<li>	<!-- 연말결산 start -->
        			<div class="bluebar"></div>
        			<p class="title">연말결산</p>
        			<ul class="con">
        				<li><a>연말 결산</a></li>
        			</ul>
        		</li>	<!-- 연말결산 end -->
        		<li>	<!-- 계정 생성 start -->
        			<div class="bluebar"></div>
        			<p class="title">계정 생성</p>
        			<ul class="con">
        				<li><a href="showAccount.cp">사용자 계정 생성</a></li>
        			</ul>
        		</li>	<!-- 계정 생성 end -->
        		<li>	<!-- 근태 기본 정책 설정 start -->
        			<div class="bluebar"></div>
        			<p class="title">근태 기본 정책 설정</p>
        			<ul class="con">
        				<li><a href="selectBaseSetting.att">근태 정책</a></li>
        				<li><a href="selectHolidaySetting.att">휴일 설정</a></li>
        				<li><a href="selectVacationSetting.att">휴가 설정</a></li>
        			</ul>
        		</li>	<!-- 근태 기본 정책 설정 end -->
        		<li>	<!-- 급여설정 start -->
        			<div class="bluebar"></div>
        			<p class="title">급여 설정</p>
        			<ul class="con">
        				<li><a href="selectProvisionAndDeductionSetting.rwd">지급&nbsp;/&nbsp;공제 사항 설정</a></li>
        				<li><a href="selectSalarySetting.rwd">기본 급여 설정</a></li>
        			</ul>
        		</li>	<!-- 급여설정 end -->
        	</ul>
        	
        </div>	<!-- aside-body end -->
	</aside>
	
	<script type="text/javascript">
		$("p.title").on('click', function(){
			$(".con").not($(this).next(".con").slideToggle(300)).slideUp();
		});
	</script>
</body>
</html>