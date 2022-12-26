<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</style>
    <link rel="stylesheet" href="/css/mypage.css"/>
<head>
<title>Insert title here</title>
</head>
<body>
<div class="background">
	<div class="outerbox">
		<div class="wrapper">
			<div class="wrapper_left">
				<div class="wrapper_left_header">
					<div class="hello">
					   <a href="/chan/main"><span>요</span>리초보를 위한 <span>요</span>리비책</a>
					</div>
				</div>
				<div class="wrapper_left_body">
					<div class="header">
						<div class="profile">
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</div>
						</div>
					</div>
					<div class="footer">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
						<button onclick = "location.href ='/admin/admain' ">관리자 페이지</button>
					</sec:authorize>		
						<div class="feelWrapper">
							<div class="feel">오늘의 기분</div>
							<select class="feelSelect">
                            	<option>기쁨 😀</option>
                                <option>슬픔 😭</option>
                                <option>분노 😡</option>
                               	<option>행복 😊</option>
                                <option>귀찮 😒</option>
                         	</select>	
						</div>
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						<sec:authentication property = "principal.user.nickname"></sec:authentication>의 마이페이지
					</div>
					<div class="wrapper_right_setting">
						<a href="/tae/userupdate">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper__body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title">계정 정보</span>
                				</div>
                				<div class="line2"></div>
               					<div class="myaccount">
               						<span>이름: </span><sec:authentication property = "principal.user.name"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>아이디: </span><sec:authentication property = "principal.user.userid"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>이메일: </span><sec:authentication property = "principal.user.email"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>활동명: </span><sec:authentication property = "principal.user.nickname"></sec:authentication><br>
               					</div>
               					<div class="myaccount">
               						<span>주소: </span><sec:authentication property = "principal.user.address"></sec:authentication><br>
               					</div>
            				</div>
        				</div>
   					 </div>     
                  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>